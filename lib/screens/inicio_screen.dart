import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Positioned.fill(
        child: Image.asset(
          'assets/images/fondo.png', // ajusta el nombre exacto
          fit: BoxFit.cover,
        ),
      ),
      SafeArea(
         child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSectionTitle('Actividades'),
              const SizedBox(height: 10),
              _buildActividadCard(),
              const SizedBox(height: 22),
              _buildSectionTitle('Saberes'),
              const SizedBox(height: 10),
              _buildSaberesRow(),
              const SizedBox(height: 22),
              _buildSectionTitle('Eventos'),
              const SizedBox(height: 10),
              _buildEventoCard(),
            ],
          ),
        ),
      ),
    ],
  ),
);  
}
  

  Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Color(0xFF1A3A4A),
                  child: Icon(Icons.person, color: Colors.white, size: 28),
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            const Flexible(
              child: Text(
                'Granadino, Fino y platudo',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A3A4A),
                ),
              ),
            ),
          ],
        ),
      ),
      efeVolcan(),
    ],
  );

}
  Widget efeVolcan() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Image.asset(
        'assets/images/volcan.png', // verifica que el nombre coincida exactamente (minúsculas)
        width: 78,
        height: 78,
      ),
      Positioned(
        top: -2,
        right: -2,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          child: const Text(
            '10',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
  

 Widget _buildSectionTitle(String title) {
  return SizedBox(
    width: double.infinity,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A3A4A),
      ),
    ),
  );
}

  Widget _buildActividadCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Container(
           height: 150,
           width: double.infinity,
             decoration: const BoxDecoration(
             image: DecorationImage(
             image: AssetImage('assets/images/visita.png'), 
               fit: BoxFit.cover,
    ),
  ),
),
          Positioned(
            top: 6,
            left: 6,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ImageIcon(const AssetImage('assets/images/animal.png'),
              color: Colors.white,
              size: 35,
),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                'León',
                style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 55,
            child: const Text(
              'Visitar el museo y tomarte una foto con una pintura',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                shadows: [Shadow(blurRadius: 4, color: Colors.black54)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaberesRow() {
    return Row(
      children: [
        Expanded(
          child: _buildSaberCard(
            title: 'TRADICIONES',
            imagePath: 'assets/images/Saberes1.jpg', // Ajusta el nombre de la imagen
            progress: 0.01,
            progressText: '1%',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildSaberCard(
            title: 'HISTORIA',
            imagePath: 'assets/images/Saberes2.jpg', // Ajusta el nombre de la imagen
            progress: 0.05,
            progressText: '5%',
          ),
        ),
      ],
    );
  }

  Widget _buildSaberCard({
    required String title,
    required String imagePath,
    required double progress,
    required String progressText,
  }) {
    const Color orangeColor = Color(0xFFF08A6C);

    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Imagen de Fondo
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Sombreado para resaltar el texto
            Positioned.fill(
              child: Container(
                
              ),
            ),
            // Contenido
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Título
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.5,
                      shadows: [Shadow(blurRadius: 4, color: Colors.black87)],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Barra de Progreso con porcentaje
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Row(
                      children: [
                        // Chip del porcentaje
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Text(
                            progressText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // Progreso activo si es mayor a 0
                        if (progress > 0)
                          Expanded(
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: progress,
                              child: Container(
                                height: double.infinity,
                                color: orangeColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildEventoCard() {
  return SizedBox(
    height: 180, // Forzamos la altura definida del contenedor
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand, // Asegura que los hijos ocupen todo el espacio
        children: [
          // 1. Imagen de fondo
          Image.asset(
            'assets/images/feria.png', // Revisa que este nombre coincida con tu carpeta assets
            fit: BoxFit.cover,
          ),
          
          // 2. Capa oscura para dar contraste
          Container(
            color: Colors.black.withValues(alpha: 0.3),
          ),

          // 3. Badge de fecha (Esquina superior izquierda)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFE84A5F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '15 AGT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 4. Texto y Botón alineados abajo
          Positioned(
            left: 0,
            right: 0,
            bottom: 16, // Controla qué tan abajo quedan el título y el botón
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Feria Ganadera',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 4, color: Colors.black87)],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 140,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0F8FA9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Agendar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}