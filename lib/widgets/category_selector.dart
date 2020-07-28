import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    //Seletor de categoria (menu horizontal)====================================
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      //Menu horizontal (ListView)==============================================
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          //GestureDetector para que seja capturado gestos da tela==============
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              //Adicionar espaçamento simétrico vertical e horizontal entre cada
              //item do menu======================================================
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              //Adicionar espaçamento simétrico vertical e horizontal entre cada
              //item do menu======================================================
              //Item do menu======================================================
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white60,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              //Item do menu======================================================
            ),
          );
          //GestureDetector para que seja capturado gestos da tela==============
        },
      ),
      //Menu horizontal (ListView)==============================================
    );
    //Seletor de categoria (menu horizontal)====================================
  }
}
