import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/screens/chat_screen.dart';
import '../models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Widget de contatos favoritos==============================================
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          //Seção onde será posicionado o título e o botão à direita==============
          Padding(
            //Espaçamento para centralizar um pouco os elementos
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              //Main axis alignment para deixar o título à esquerda e o botão à
              //direita===========================================================
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Título da seção=================================================
                Text(
                  'Favorite Contacts',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                //Botão do lado do título=========================================
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  iconSize: 30,
                  color: Colors.blueGrey,
                  onPressed: () {},
                ),
                //Botão do lado do título=========================================
                //Título da seção=================================================
              ],
            ),
          ),
          //Seção onde será posicionado o título e o botão à direita==============
          //Seção onde serão posicionados os próprios contatos favoritos==========
          Container(
            height: 120,
            //Os contatos favoritos===============================================
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              itemCount: favorites.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                //Os contatos tendo espaçamento===================================
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: favorites[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    //Um contato é posicionado em uma coluna========================
                    child: Column(
                      children: <Widget>[
                        //A foto do contato=========================================
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            favorites[index].imageUrl,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        //A foto do contato=========================================
                        //O nome do contato=========================================
                        Text(
                          favorites[index].name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //O nome do contato=========================================
                      ],
                    ),
                    //Um contato é posicionado em uma coluna========================
                  ),
                );
                //Os contatos tendo espaçamento===================================
              },
            ),
            //Os contatos favoritos===============================================
          ),
          //Seção onde serão posicionados os próprios contatos favoritos==========
        ],
      ),
    );
    //Widget de contatos favoritos==============================================
  }
}
