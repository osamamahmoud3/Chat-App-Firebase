import 'package:flutter/material.dart';
import 'package:mnaaa/Models/Massage.dart';
import 'package:mnaaa/Ui/Massage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mnaaa/Ui/p2.dart';

class apppage extends StatelessWidget {
   apppage({super.key});
   final _controller =ScrollController();
CollectionReference Massages = FirebaseFirestore.instance.collection('Massages');
TextEditingController controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Massages.orderBy('createDat', descending:  true).snapshots(),
      
      builder: (context, snapshot) {
     if (snapshot.hasData) {
     List<massage> massagelist =[];
     List<massage> emaillist=[];
     for(int i=0 ; i<snapshot.data!.docs.length; i++)
     {
      massagelist.add(massage.fromjson(snapshot.data!.docs[i]));
      emaillist.add(massage.fromjson(snapshot.data!.docs[i]));
     }
       return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title:const 
         Text('Chat',style: TextStyle(color: Colors.white),),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              
              child: Image.asset('Images/icons8-back-24.png',height: 0,width: 5,color:Colors.blue ,)),
          ),
          backgroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 720,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: massagelist.length,
                  itemBuilder: (context, Index){
                 return massagelist[Index].id==email? Massage(massg: massagelist[Index], id: emaillist[Index]):Massagefriend(massg: massagelist[Index], id: emaillist[Index],);
                  }
                  ),
              ),
              Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          onSubmitted: (value) {
            Massages.add({
              'massage' : value,
              'createDat': DateTime.now(),
              'id': email
            });
            controller.clear();
            _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding:const  EdgeInsets.all(15),
            border:const  OutlineInputBorder(borderSide: BorderSide(width: 10)),
            suffixText: 'Sent',suffixStyle:const  TextStyle(color: Colors.blue),
            
            enabledBorder: OutlineInputBorder(
              
              borderSide:const  BorderSide(color: Colors.blue),
              
              borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
              borderSide:const  BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(30)),
            hintText: 'Type a Massge, ', hintStyle: const TextStyle(color: Colors.white)),
        ),
      ),
            ],
          ),
        ),
      )
    );
       
     } else {
       return const Text('');
     }
    },);
  }
}