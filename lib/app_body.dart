import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}
class _AppBodyState extends State<AppBody> {
  final _images = [
    Image.network('https://media.discordapp.net/attachments/604637611776278543/1040415554822996078/FB_IMG_1668124739699.jpg'),
    Image.network('https://media.discordapp.net/attachments/604637611776278543/1040415968024862821/17eba7261ad7c8540c1177cf080f9cd8.jpg'),
    Image.network('https://media.discordapp.net/attachments/604637611776278543/1040416095389102140/d0a5a4f23db891571197ddf86c62c3d7.jpg'),
    Image.network('https://media.discordapp.net/attachments/659355267510697985/1041464128327405608/image.png'),
  ];
  int index = 0;
  int lastA = 0;
  int lastB = 2;
  @override
  Widget build(BuildContext context) {
    var buttonLeft = ElevatedButton(
      child: const Text('Image A'),
      onPressed: () {
        setState(() {
          if (lastA == 0) {
            lastA = 1;
            index = 1;
          } else {
            index = 0;
            lastA = 0;
          }
        });
        SnackBar snackBar = SnackBar(
          content: Text('現在顯示的是圖片${index + 1}'),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
    var buttonRight = ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      child: const Text('Image B'),
      onPressed: () {
        print('Button B clicked');
        setState(() {
          if (lastB == 2){
            index = 3;
            lastB = 3;
          }
          else{
            index = 2;
            lastB = 2;
          }
        });
        SnackBar snackBar = SnackBar(
          content: Text('現在顯示的是圖片${index + 1}'),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [buttonLeft, buttonRight],
    );



    var imageBox = InkWell(
      child: _images[index],
      onTap: () {
        print('Image clicked');
        SnackBar snackBar = SnackBar(
          content: Text('你點擊了圖片${index + 1}'),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    var column = Column(
      children: [imageBox, row],
    );

    var container = Container(
      padding: const EdgeInsets.all(32),
      child: column,
    );
    var body = Center(child: container);
    return body;
  }
}