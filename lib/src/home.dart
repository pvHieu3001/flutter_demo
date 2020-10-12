import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'sign_in_http.dart';
import 'layout1.dart';

final demos = [
  Demo(
    name: 'Sign in with HTTP',
    route: '/signin_http',
    builder: (context) => SignInHttpDemo(),
  ),
  Demo(
    name: 'Layout',
    route: '/layout',
    builder: (context) => Layout1(),
  ),
];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  String _email = '';
  final emailEdittingController = TextEditingController();
  DateTime now = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(demos.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
            children:[
              Container(
                height: 100.0,
                child:ListView(children: [...demos.map((d) => DemoTile(d))],),
              ),
              
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEdittingController,
                  onChanged: (text){
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10)
                      ),
                    ),
                    labelText: "Enter your email"
                  ),
              ),
              ),

              
              
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),

              Text(
                DateFormat.yMMMd().format(now),
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
            ]
          ),
        
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}
