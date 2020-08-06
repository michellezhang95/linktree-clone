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
      color: Colors.brown[100],
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
            child: Text('Check out my personal projects below!'),
          ),
          SizedBox(height: 20),
          LinkButton(
            title: 'GitHub',
            url: 'https://github.com/michellezhang95/',
            colour: Colors.yellow[800],
          ),
          LinkButton(
            title: 'Startup Name Generator',
            url: 'https://startup-namer-732af.web.app/#/',
            colour: Colors.purple[800],
          ),
          LinkButton(
            title: 'Coffeehouse Reviews (Work In Progress)',
            url: null,
            colour: Colors.purple[800],
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
  LinkButton({
    Key key,
    @required this.title,
    @required this.url,
    @required this.colour,
    this.image,
  }) : super(key: key);
  final String title;
  final String url;
  Image image;
  final Color colour;

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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          color: colour,
        ),
      ),
    );
  }
}
