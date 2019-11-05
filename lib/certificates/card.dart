import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  CardView({Key key, this.color, this.offset}) : super(key: key);
  final Color color;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: offset.dx, bottom: offset.dy),
      width: 340,
      height: 220,
      decoration: new BoxDecoration(
          color: color,
          //backgroundBlendMode: BlendMode.softLight,
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

// class CardView extends StatefulWidget {
//   CardView({Key key, this.color, this.offset}) : super(key: key);

//   final Color color;
//   final Offset offset;

//   @override
//   _CardViewState createState() => _CardViewState();
// }

// class _CardViewState extends State<CardView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.only(left: widget.offset.dx, bottom: widget.offset.dy),
//       width: 340,
//       height: 220,
//       decoration: new BoxDecoration(
//           color: widget.color,
//           backgroundBlendMode: BlendMode.hardLight,
//           borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
//           boxShadow: <BoxShadow>[
//             new BoxShadow(
//               blurRadius: 20.0,
//             ),
//           ]),
//       child: Text("Card Back"),
//     );
//   }
// }

class TitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text('Certificates',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                new Image.asset(
                  "assets/Illustration5.png",
                  fit: BoxFit.cover,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(20),    
      constraints: BoxConstraints(minWidth: 0, maxWidth: double.infinity, maxHeight: 300),
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
            blurRadius: 20.0,
          ),
        ],
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 6,
            decoration: new BoxDecoration(
              color: Color.fromRGBO(0x00, 0x00, 0x00, 0.1),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'This certificate is proof that Ment To has archieved the UI Design course with approval from a Design and Code instructor.',
              style: Theme.of(context).textTheme.body1.copyWith(),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
