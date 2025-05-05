import 'package:filme_flix/components/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    required this.child,
    required this.index,
    super.key
  });

  final Widget child;
  final int index;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final tabs = [
    const Tab(text: '/home'),
    const Tab(text: '/search'),
    const Tab(text: '/favorites'),
    const Tab(text: '/settings'),
  ];

  void changePage(int index) {
    final route = tabs[index].text!;
    if (!context.mounted) return;
    context.go(route, extra: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (value) => changePage(value),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        fixedColor: AppColors.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}