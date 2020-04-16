import 'package:flutter/material.dart';
import 'package:fluttertrackcorona/screens/home.dart';
import 'package:fluttertrackcorona/services/network.dart';
import 'package:fluttertrackcorona/models/district.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      home: LoadPage(),
    );
  }
}

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {


  void getData() async
  {
    int sum=0;
    NetworkHelper networkHelper = new NetworkHelper("https://api.covid19india.org/v2/state_district_wise.json");
    var posts = await networkHelper.getData();
    List<District> distList = new List<District>();
    for(int i=0;i<posts[28]['districtData'].length;i++)
    {
//      print(posts.length);
      sum = sum + posts[28]['districtData'][i]['confirmed'];
      District district = District.fromJson(posts[28]['districtData'][i]);
      distList.add(district);
    }

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return HomePage(distList,sum);
      }
    ));



  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Image.asset('images/icon.png',
              scale: 5.0,
            )
            ,
            Center(child: Text('COVID 19 TRACK ASSAM',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            )
            )
            ,
            SpinKitCircle(
              color: Colors.blue,
              size: 100.0,
            ),
          ],
        ),

      ),
    );
  }
}


