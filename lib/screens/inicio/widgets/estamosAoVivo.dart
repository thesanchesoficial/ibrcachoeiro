import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/live/live.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class EstamosAoVivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Live()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                  )
              ),
              width: 80,
              height: 80,
              child: Center(
                child: Icon(Icons.videocam, color: Colors.white, size: 35,),
              ),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Culto ao vivo!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("Todas as quintas e domingos às 19h30. Participe conosco!", style: TextStyle(fontFamily: "Aktiv"),),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
