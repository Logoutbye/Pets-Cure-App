import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  final List<Map<String, dynamic>> allDoctors = [
    {"id": 1, "name": "Noor", "Location": "Peshawer"},
    {"id": 2, "name": "Idress", "Location": "lahore"},
    {"id": 3, "name": "Abdullah", "Location": "peshawer"},
    {"id": 4, "name": "Kashif", "Location": "islamabd"},
    {"id": 5, "name": "Noor jayaz", "Location": "Kohat"}
  ];

  List<Map<String, dynamic>> foundusers = [];

  @override
  initState() {
    foundusers = allDoctors;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      results = allDoctors;
    } else {
      results = allDoctors
          .where(
            (user) => user["name"].toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      foundusers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              // Search Doctor Text Field
              Container(
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    labelText: "Search Doctors ",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              // List view builder
              Container(
                child: ListView.builder(
                  // scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: foundusers.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(foundusers[index]["id"]),
                    color: Colors.blue,
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        foundusers[index]["id"].toString(),
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      title: Text(
                        foundusers[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${foundusers[index]["Location"]}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
