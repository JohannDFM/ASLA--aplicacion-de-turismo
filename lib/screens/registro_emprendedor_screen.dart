import 'package:flutter/material.dart';
import 'category_selection_screen.dart'; // Importante para reconocer la clase

class RegistroEmprendedorScreen extends StatelessWidget {
  const RegistroEmprendedorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colores de la interfaz
        const inputBackgroundColor = Color(0xFFFFFAED);
    const buttonColor = Color(0xFFF8A2A8);

    return Scaffold(
      body: Container(
        // Fondo de la pantalla
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/emprendedores.png'), // <-- cambia por tu imagen
            fit: BoxFit.cover,
          ),
          // Si prefieres mantener el color sólido en vez de imagen, comenta
          // la línea de "image" de arriba y descomenta esta:
          // color: backgroundColor,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Barra superior simulada
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(Icons.signal_cellular_alt),
                        SizedBox(width: 5),
                        Icon(Icons.wifi),
                        SizedBox(width: 5),
                        Icon(Icons.battery_full),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Título
                const Text(
                  '¡Bienvenido, emprendedor!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Formulario en tarjeta blanca
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildInputField('Nombre del propietario', inputBackgroundColor),
                      const SizedBox(height: 15),
                      _buildInputField('Nombre del negocio', inputBackgroundColor),
                      const SizedBox(height: 15),
                      _buildInputField(
                        'Descripción',
                        inputBackgroundColor,
                        maxLines: 4,
                        showCounter: true,
                      ),
                      const SizedBox(height: 15),
                      _buildInputField('Teléfono', inputBackgroundColor, keyboardType: TextInputType.phone),
                      const SizedBox(height: 15),
                      _buildInputField('Dirección', inputBackgroundColor),
                      const SizedBox(height: 15),

                      // Botón Subir Imágenes
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Imágenes', style: TextStyle(fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: inputBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.file_upload_outlined, color: Colors.black87),
                              label: const Text('Subir imágenes', style: TextStyle(color: Colors.black87)),
                              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Botón Siguiente
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategorySelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Siguiente',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    Color backgroundColor, {
    int maxLines = 1,
    bool showCounter = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              TextField(
                maxLines: maxLines,
                keyboardType: keyboardType,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
              if (showCounter)
                Positioned(
                  bottom: 8,
                  right: 12,
                  child: Text(
                    '0/200',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}