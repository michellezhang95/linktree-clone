import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //builds the widget you have written
    //MaterialApp is like a package
    //Material is a design system
    //material.io
    return MaterialApp(
      title: 'Michelles Linktree Clone Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LinksLandingPage(),
    );
  }
}

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(height: 35),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://cdn.collider.com/wp-content/uploads/2018/10/bee-and-puppy-cat-lazy-in-space-images-18.png',
            height: 200,
            width: 200,
          ),
          Padding(
            padding:
                const EdgeInsets.all(12.0), //all for all edges of container
            child: Text('@modernorcawhale'),
          ),
          SizedBox(height: 20),
          LinkButton(
            title: 'Twitter',
            url: 'https://twitter.com/sugarypizzatv',
          ),
          LinkButton(
            title: 'Twitch',
            url: 'https://twitch.tv/sugarypizza',
          ),
          Spacer(),
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Text('Made by Michelle Zhang with Flutter'),
          ]),
          SizedBox(height: 23),
        ],
      ),
    );
  }
}

//creates a button class that when clicked directs to a url
class LinkButton extends StatelessWidget {
  const LinkButton({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallWidth = width * 0.85;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: width > 600 ? 600 : smallWidth,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          onPressed: () => launch(url),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.deepPurpleAccent,
        ),
      ),
    );
  }
}
