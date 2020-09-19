// import 'dart:async';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import './flutter_tut.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import './FadeAnimation.dart';
// import './animatedListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Title",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 20,
                      width: 80,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: FadeAnimation(3, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/light-1.png'),
                            )
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      left: 120,
                      width: 60,
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: FadeAnimation(3.8, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/light-2.png'),
                            )
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      right: 40,
                      top: 20,
                      width: 60,
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: FadeAnimation(2.5, Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/clock.png'),
                            )
                          ),
                        ),
                      )
                    ),
                    Positioned(
                      child: FadeAnimation(2.8, Container(
                          margin: EdgeInsets.only(top: 80),
                          child: Center(
                            child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold))
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(1.4, Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .4),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[100]))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                    SizedBox(height: 30,),
                    FadeAnimation(1.7, Container(
                      child: InkWell(
                        onTap: () => login(),
                        borderRadius: BorderRadius.circular(10),
                        child: new Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .5)
                              ]
                            ),
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                    ),
                    SizedBox(height: 40,),
                    FadeAnimation(1.4, Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1))),),
                  ],
                ),
              ),
            ],
          )
          ),
        ),
    );
  }

  void login(){
    print("Login Method called!!");
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _listTiles = <Widget>[
          ListTile(title: Text("First List"),),
          Divider(),
          ListTile(title: Text("Second List"),),
          Divider(),
          ListTile(title: Text("Third List"),),
    ];

    final _listBuilder = ListView.builder(
          // padding: const EdgeInsets.all(2),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            final item = index;
            return Dismissible(
              key: Key(item.toString()),
              child: Container(
                height: 70,
                color: Colors.indigo[(Random().nextInt(1000)/100).ceil() * 100],
                child: Center(child: Text("Item $index")),
              ),
            );
          },
    );

    // AnimatedList(
    //   itemBuilder: (context, index, animation){
    //     return SlideTransition(
    //       position: animation.drive(MyTween()),
    //       child: MyListItem(_myItems[index])
    //     );
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text("Hero Title"),
      ),
      body: _listBuilder,
    );
  //   return CupertinoPageScaffold(
  //     child: CustomScrollView(
  //       physics: const BouncingScrollPhysics(
  //         parent: AlwaysScrollableScrollPhysics(),
  //       ),
  //       slivers: [
  //         SliverList(
  //           delegate: SliverChildBuilderDelegate( (context, index) {
  //             return ListTile(title: Text("titleOne"),);
  //           }),
  //         ),
  //       ],
  //     ),
  //   );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         // theme: ThemeData(primaryColor: Colors.blue[600]),
//         title: "Word Pair App", // Used by OS task switcher
//         home: DonutApp());
//   }
// }

// class DonutApp extends StatefulWidget {
//   _DonutAppState createState() => _DonutAppState();
// }

// class _DonutAppState extends State<DonutApp> {
//   final textStyle = TextStyle(
//           fontSize: 30.0, 
//           color: Colors.white, 
//           decoration: TextDecoration.none, 
//           fontFamily: 'Railway', 
//           fontWeight: FontWeight.w200,
//           backgroundColor: Colors.transparent);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white24),
//       child: Center(
//         child: Text("Hello from statful body!", style: textStyle)
//       )
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import './random_words.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(primaryColor: Colors.blue[600]),
//         title: "Word Pair App",
//         home: RandomWords());
//   }
// }

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
// import './FadeAnimation.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Flutter App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter', style: TextStyle(color: Colors.black),),
//           backgroundColor: Colors.yellowAccent,
//         ),
//         body: Center(
//           child: RandomWords(),
//         ),
//       ),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }

// class _RandomWordsState extends State<RandomWords> {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     final random = Random();
//     return FadeAnimation(1.3, Container(
//       child: Text(
//         wordPair.asPascalCase, 
//         style: TextStyle(
//           fontSize: 60,
//           color: Color.fromRGBO(
//             random.nextInt(256),
//             random.nextInt(256),
//             random.nextInt(256),
//             1,
//           )
//         ),
//       )
//     )
//     );
//   }
// }


// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Tutorial',
//     home: TutorialHome(),
//   ));
// }

// class TutorialHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Scaffold is a layout for the major Material Components.
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.white),
//           tooltip: 'Navigation menu',
//           onPressed: null,
//         ),
//         title: Text('Example title'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//       // body is the majority of the screen.
//       body: Center(
//         child: Text('Hello, world!'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         tooltip: 'Add', // used by assistive technologies
//         child: Icon(Icons.add),
//         onPressed: () => print("Button Pressed!"),
//       ),
//     );
//   }
// }


// void main() => runApp(MyApp()); 

// class MyApp extends StatelessWidget { 
//    // This widget is the root of your application. 
//    @override 
//    Widget build(BuildContext context) { 
//       return MaterialApp( 
//          title: 'Flutter Demo', 
//          theme: ThemeData( 
//             primarySwatch: Colors.amber,
//          ), 
//          home: MyHomePage(
//             title: 'Product state demo home page!',
//          ),
//       );
//    }
// }
// class MyHomePage extends StatelessWidget {
//    MyHomePage({Key key, this.title}) : super(key: key);
//    final String title;
//    @override 
//    Widget build(BuildContext context) {
//       return Scaffold(
//          appBar: AppBar(
//             title: Text(this.title), 
//          ), 
//          body: Center(
//             child: Text('Hello World',)
//          ), 
//       ); 
//    } 
// }