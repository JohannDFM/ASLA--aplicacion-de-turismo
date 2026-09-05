import 'package:flutter/material.dart';
class ScreenBackground extends StatelessWidget {
  final Widget child;

  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/emprendedores.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  final List<_Categoria> _categorias = const [
    _Categoria('Restaurante', Icons.restaurant),
    _Categoria('Accesorios', Icons.watch),
    _Categoria('Skincare', Icons.spa),
    _Categoria('Lácteos', Icons.icecream),
    _Categoria('Ropa', Icons.checkroom),
    _Categoria('Manualidades', Icons.handyman),
    _Categoria('Cerámica', Icons.coffee),
    _Categoria('Panadería', Icons.bakery_dining),
    _Categoria('Mascotas', Icons.pets),
    _Categoria('Maquillaje', Icons.brush),
    _Categoria('Tecnología', Icons.devices),
    _Categoria('Cafetería', Icons.local_cafe),
  ];

  final Set<String> _seleccionadas = {};

  void _toggle(String nombre) {
    setState(() {
      if (_seleccionadas.contains(nombre)) {
        _seleccionadas.remove(nombre);
      } else {
        _seleccionadas.add(nombre);
      }
    });
  }

  void _confirmar() {
    if (_seleccionadas.isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Negocio registrado con éxito!')),
    );
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      extendBodyBehindAppBar: true,
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text(
                  'Tipo de Negocio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Selecciona una o varias categorías',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _categorias.map((cat) {
                        final selected = _seleccionadas.contains(cat.nombre);
                        return _CategoryChip(
                          categoria: cat,
                          selected: selected,
                          onTap: () => _toggle(cat.nombre),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _confirmar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE05A6B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Confirmar', style: TextStyle(fontSize: 16)),
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
}

class _Categoria {
  final String nombre;
  final IconData icono;
  const _Categoria(this.nombre, this.icono);
}

class _CategoryChip extends StatelessWidget {
  final _Categoria categoria;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.categoria,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1F3B4D) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? const Color(0xFF1F3B4D) : Colors.black12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              categoria.icono,
              size: 18,
              color: selected ? Colors.white : Colors.black54,
            ),
            const SizedBox(width: 6),
            Text(
              categoria.nombre,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black87,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}