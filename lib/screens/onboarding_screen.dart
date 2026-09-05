import 'package:flutter/material.dart';
import 'registro_emprendedor_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  bool _navegando = false;

  final List<_OnboardData> _pages = const [
    _OnboardData(
      imagen: 'assets/images/emprendedores2.png',
      titulo: '¡Bienvenido, emprendedor!',
      subtitulo: 'Tu talento impulsa la economía\ncreativa de Nicaragua',
      pie: 'Hecho en Nicaragua, compartido con el mundo',
    ),
    _OnboardData(
      imagen: 'assets/images/emprendedores2.png',
      titulo: '¡Bienvenido, emprendedor!',
      subtitulo: 'Crea, conecta y haz crecer tu\nemprendimiento',
      pie: 'Tu negocio forma parte de la identidad de tu ciudad',
    ),
    _OnboardData(
      imagen: 'assets/images/emprendedores2.png',
      titulo: '¡Bienvenido, emprendedor!',
      subtitulo: 'Cada producto cuenta una\nhistoria; la tuya comienza aquí',
      pie: 'Innovar es crear oportunidades para la comunidad',
    ),
  ];

  void _irARegistro() {
    if (_navegando) return; // evita disparar la navegación más de una vez
    _navegando = true;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegistroEmprendedorScreen()),
    );
  }

  void _avanzar() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      _irARegistro();
    }
  }

  void _retroceder() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final velocidad = details.primaryVelocity ?? 0;
    const umbral = 200; // qué tan fuerte debe ser el swipe para contar
    if (velocidad < -umbral) {
      _avanzar(); // deslizó hacia la izquierda -> siguiente
    } else if (velocidad > umbral) {
      _retroceder(); // deslizó hacia la derecha -> anterior
    }
  }

  /// Indicador de 3 segmentos, todos verdes: el de la página actual se
  /// alarga y los demás quedan como puntos pequeños. Se anima suavemente
  /// cada vez que cambia _currentPage.
  Widget _buildProgressBar() {
    const Color verde = Color(0xFF7ED9A6);
    const double height = 6;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_pages.length, (i) {
        final active = i == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 48 : 10,
          height: height,
          decoration: BoxDecoration(
            color: verde,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  Widget _buildPageContent(BuildContext context, _OnboardData data) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      key: ValueKey(data.imagen),
      fit: StackFit.expand,
      children: [
        // Ilustración de fondo (ocupa toda la pantalla)
        Image.asset(
          data.imagen,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Si la imagen no se encuentra, se ve un color sólido
            // en vez de que la app truene.
            return Container(color: const Color(0xFF3A5A5E));
          },
        ),
        // Texto superpuesto sobre la ilustración
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.30),
                Text(
                  data.titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  data.subtitulo,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 18),
                Align(
                  alignment: Alignment.center,
                  child: _buildProgressBar(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    data.pie,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = _pages[_currentPage];

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _avanzar,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 450),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            // Fade + un ligero acercamiento (zoom sutil) para que la
            // transición se sienta más pulida, sin deslizamiento lateral.
            final scaleTween = Tween<double>(begin: 0.97, end: 1.0);
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: scaleTween.animate(animation),
                child: child,
              ),
            );
          },
          child: _buildPageContent(context, data),
        ),
      ),
    );
  }
}

class _OnboardData {
  final String imagen;
  final String titulo;
  final String subtitulo;
  final String pie;
  const _OnboardData({
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
    required this.pie,
  });
}