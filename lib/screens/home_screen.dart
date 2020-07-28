import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/widgets/category_selector.dart';
import 'package:flutter_chat_ui_starter/widgets/favorite_contacts.dart';
import 'package:flutter_chat_ui_starter/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //Appbar==================================================================
      appBar: AppBar(
        //Botão de menu=========================================================
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        //Botão de menu=========================================================
        //Título do appBar======================================================
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        //Título do appBar======================================================
        elevation: 0.0,
        //Parte direita do appBar===============================================
        actions: <Widget>[
          //Botão de procurar===================================================
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          //Botão de procurar===================================================
        ],
        //Parte direita do appBar===============================================
      ),
      //Appbar==================================================================
      //Coluna que ocupa a tela inteira=========================================
      body: Column(
        children: <Widget>[
          //Seletor de categoria separado em outra classe=======================
          CategorySelector(),
          //Seletor de categoria separado em outra classe=======================
          //Parte inferior onde Expanded ocupa todo o restante da tela==========
          Expanded(
            child: Container(
              //Decoração com bordas circulares=================================
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              //Decoração com bordas circulares=================================
              //Separando em uma coluna que ocupa a largura inteira=============
              child: Column(
                children: <Widget>[
                  //Widget de contatos favoritos separado em outra classe=======
                  FavoriteContacts(),
                  //Widget de contatos favoritos separado em outra classe=======
                  //Widget para conversas recentes separado em outra classe=====
                  RecentChats(),
                  //Widget para conversas recentes separado em outra classe=====
                ],
              ),
              //Separando em uma coluna que ocupa a largura inteira=============
            ),
          ),
          //Parte inferior onde Expanded ocupa todo o restante da tela==========
        ],
      ),
      //Coluna que ocupa a tela inteira=========================================
    );
  }
}
