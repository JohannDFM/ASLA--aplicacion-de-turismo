import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'main.screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/logo_asla.png',
                height: 90,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.location_on,
                    size: 80,
                    color: Color(0xFF00A8E8),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'ASLA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A3A4A),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '— Explora conectado —',
                style: TextStyle(fontSize: 14, color: Color(0xFF5A7A8A)),
              ),
              const SizedBox(height: 36),
              const Text(
                '¡Bienvenido!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A3A4A),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Ingresa para continuar tu aventura',
                style: TextStyle(fontSize: 14, color: Color(0xFF5A7A8A)),
              ),
              const SizedBox(height: 32),

              // Correo
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Correo',
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Color(0xFF006D7A)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Contraseña
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFF006D7A)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 28),

              // Botón
             SizedBox(
  width: double.infinity,
  height: 52,
  child: ElevatedButton(
    onPressed: () {
      // Aquí luego se debe validar el correo/contraseña contra
      // tu backend/auth antes de navegar. Por ahora navega
      // directo a la interfaz principal con las 4 pestañas.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),   // <- aquí quita el "const"
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF008B8B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 4,
    ),
    child: const Text(
      'Iniciar Sesión',
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.white,
               ), // SizedBox
            ), // children
          ), // Column
        ), // SingleChildScrollView
            ], // SafeArea
    ) // Scaffold
  }
}