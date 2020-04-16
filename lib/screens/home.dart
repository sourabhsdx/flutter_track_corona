import 'package:flutter/material.dart';
import 'widget/cardbox.dart';
import 'package:fluttertrackcorona/models/district.dart';



class HomePage extends StatefulWidget {
  HomePage(this.distList,this.total);
  final int total;
  final List<District> distList;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardBox> cbList = new List<CardBox>();


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    loadCardBox();





  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.add_to_queue),
        backgroundColor: Colors.black,
        title: Text('COVID 19 ASSAM'),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: GridView.count(
          primary: false,
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: cbList,
        ),
      ),
    );
  }

  void loadCardBox(){

    setState(() {
      cbList.add(CardBox(widget.total,"Total"));
      for(int i=1;i<widget.distList.length;i++)
      {

        cbList.add(CardBox(widget.distList[i].data,widget.distList[i].name));
      }
    });

  }
}
