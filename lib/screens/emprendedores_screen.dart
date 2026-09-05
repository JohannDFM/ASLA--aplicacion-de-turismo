import 'package:flutter/material.dart';

class EmprendedoresScreen extends StatelessWidget {
  const EmprendedoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EEF1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 6, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Explorar león',
                          prefixIcon: Icon(Icons.search, color: Color(0xFF5A7A8A)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF1A3A4A),
                    child: Icon(Icons.person, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
            // Área del mapa. Aquí se debe integrar google_maps_flutter (o el
            // paquete de mapas que use el proyecto) apuntando a coordenadas
            // de León, Nicaragua. Por ahora se deja un contenedor de
            // referencia con los puntos de interés marcados.
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFDCE6E9),
                child: Stack(
                  children: [
                    const Center(
                      child: Icon(Icons.map_outlined, size: 64, color: Color(0xFFB7C6CB)),
                    ),
                    _buildPin(top: 60, left: 90, icon: Icons.church_outlined, label: 'Catedral de León'),
                    _buildPin(top: 130, left: 210, icon: Icons.museum_outlined, label: 'Centro Cultural'),
                    _buildPin(top: 220, left: 60, icon: Icons.theater_comedy_outlined, label: 'Teatro Municipal'),
                    _buildPin(top: 300, left: 180, icon: Icons.park_outlined, label: 'Parque Central'),
                    _buildPin(top: 380, left: 100, icon: Icons.account_balance_outlined, label: 'UNAN León'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPin({required double top, required double left, required IconData icon, required String label}) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00A8E8),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: const Color.fromARGB(255, 0, 0, 0), blurRadius: 4)],
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}