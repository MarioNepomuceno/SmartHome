import 'package:flutter/material.dart';
import 'package:smarthome/Infra/Controls/SpringySlider/SpringySliderWidget.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: new AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: new Padding(
            padding: EdgeInsets.only(
              left: 15,
              top: 25,
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: new Text(
                        "Minha Casa",
                        style: new TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.notifications_none),
              color: Colors.blue,
              tooltip: 'Notificações',
              padding: EdgeInsets.only(top: 25),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new SpringySliderWidget(
              markCount: 10,
              positiveColor: Theme.of(context).primaryColor,
              negativeColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: new BottomAppBar(
        elevation: 30,
        color: Colors.white,
        child: new Container(
          height: 80,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.all(20),
                child: new IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
