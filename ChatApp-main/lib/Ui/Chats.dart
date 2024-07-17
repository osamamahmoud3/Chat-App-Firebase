import 'package:flutter/material.dart';
import 'package:mnaaa/Ui/apppagg.dart';

class Chatspage extends StatelessWidget {
  const Chatspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title:const  Text('Edit')),
        body: Column(
          children: [
        const     Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Chats',style: TextStyle(color: Colors.white,fontSize: 31,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: TextField(
                decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              border:const  OutlineInputBorder(borderSide: BorderSide(width: 50)),
              
              enabledBorder: OutlineInputBorder(
                
                borderSide: BorderSide(color: Colors.blue),
                
                borderRadius: BorderRadius.circular(50)),
              focusedBorder: OutlineInputBorder(
                borderSide:const  BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(50)),
              hintText: '   Search ', hintStyle:const  TextStyle(color: Colors.white)),
                
              ),
            ),
           const   SizedBox(height: 10,),
      const       Divider(thickness: 0.4,
            endIndent: 25,
            indent: 25,
            color: Colors.white,),
            
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return apppage();
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.black,
                  borderRadius: BorderRadius.circular(10)),
                height: 50,
                width: 380,
               child: Row(
                children: [
                  Image.asset('Images/maxresdefault.jpg'),const Text('Elsohab Groub',style: TextStyle(color: Colors.white,fontSize: 20),)
            
                ],
               ),
              ),
            ),
         const    Divider(thickness: 0.4,
            endIndent: 25,
            indent: 25,
            color: Colors.white,),
          ],
        ),
        
    );
  }
}