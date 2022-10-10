import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AddProduct extends StatefulWidget {

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ImagePicker _picker = ImagePicker();

  File imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AddProduct")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async{
                      File photo = await ImagePicker.pickImage(source: ImageSource.camera);
                      if(photo!=null)
                        {
                          setState(() {
                            imagefile = photo;
                          });
                        }

                    },
                    icon: Icon(Icons.camera_alt,size: 60,color: Colors.black45,),
                  ),
                  IconButton(
                    onPressed: () async{
                      File photo = await ImagePicker.pickImage(source: ImageSource.gallery);
                      if(photo!=null)
                      {
                        setState(() {
                          imagefile = photo;
                        });
                      }
                    },
                    icon: Icon(Icons.file_copy_sharp,size: 60,color: Colors.blue,),
                  ),
                  Container(
                    width: 100,
                      child: (imagefile!=null)?Image.file(imagefile):Image.asset("img/download.jpg")
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Center(child: Text("Name",style: TextStyle(fontSize: 30),)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Center(child: Text("Quantity",style: TextStyle(fontSize: 30),)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _qty,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0,top: 20.0),
              child: Center(child: Text("Price",style: TextStyle(fontSize: 30),)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade100,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3,color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Center(
                child: GestureDetector(
                    onTap : () async{

                      var name = _name.text.toString();
                      var qty = _qty.text.toString();
                      var price = _price.text.toString();

                      // var uuid = Uuid();
                      //
                      // var filename = uuid.v1().toString() + ".jpg"; //6c84fb90-12c4-11e1-840d-7b25c5ee775a.jpg
                      //
                      // await FirebaseStorage.instance.ref().putFile(imagefile).toString();

                      await FirebaseFirestore.instance.collection("Products").add({
                        "pname":name,
                        "qty":qty,
                        "price":price
                      }).then((value){
                        print("Data Inserted");
                        _name.text="";
                        _qty.text="";
                        _price.text="";
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.blue.shade50,
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 3.0,color: Colors.blue.shade900),
                            ),
                            child: Center(child: Text("SUBMIT",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)))
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
