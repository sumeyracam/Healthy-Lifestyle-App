import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Recipe/components/main_drawer.dart';
import 'package:flutter_app/Screens/Recipe/models/meal.dart';
import 'package:flutter_app/Screens/Recipe/screens/categories_screen.dart';
import 'package:flutter_app/Screens/Recipe/screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen({
    required this.favoriteMeals,
    Key? key,
  }) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const CategoriesScreen(),
      FavoriteScreen(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];
  }

  final List<String> _tabTitles = [
    'Categories',
    'Favorites',
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabTitles[_selectedScreenIndex]),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        
          iconSize: 20,
          onTap: _selectScreen,
          backgroundColor: const Color.fromARGB(255, 228, 115, 153),
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
