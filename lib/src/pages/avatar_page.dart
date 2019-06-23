import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('AvatarPage'),
          actions: <Widget>[

            Container(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://img.elcomercio.pe/files/ec_article_multimedia_gallery/uploads/2018/11/14/5bec51c8359dd.jpeg'),
                radius: 20.0,
              ),
            ),

            Container(
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.yellow,
              ),
            )
          ],
          ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://media.wired.com/photos/5be9d68a5d7c6a7b81d79e25/master/pass/StanLee-610719480.jpg'),
            placeholder: AssetImage( 'assets/jar-loading.gif' ),
          ),
        ),
      ),
    );
  }
}