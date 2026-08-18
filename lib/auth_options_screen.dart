import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class AuthOptionsScreen extends StatefulWidget {
  const AuthOptionsScreen({super.key});

  @override
  State<AuthOptionsScreen> createState() => _AuthOptionsScreenState();
}

class _AuthOptionsScreenState extends State<AuthOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Fondo de montañas en la parte inferior
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.32,
              child: CustomPaint(
                painter: _MountainPainter(),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: ConstrainedBox(
                // minHeight = pantalla completa (menos la SafeArea) para que
                // el centrado de abajo tenga contra qué centrarse.
                constraints: BoxConstraints(minHeight: size.height),
                child: Column(
                  // Centra el bloque (logo + tarjeta) verticalmente en vez
                  // de forzarlo a los extremos con spaceBetween/Spacer.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 30),

                        // Logo recoloreado en teal a partir del asset original
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF00A8E8),
                            BlendMode.srcIn,
                          ),
                          child: Image.asset(
                            'assets/images/logo_asla.png',
                            height: 160,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.location_on,
                                size: 320,
                                color: Color(0xFF00A8E8),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),

                        const Text(
                          'ASLA',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 109, 161),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '— Explora conectado —',
                          style:
                              TextStyle(fontSize: 14, color: Color.fromARGB(255, 4, 109, 161)),
                        ),
                      ],
                    ),

                    // Espacio fijo entre el bloque del logo y la tarjeta
                    // de bienvenida. Auméntalo/redúcelo si quieres más o
                    // menos separación.
                    const SizedBox(height: 32),

                    // Tarjeta de bienvenida con botones de acceso
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24, top: 0),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 28,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Al tocar este bloque se navega al login real
                            // (correo y contraseña, en login_screen.dart).
                            InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  children: const [
                                    Text(
                                      '¡Bienvenido!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00A8E8),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Inicia sesión para continuar tu aventura',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF00A8E8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 22),

                            // Botones sin función todavía (a propósito).
                            _SocialButton(
                              label: 'Continuar con Google',
                              icon: Icons.g_mobiledata,
                              backgroundColor: const Color(0xFF1A3A4A),
                              onPressed: null,
                            ),
                            const SizedBox(height: 14),

                            _SocialButton(
                              label: 'Continuar con Facebook',
                              icon: Icons.facebook,
                              backgroundColor: const Color(0xFF00B894),
                              onPressed: null,
                            ),
                            const SizedBox(height: 18),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿No tienes cuenta? ',
                                  style: TextStyle(
                                    color: Color(0xFF5A7A8A),
                                    fontSize: 13,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Regístrate',
                                    style: TextStyle(
                                      color: Color(0xFF00A8E8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Botón de acceso social (Google / Facebook). Si [onPressed] es null,
/// el botón se muestra pero no ejecuta ninguna acción.
class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 22),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

/// Dibuja el paisaje de montañas en capas (estilo banner) que aparece
/// al fondo de la pantalla, inspirado en el mockup de Figma.
class _MountainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final backPaint = Paint()..color = const Color(0xFF6FA8C9);
    final backPath = Path()
      ..moveTo(0, h * 0.55)
      ..lineTo(w * 0.18, h * 0.30)
      ..lineTo(w * 0.35, h * 0.50)
      ..lineTo(w * 0.55, h * 0.20)
      ..lineTo(w * 0.75, h * 0.48)
      ..lineTo(w, h * 0.32)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(backPath, backPaint);

    final midPaint = Paint()..color = const Color(0xFF2C6E8E);
    final midPath = Path()
      ..moveTo(0, h * 0.72)
      ..lineTo(w * 0.22, h * 0.42)
      ..lineTo(w * 0.42, h * 0.65)
      ..lineTo(w * 0.6, h * 0.38)
      ..lineTo(w * 0.82, h * 0.62)
      ..lineTo(w, h * 0.48)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(midPath, midPaint);

    final frontPaint = Paint()..color = const Color(0xFF1A3A4A);
    final frontPath = Path()..moveTo(0, h * 0.86);
    for (double x = 0; x <= w; x += w / 14) {
      final peakY = (x ~/ (w / 14)).isEven ? h * 0.70 : h * 0.82;
      frontPath.lineTo(x, peakY);
    }
    frontPath
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(frontPath, frontPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}