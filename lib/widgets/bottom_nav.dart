import 'package:flutter/material.dart';


class BottomNav extends StatelessWidget {
  final List<BottomNavItem> items;
  final int currentIndex;
  final Function(int) onTap;

  BottomNav({
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color.fromRGBO(134, 113, 236, 0.20),
          width: 1.0,
        ),
        gradient: const LinearGradient(
          begin: AlignmentDirectional.bottomStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color.fromRGBO(52, 11, 79, 0.894),
            Color.fromRGBO(255, 255, 255, 0.00),
            Color.fromRGBO(136, 64, 130, 0.50),
            Color.fromRGBO(30, 24, 84, 0.50),
          ],
          stops: [0.0, 0.6414, -2.49, 87.77],
        ),
        backgroundBlendMode: BlendMode.overlay,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(7, 0, 33, 1),
            offset: Offset(0, 20),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          final index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: BottomNavItemWidget(
              icon: item.icon,
              label: item.label,
              isSelected: index == currentIndex,
            ),
          );
        }).toList(),
      ),
    );
  }
}


class BottomNavItem {
  final IconData icon;
  final String label;

  BottomNavItem({
    required this.icon,
    required this.label,
  });
}

class BottomNavItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const BottomNavItemWidget({super.key, 
    required this.icon,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
