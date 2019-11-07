import 'package:flutter/material.dart';

class CertificateItem extends StatefulWidget {
  CertificateItem({Key key, this.item}) : super(key: key);

  final CertificateModel item;

  @override
  _CertificateItemState createState() => _CertificateItemState();
}

class _CertificateItemState extends State<CertificateItem> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: widget.item.width,
            height: widget.item.height,
            decoration: new BoxDecoration(
                color: const Color(0xff000000),
                borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    blurRadius: 20.0,
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 18, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.item.title,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Color.fromARGB(0xFF, 0x5E, 0xCD, 0xFA))),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text(
                              'Certificate',
                              style: TextStyle(
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: new Image.asset(
                              "assets/Logo.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: new Image.asset(widget.item.image,
                              fit: BoxFit.fitHeight))
                      // AspectRatio(
                      //   aspectRatio: 3,
                      //   child: new Image.asset(
                      //     widget.item.image,
                      //     fit: BoxFit.fitHeight,
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CertificateList extends StatelessWidget {
  final List<CertificateModel> certificates;

  CertificateList({Key key, this.certificates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: certificates.length,
      itemBuilder: (context, index) {
        final item = certificates[index];

        return Container(
          child: CertificateItem(item: item),
        );
      },
    );
  }
}

class CertificationsPage extends StatefulWidget {
  CertificationsPage({Key key}) : super(key: key);

  @override
  _CertificationsPageState createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<CertificationsPage> {
  List<CertificateModel> certificates;

  _buildCertificateList() {
    return certificateData;
  }

  @override
  void initState() {
    certificates = _buildCertificateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return new Container(
    //   child: Container(
    //     height: 220,
    //     child: CertificateList(certificates: certificates),
    //   ),
    // );
    return new Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Certificates',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
                ),
                Container(
                    child: Text(
                  '4 certificates',
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(color: const Color(0xff808080)),
                ))
              ],
            ),
          ),
          Container(
              height: 220,
              alignment: Alignment.topLeft,
              //margin: EdgeInsets.only(left: 15),
              child: CertificateList(certificates: certificates))
        ],
      ),
    );
  }
}

class CertificateModel {
  String title;
  String image;
  double width;
  double height;

  CertificateModel({this.title, this.image, this.width, this.height});
}

List<CertificateModel> certificateData = [
  CertificateModel(
      title: "OC", image: "assets/Certificate1.png", width: 230, height: 150),
  CertificateModel(
      title: "Swift",
      image: "assets/Certificate2.png",
      width: 230,
      height: 150),
  CertificateModel(
      title: "Java", image: "assets/Certificate3.png", width: 230, height: 150),
  CertificateModel(
      title: "GO", image: "assets/Certificate4.png", width: 230, height: 150)
];
