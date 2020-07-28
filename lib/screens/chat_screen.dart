import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //Essa função é chamada no listview para buildar os textos da conversa
  _buildMessage(Message message, bool isMe) {
    //Este será o widget que será retornado se a mensagem for a do usuário,
    //composto por um Container. Se a mesagem for do usuário, será aplicada um
    //margin à esquerda, caso contrário, só será aplicado margin no topo e
    //embaixo. Em seguida é aplicado um padding simétrico. A largura é igual
    //a 75% da tela. E é aplicado um decoration no Container. Se a mensagem for
    //do usuário, a cor de fundo será um rosa mais claro, caso contrário, será
    //o accentcolor. As bordas circulares são aplicadas dependendo se a mensagem
    //for ou não do usuário. E assim o child é definido.
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 80,
            )
          : EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),

      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      width: MediaQuery.of(context).size.width * 0.75,

      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
      ),

      //Este é o child do container, que é uma coluna. Primeiro os elementos são
      //alinhados à esquerda, e o horário da mensagem é posicionada, aplica-se
      //um sizedbox para dar um espaço, e então o texto da mensagem.

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    //Se a mensagem não for do usuário, será criada uma row, contendo o widget
    //msg, e ao lado, o ícone de mensagem favoritada.
    return Row(
      children: <Widget>[
        //Este widget é explicado acima.
        msg,
        //Este é o ícone de mensagem favoritada. Se a mensagem foi curtida, o
        //ícone será um coração macico, caso conrário um coração só com bordas.
        //E se a mesagem foi curtida, a cor do coração será o da cor primária,
        //caso contrário, será um bluegrey.
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        ),
      ],
    );
  }

  //Essa função será responsável por buildar o widget de escrever mensagem.
  _buildMessageComposer() {
    //O widget é composto primariamente por um Container. Primeiro é aplicado um
    //padding horizontal para centralizar mais o widget. E seu child é uma row.
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      //A row possui três elementos: o primeiro ícone, o campo de texto, e outro
      //ícone.
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          //O campo de entrada de texto inicializa o primeiro caractere como
          //maiúsculo, e a decoração define a mensagem de dica.
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //O funda da tela inteira é da cor primária
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      //A tela é um GestureDetector para que, ao clicar em qualquer lugar, a
      //caixa de texto possa sumir, e seu filho é uma coluna que possui um
      //Expanded que possui um Container com decoração de fundo branco e bordas
      //no topo esquerdo e direito circulares. E o Container possui um ClipRRect
      //com bordas semelhantes, que possui um list view.
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            //Essa função é chamada para buildar o campo de enviar texto.
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
