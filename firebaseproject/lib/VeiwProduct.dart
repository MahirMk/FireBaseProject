import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeiwProduct extends StatefulWidget {

  @override
  State<VeiwProduct> createState() => _VeiwProductState();
}

class _VeiwProductState extends State<VeiwProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("View Product")),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Products").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
          {
            if(snapshot.hasData)
            {
              if(snapshot.data.size<=0)
              {
                return Center(child: Text("No Data"),);
              }
              else
              {
                return Column(
                  children: snapshot.data.docs.map((document){
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Container(
                          width: 400,
                          child: Card(
                            elevation: 10,
                            color: Colors.green.shade100,
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(document["pname"].toString(),style: TextStyle(color: Colors.red.shade900,fontSize: 30),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(document["qty"].toString(),style: TextStyle(color: Colors.red.shade900,fontSize: 30),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(document["price"].toString(),style: TextStyle(color: Colors.red.shade900,fontSize: 30),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                GestureDetector(
                                  onTap: (){
                                    AlertDialog alert = new AlertDialog(
                                      title: Container(child: Text("Warning!",style: TextStyle(color: Colors.white),)),
                                      backgroundColor: Colors.green,
                                      content: Text("Are you sure you want to delete record?",style: TextStyle(color: Colors.white)),
                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                          child: Text("Cancel",style: TextStyle(color: Colors.white),),
                                        ),
                                        TextButton(onPressed: () async{

                                          var docid = document.id.toString();
                                          await FirebaseFirestore.instance.collection("Products").doc(docid).delete().then((value){
                                            Navigator.of(context).pop();
                                          });
                                        },
                                          child: Text("Delete",style: TextStyle(color: Colors.white),),
                                        ),
                                      ],
                                    );
                                    showDialog(context: context, builder: (BuildContext context){
                                      return alert;
                                    });
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black,width: 2)
                                      ),
                                      child: Center(child: Text("DELETE",style: TextStyle(color: Colors.pink.shade900,fontSize: 20,fontWeight: FontWeight.bold),))
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            }
            else
            {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}
