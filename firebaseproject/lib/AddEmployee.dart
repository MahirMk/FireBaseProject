
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();

  var grpvalue = "M";
  var select = "e1";
  ImagePicker _picker = ImagePicker();
  File imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Add Employee")),
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
                          setState((){
                            imagefile = photo;
                          });
                        }
                    },
                    icon: Icon(Icons.camera_alt,size: 60,color: Colors.black45,),
                  ),
                  Container(
                      width: 80,
                      child:(imagefile!=null)?Image.file(imagefile):Image.asset("img/download.jpg")
                  ),
                  IconButton(
                    onPressed: () async{
                      File photo = await ImagePicker.pickImage(source: ImageSource.gallery);
                      if(photo!=null)
                      {
                        setState((){
                          imagefile = photo;
                        });
                      }
                    },
                    icon: Icon(Icons.file_copy_sharp,size: 60,color: Colors.blue,),
                  ),
                ],
              ),
            ),
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
              child: Center(child: Text("Salary",style: TextStyle(fontSize: 30),)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                controller: _salary,
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
            SizedBox(height: 30.0,),
            Center(child: Text("Gender",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Male",style: TextStyle(fontSize: 20)),
                Radio(
                  activeColor: Colors.black87,
                  value: "M",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
                Text("Female",style: TextStyle(fontSize: 20)),
                Radio(
                  activeColor: Colors.black87,
                  value: "F",
                  groupValue: grpvalue,
                  onChanged: (val)
                  {
                    setState(() {
                      grpvalue=val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Center(
              child: Center(
                child: Container(
                  width: 100,
                  height: 50,
                  child: Container(
                    color: Colors.black26,
                    child: Center(
                      child: DropdownButton(
                          value: select,
                          onChanged: (val)
                          {
                            setState(() {
                              select = val;
                            });
                          },
                          items:[
                            DropdownMenuItem(
                              child: Center(child: Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                              value: "e1",
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("2",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                              value: "e2",
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("3",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                              value: "e3",
                            ),
                            DropdownMenuItem(
                              child: Center(child: Text("4",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                              value: "e4",
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            Center(
              child: Container(
                color: Colors.black,
                width: 100,
                height: 50,
                child: GestureDetector(
                  onTap: () async{
                    var name = _name.text.toString();
                    var salary = _salary.text.toString();
                    var gp = grpvalue.toString();
                    var sl = select.toString();

                    await FirebaseFirestore.instance.collection("Information").add({

                      "Name":name,
                      "Salary":salary,
                      "Gender":gp,
                      "Dp":sl
                    }).then((value){
                      print("Data Inserted");
                      _name.text="";
                      _salary.text="";
                      grpvalue="M";
                      select="e4";
                    });
                  },
                  child: Center(child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
