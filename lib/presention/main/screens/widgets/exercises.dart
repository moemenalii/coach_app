import 'package:flutter/material.dart';
import 'package:healthystate/presention/resources/routes_manager.dart';

import 'ex_model.dart';

class Exercisespage extends StatelessWidget {
  const Exercisespage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemBuilder:(context,index)=> buildItem(photo[index],context,index),
        itemCount:photo.length ,
      ),
    );
  }
}
Widget buildItem (CONTAINER model,context,index)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ GestureDetector(
    onTap: (){
      if(index==0)
        Navigator.pushNamed(context, Routes.exPrivateRoute);
      if(index==1)
        Navigator.pushNamed(context, Routes.exPrivate1Route);
      if(index==2)
        Navigator.pushNamed(context, Routes.exPrivate2Route);
      if(index==3)
        Navigator.pushNamed(context, Routes.exPrivate3Route);
      if(index==4)
        Navigator.pushNamed(context, Routes.exPrivate4Route);
      },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
            image: DecorationImage(image: AssetImage(model.images),fit: BoxFit.fill)),
      ),
    ),),
  ],
);
