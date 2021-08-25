import 'package:flutter/material.dart';
 
void main(){
  runApp(MyAppITESO());
}

class Likes extends StatelessWidget{
  final int likes;
  final Function(int) likesChanged;

  Likes(@required this.likes,
  @required this.likesChanged);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                        print('like');
                        likesChanged(1);
                        }, icon: Icon(Icons.thumb_up, color: Colors.indigo,)),
                        IconButton(onPressed: (){
                        print('dislike');
                        likesChanged(-1);
                        }, icon: Icon(Icons.thumb_down, color: Colors.indigo,)),
                      ],
                    ),
                  Text('$likes')],
                );
  }
}

class MyAppITESO extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int likes=69;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: ListView(
        children: [
          //Imagen
          Image.network('https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
          Container(
            height: 20,
          ),
          //Fila
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("El ITESO, Universidad Jesuita de Guadalajara", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("San Pedro Tlaquepaque", style: TextStyle(color: Colors.grey))
              ],),
              Likes(likes, (int val){
                setState(() => likes += val);
              })
            ],
          ),
          Container(
            height: 40,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly ,children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.mail, size: 50,),
              Text('Correo', style: TextStyle(fontWeight: FontWeight.bold))
            ],),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.call, size: 50,),
              Text('Llamada', style: TextStyle(fontWeight: FontWeight.bold))
            ],),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(Icons.directions, size: 50,),
              Text('Ruta', style: TextStyle(fontWeight: FontWeight.bold))
            ],)
          ],),
          Container(
            height: 40,
          ),
          Text('El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.',
          textAlign: TextAlign.justify,)
          //Fila
        ],
      ),
    );
  }
}