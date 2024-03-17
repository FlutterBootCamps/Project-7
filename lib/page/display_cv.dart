import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project7/helper/colors.dart';
import 'package:project7/helper/extion.dart';
import 'package:project7/model/user_data.dart';

class DisplayCv extends StatelessWidget {
  const DisplayCv({super.key,  this.data});
final UserDataModel ?data;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width:context.getWidth(context) ,
            color: dark,
            
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                 Padding(
                 padding: const EdgeInsets.only(left: 15),
                  child: Text(data?.fullName??"SAUD ALQURASHI",style: const TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 25),),
                ),
                const SizedBox(height: 10,),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                data?.abstract??"A recent graduate computer engineer, talented, ambitious",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
                maxLines: 2, 
                overflow: TextOverflow.fade,
              ),
            ),
          ),
              ],
            ),
          ),
           Container(
             height: 80,
            width:context.getWidth(context) ,
            color: grey,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                             const Icon(Icons.email,color: white,),
                             Text(data?.email??" saud.q@gmail.com",style: const TextStyle(color: white)),
                             const Spacer(),
                             const Icon(Icons.phone_android,color: white,),
                              Text(data?.phone??" +966555380338",style: const TextStyle(color: white)),
                  ],),
                  const SizedBox(height: 8),
                     Row(
                    children: [
                             const Icon(Icons.location_on_outlined,color: white,),
                             Text(data?.city??" Makkah",style: const TextStyle(color: white)),
                             const Spacer(),
                             const Icon(Icons.date_range_outlined,color: white,),
                             Text(data?.dateOfBirth??" 2000/10/23",style: const TextStyle(color: white),),
                  ],),
                 
                ],
              ),
            ),
          ),
        Padding(padding: 
        EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
             const Text("EDUCATION",style: TextStyle(color:dark,fontWeight: FontWeight.bold,fontSize: 20)),
           const Divider(endIndent: 2,indent: 2),
            Text(data?.education??"Bachelor of Computer EngineeringUmm Al-Qura University",style: const TextStyle(color:dark,fontWeight: FontWeight.w400,fontSize: 18)),
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                  const Spacer(),
                   Text(data?.dateEducation??"2023/8/23",style: const TextStyle(color:dark,fontWeight: FontWeight.w300,fontSize: 15)),
                 ],
               ),
             ),
             const SizedBox(height: 20),
              const Text("Work Experience",style: TextStyle(color:dark,fontWeight: FontWeight.bold,fontSize: 20)),
           const Divider(endIndent: 2,indent: 2),
            Text(data?.workExperience??"Wadi Makkah/First City Company",style: const TextStyle(color:dark,fontWeight: FontWeight.w400,fontSize: 18)),
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                  const Spacer(),
                   Text(data?.dateWorkExperience??"2023-2022",style: const TextStyle(color:dark,fontWeight: FontWeight.w300,fontSize: 15)),
                 ],
               ),
             ),
               const SizedBox(height: 20),
              const Text("Skills",style: TextStyle(color:dark,fontWeight: FontWeight.bold,fontSize: 20)),
           const Divider(endIndent: 2,indent: 2),
            Text(data?.skills??"Problem Solving , Analysis skills , Microsoft office",style: const TextStyle(color:dark,fontWeight: FontWeight.w400,fontSize: 18)),
      
             const SizedBox(height: 20),
              const Text("Languages",style: TextStyle(color:dark,fontWeight: FontWeight.bold,fontSize: 20)),
           const Divider(endIndent: 2,indent: 2),
            Text(data?.languages??"Arabic , English",style: const TextStyle(color:dark,fontWeight: FontWeight.w400,fontSize: 18)),
        ],),
        )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
       
         
         
        },
        backgroundColor: white,
        child: const Icon(
          Icons.ios_share,color:dark,
          
        ),
      ),
    );
  }
}