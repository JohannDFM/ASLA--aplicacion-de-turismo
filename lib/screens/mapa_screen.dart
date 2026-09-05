import 'package:flutter/material.dart';

class MapaScreen extends StatelessWidget {
  const MapaScreen({super.key});

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
                          BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              blurRadius: 6,
                              offset: const Offset(0, 2)),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Explorar león',
                          prefixIcon:
                              Icon(Icons.search, color: Color.fromARGB(255, 162, 82, 20)),
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
            // de León, Nicaragua, o bien usar la imagen ilustrada como fondo
            // fijo con los puntos de interés marcados encima.
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFDCE6E9),
                child: Stack(
                  children: [
                    // Fondo ilustrado del mapa. Coloca tu imagen en
                    // assets/images/mapa_leon.png y decláralo en
                    // pubspec.yaml (o dentro de la carpeta assets/images/
                    // si ya la tienes declarada completa).
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/mapa.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Mientras no exista la imagen, se muestra un
                          // ícono de referencia en vez de romper la app.
                          return const Center(
                            child: Icon(Icons.map_outlined,
                                size: 64, color: Color(0xFFB7C6CB)),
                          );
                        },
                      ),
                    ),
                    _buildPin(
                        top: 60,
                        left: 90,
                        icon: Icons.church_outlined,
                        label: 'Catedral de León'),
                    _buildPin(
                        top: 130,
                        left: 210,
                        icon: Icons.museum_outlined,
                        label: 'Centro Cultural'),
                    _buildPin(
                        top: 220,
                        left: 60,
                        icon: Icons.theater_comedy_outlined,
                        label: 'Teatro Municipal'),
                    _buildPin(
                        top: 300,
                        left: 180,
                        icon: Icons.park_outlined,
                        label: 'Parque Central'),
                    _buildPin(
                        top: 380,
                        left: 100,
                        icon: Icons.account_balance_outlined,
                        label: 'UNAN León'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPin({
    required double top,
    required double left,
    required IconData icon,
    required String label,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00A8E8),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(color: Colors.black38, blurRadius: 4),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
          const SizedBox(height: 4),
          Container(
            constraints: const BoxConstraints(maxWidth: 110),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 3),
              ],
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A3A4A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}