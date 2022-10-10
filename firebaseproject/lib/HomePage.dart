import 'package:flutter/material.dart';

import 'AddEmployee.dart';
import 'AddProduct.dart';
import 'VeiwEmployee.dart';
import 'VeiwProduct.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("FireFox"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AddProduct())
                  );
                },
                child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2)
                    ),
                    child: Center(child: Text("ADD PRODUCT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>VeiwProduct())
                  );
                },
                child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2)
                    ),
                    child: Center(child: Text("VIEW PRODUCT",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>AddEmployee())
                  );
                },
                child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2)
                    ),
                    child: Center(child: Text("ADD EMPLOYEE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>VeiwEmployee())
                  );
                },
                child: Container(
                    width: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 2)
                    ),
                    child: Center(child: Text("VIEW EMPLOYEE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),))
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
