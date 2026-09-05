import 'package:flutter/material.dart';

/// Envuelve cualquier pantalla con la misma imagen de fondo.
/// Úsalo así:
///
/// return Scaffold(
///   body: ScreenBackground(
///     child: SafeArea(
///       child: ...tu contenido...
///     ),
///   ),
/// );
class ScreenBackground extends StatelessWidget {
  final Widget child;

  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/emprendedores.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            // Si la imagen no se encuentra, se ve un color sólido
            // en vez de que la app truene.
            return Container(color: const Color(0xFF3A5A5E));
          },
        ),
        child,
      ],
    );
  }
}