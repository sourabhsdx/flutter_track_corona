import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  CardBox(this.data,this.district);
  final int data;
  final String district;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child:Center(
        child: Column(
          children: <Widget>[
            Text(this.data.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                )
            ),
            Text(this.district,
                textAlign: TextAlign.center ,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                )
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
