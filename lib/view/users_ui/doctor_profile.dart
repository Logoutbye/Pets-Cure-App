import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/pakflag.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Dotor Name field
                Container(
                  child: TextField(
                    //obscureText: true,
                    readOnly: true,
                    onTap: () {},
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Dr. Alpha',
                      //labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          //Color.fromARGB(255, 115, 38, 38),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 2, 140, 253),
                        size: 35,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Doctor Mobile Number Field
                Container(
                  child: TextField(
                    readOnly: true,
                    //obscureText: true,
                    onTap: () {},
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: '0344-9873677',
                      //labelText: 'Mobile Number',
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          //Color.fromARGB(255, 115, 38, 38),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.mobile_friendly,
                        color: Color.fromARGB(255, 2, 140, 253),
                        size: 35,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Doctor Hospital Name Field
                Container(
                  child: TextField(
                    readOnly: true,
                    //obscureText: true,
                    onTap: () {},
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Alpha Hospital',
                      //labelText: 'Hospital',
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          //Color.fromARGB(255, 115, 38, 38),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.local_hospital,
                        color: Color.fromARGB(255, 2, 140, 253),
                        size: 35,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Doctor Department Field
                Container(
                  child: TextField(
                    readOnly: true,
                    //obscureText: true,
                    onTap: () {},
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Gemma Department',
                      //labelText: 'Department',
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                          //Color.fromARGB(255, 115, 38, 38),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.local_fire_department,
                        color: Color.fromARGB(255, 2, 140, 253),
                        size: 35,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
