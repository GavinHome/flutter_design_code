import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  CardView({Key key, this.color, this.offset}) : super(key: key);

  final Color color;
  final Offset offset;

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: widget.offset.dx, bottom: widget.offset.dy),
      width: 340 ,
      height: 220 ,
      decoration: new BoxDecoration(
          color: widget.color,
          backgroundBlendMode: BlendMode.hardLight,
          borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              blurRadius: 20.0,
            ),
          ]),
      child: Text("Card Back"),
    );
  }
}

// class TitleView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 340,
//       height: 220,
//       child: Text("Card Back"),
//     );
//   }
// }

// VStack {
//     HStack {
//         Text("Certificates")
//             .font(.largeTitle)
//             .fontWeight(.heavy)
//         Spacer()
//     }
//     Image("Illustration5")
//     Spacer()
// }.padding()
