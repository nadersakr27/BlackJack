
import 'package:flutter/material.dart';

Color color1 = Color.fromRGBO(0, 78, 137,1);
Color color2 = Colors.black;
Color color3 = Colors.white;
class PaperWidget extends StatelessWidget {
  double? width, height;
  Color? color;
  String? num = "";
  IconData? icon;
  PaperWidget(
      {super.key, this.width, this.height, this.color, this.num, this.icon});

  @override
  Widget build(BuildContext context) {
    width ??= 100;
    height ??= 100;
    num ??= " ";
    color ??= Colors.grey.shade200;
    return Container(
      width: width as double,
      height: height as double,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(21)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Icon(icon,color:color3,),
          ),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text(
                  num!,
                  style: TextStyle(fontSize: 32,color:color3),
                ),
              ))
        ],
      ),
    );
  }
}

class text1 extends StatelessWidget {
  final String? textone;

  const text1({Key? key, this.textone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textone!,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: color1),
    );
  }
}

class text2 extends StatelessWidget {
  final String? texttwo;

  const text2({Key? key, this.texttwo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texttwo!,
      style: TextStyle(fontSize: 18, color:color2),
    );
  }
}

class Button1 extends StatelessWidget {
  final enableKey;

  final IconData? icon;
  final String? s;

  Function() fun;

  Button1(
      {Key? key, this.icon, this.s, required this.fun, required this.enableKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color1,
        onPressed: enableKey ? fun : () {},
        child: Row(
          children: [
            Icon(icon,color:color3,),
            const SizedBox(
              width: 10,
            ),
            Text(
              s!,style: TextStyle(color:color3),
            )
          ],
        ));
  }
}
