import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Easy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyJeuEasy(title: 'Trash game'),
    );
  }
}

class MyJeuEasy extends StatefulWidget {
  MyJeuEasy({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyJeuEasy createState() => _MyJeuEasy();
}

class _MyJeuEasy extends State<MyJeuEasy> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(3) + 1;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: MediaQuery.of(context).size.height * 20 / 100,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 50,
                            itemBuilder: (BuildContext context, int index) =>
                                Draggable<int>(
                              data: 10,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 10, right: 10, bottom: 10),
                                child: Container(
                                  height: 100.0,
                                  width: 100.0,
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage("assets/images/1.png"),
                                    ),
                                  ),
                                ),
                              ),
                              feedback: Container(
                                height: 150,
                                width: 150,
                                child: Image(
                                  image: AssetImage("assets/images/1.png"),
                                ),
                              ),
                              childWhenDragging: Container(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: DragTarget<int>(
                          builder: (
                            BuildContext context,
                            List<dynamic> accepted,
                            List<dynamic> rejected,
                          ) {
                            return Stack(
                              fit: StackFit.loose,
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                Blob.random(
                                  size:
                                      MediaQuery.of(context).size.width * 0.45,
                                ),
                                Text('Score dans la poubelle: $acceptedData'),
                              ],
                            );
                          },
                          onAccept: (int data) {
                            setState(() {
                              acceptedData += data;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}