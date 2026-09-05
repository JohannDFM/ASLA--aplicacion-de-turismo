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
    child: Image.asset(
  'assets/images/montañas.png',
  fit: BoxFit.fitWidth,
  alignment: Alignment.bottomCenter,
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


