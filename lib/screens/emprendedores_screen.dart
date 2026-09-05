import 'package:flutter/material.dart';
import '../screen_background.dart';
import 'onboarding_screen.dart';

 class EmprendedoresScreen extends StatelessWidget {
  const EmprendedoresScreen({super.key});

  void _onCompradorTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Próximamente'),
        content: const Text('La sección de Comprador todavía está en construcción.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),
              const SizedBox(height: 24),
              const Text(
                'SOS',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  letterSpacing: 2,
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    _RoleButton(
                      label: 'Emprendedor',
                      color: const Color(0xFFE05A6B),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _RoleButton(
                      label: 'Comprador',
                      color: const Color(0xFF1F3B4D),
                      onTap: () => _onCompradorTap(context),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _RoleButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 3,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}