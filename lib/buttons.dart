import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String myText;
  final String myImage;

  Button(this.myText, this.myImage);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.1, 
      child: ElevatedButton(
        onPressed:() {},
        child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Image(image: AssetImage(myImage)),
            SizedBox(
                width:10,
            ),
            Text(myText, style:TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
            ],
        ),
    ),
    );
  }
}