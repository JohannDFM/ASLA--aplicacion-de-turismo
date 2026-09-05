import 'package:flutter/material.dart';
import 'screens/inicio_screen.dart';
import 'screens/mapa_screen.dart';
import 'screens/calendario_screen.dart';
import 'screens/emprendedores_screen.dart';

/// Pantalla principal de la app: contiene los 4 apartados
/// (Inicio, Mapa, Calendario, Emprendedores) conectados por una
/// barra de navegación inferior.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Se usa IndexedStack para que cada pantalla mantenga su estado
  // (scroll, filtros, etc.) al cambiar de pestaña.
  final List<Widget> _screens = const [
    InicioScreen(),
    MapaScreen(),
    CalendarioScreen(),
    EmprendedoresScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF008B8B),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navItem(icon: Icons.location_on_outlined, index: 0), // Inicio
              _navItem(icon: Icons.map_outlined, index: 1), // Mapa
              _navItem(icon: Icons.calendar_month_outlined, index: 2), // Calendario
              _navItem(icon: Icons.rocket_launch_outlined, index: 3), // Emprendedores
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({required IconData icon, required int index}) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 231, 227, 227): Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white70,
          size: 26,
        ),
      ),
    );
  }
}