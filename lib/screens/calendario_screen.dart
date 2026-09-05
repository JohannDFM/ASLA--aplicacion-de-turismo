import 'package:flutter/material.dart';

class CalendarioScreen extends StatefulWidget {
  const CalendarioScreen({super.key});

  @override
  State<CalendarioScreen> createState() => _CalendarioScreenState();
}

class _CalendarioScreenState extends State<CalendarioScreen> {
  String _filtroSeleccionado = 'Todos';
  int _diaSeleccionado = 15;

  final List<Map<String, String>> _dias = const [
    {'dia': 'Jue', 'num': '13'},
    {'dia': 'Mie', 'num': '14'},
    {'dia': 'Vie', 'num': '15'},
    {'dia': 'Sab', 'num': '16'},
    {'dia': 'Dom', 'num': '17'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E9D2),
      body: Stack(
        children: [
          // Fondo con la silueta de León (catedral/volcán), semitransparente
          // para que no compita con el texto. Coloca tu imagen en
          // assets/images/fondo_leon.png.
          Positioned.fill(
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                'assets/images/fondo2.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  // Mientras no exista la imagen, no se rompe la pantalla.
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 6),
                  const Text(
                    'Descubre eventos creativos y tecnológicos hoy.',
                    style: TextStyle(fontSize: 13, color: Color(0xFF5A7A8A)),
                  ),
                  const SizedBox(height: 16),
                  _buildFiltros(),
                  const SizedBox(height: 22),
                  const Text(
                    'Agosto 2026',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A3A4A)),
                  ),
                  const SizedBox(height: 12),
                  _buildSelectorDias(),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      const Text(
                        'Eventos 15 Agosto',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A3A4A)),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF008B8B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text('1 Evento',
                            style: TextStyle(
                                color: Colors.white, fontSize: 11)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
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
        const Text(
          'Agenda Creativa',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A3A4A)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF00A8E8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.emoji_events_outlined, color: Colors.white, size: 14),
              SizedBox(width: 4),
              Text('León', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFiltros() {
    final filtros = [
      {'label': 'Todos', 'icon': Icons.grid_view_rounded},
      {'label': 'Taller', 'icon': Icons.brush_outlined},
      {'label': 'Venta', 'icon': Icons.sell_outlined},
    ];
    return Row(
      children: filtros.map((f) {
        final label = f['label'] as String;
        final isSelected = _filtroSeleccionado == label;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () => setState(() => _filtroSeleccionado = label),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF008B8B) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(f['icon'] as IconData, size: 15, color: isSelected ? Colors.white : const Color(0xFF5A7A8A)),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : const Color(0xFF1A3A4A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSelectorDias() {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _dias.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final dia = _dias[index];
          final numDia = int.parse(dia['num']!);
          final isSelected = _diaSeleccionado == numDia;
          return GestureDetector(
            onTap: () => setState(() => _diaSeleccionado = numDia),
            child: Container(
              width: 54,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFF4B942) : Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(color: Colors.black, blurRadius: 4, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dia['dia']!, style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A8A))),
                  const SizedBox(height: 4),
                  Text(
                    dia['num']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : const Color(0xFF1A3A4A),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventoCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Foto real del evento en vez del color sólido.
              // Coloca tu imagen en assets/images/feria_ganadera.png.
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/feria.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: const Color(0xFF6B7B4A));
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8734A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Feria Ganadera', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, color: Colors.white, size: 12),
                      SizedBox(width: 4),
                      Text('3:00 AM', style: TextStyle(color: Colors.white, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'FERIA GANADERA AGOSTINA',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1A3A4A)),
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14, color: Color(0xFF5A7A8A)),
                    SizedBox(width: 4),
                    Text('León, Nicaragua', style: TextStyle(fontSize: 12, color: Color(0xFF5A7A8A))),
                    SizedBox(width: 10),
                    Icon(Icons.people_outline, size: 14, color: Color(0xFF5A7A8A)),
                    SizedBox(width: 4),
                    Text('Aforo limitado | Gratis', style: TextStyle(fontSize: 12, color: Color(0xFF5A7A8A))),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE8734A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Agendado', style: TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFE8A98C)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Detalles', style: TextStyle(color: Color(0xFFE8734A), fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}