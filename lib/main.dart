import 'package:flutter/material.dart';
import 'auth_options_screen.dart';

void main() {
  runApp(const AslaApp());
}

class AslaApp extends StatelessWidget {
  const AslaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASLA',
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // =====================================================
          // IMAGEN DE FONDO
          // =====================================================
          Image.asset(
            'assets/images/fondo_inicio.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: const Color(0xFF1A3A4A),
              );
            },
          ),

          // =====================================================
          // CAPA OSCURA
          // =====================================================
          Container(
            color: Colors.black.withValues(alpha: 0.45),
          ),

          // =====================================================
          // CONTENIDO
          // =====================================================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  const Spacer(flex: 2),

                  // LOGO
                  Image.asset(
                    'assets/images/logo_asla.png',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.location_on,
                        size: 110,
                        color: Color(0xFF00A8E8),
                      );
                    },
                  ),

                  const SizedBox(height: 6),

                  // NOMBRE
                  const Text(
                    'ASLA',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // SUBTÍTULO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 16, height: 1, color: Colors.white),
                      const SizedBox(width: 8),
                      const Text(
                        'Explora conectado',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(width: 16, height: 1, color: Colors.white),
                    ],
                  ),

                  const Spacer(flex: 1),

                  // BOTÓN COMENZAR AVENTURA
                  SizedBox(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AuthOptionsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006D7A),
                        foregroundColor: Colors.white,
                        elevation: 5,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.explore_outlined, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Comenzar Aventura',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),

                  // CARACTERÍSTICAS INFERIORES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      _Caracteristica(
                        icono: Icons.location_on,
                        texto: 'Descubre\nlugares\nincreíbles',
                      ),
                      _Caracteristica(
                        icono: Icons.landscape,
                        texto: 'Explora sin\nlímites',
                      ),
                      _Caracteristica(
                        icono: Icons.people,
                        texto: 'Conéctate\ncon viajeros',
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================
// WIDGET DE CARACTERÍSTICAS
// =============================================================
class _Caracteristica extends StatelessWidget {
  final IconData icono;
  final String texto;

  const _Caracteristica({
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icono,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 5),
          Text(
            texto,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}