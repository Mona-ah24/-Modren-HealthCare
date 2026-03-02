import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> doctors = [
    {
      "title": "Dr.Ali Nasser",
      "subtitle": "Brain & Nerve Specialist",
      "image": "image/7.jpg",
    },
    {
      "title": "Dr.Ahmed Abdollah",
      "subtitle": "Cardiology Consultant",
      "image": "image/12.jpg",
    },
    {
      "title": "Dr.Mona Ahmed",
      "subtitle": "Cosmetic Dentistry Expert",
      "image": "image/17.jpg",
    },
    {
      "title": "Dr.Sami Omer",
      "subtitle": "Interventional Cardiologist",
      "image": "image/13.jpg",
    },
    {
      "title": "Dr.Noor Hassan",
      "subtitle": "Chest Pain Specialist",
      "image": "image/14.jpg",
    },
    {
      "title": "Dr.Zainab Ahmed",
      "subtitle": "Valve Disease Expert",
      "image": "image/16.jpg",
    },
    {
      "title": "Dr.Hadi Yaser",
      "subtitle": "General Dentist",
      "image": "image/15.jpg",
    },
    {
      "title": "Dr.Saleh Salem",
      "subtitle": "Oral Surgeon",
      "image": "image/18.jpg",
    },
    {
      "title": "Dr.Mazen Ali",
      "subtitle": "Neurology Consultant",
      "image": "image/9.jpg",
    },
    {
      "title": "Dr.Neda Rashed",
      "subtitle": "Nerve Disorder Expert",
      "image": "image/10.jpg",
    },
    {
      "title": "Dr.Noor Ahmed",
      "subtitle": "Stroke Specialist",
      "image": "image/11.jpg",
    },
  ];

  List<Map<String, String>> filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    filteredDoctors = doctors;
  }

  void searchDoctor(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredDoctors = doctors;
      });
      return;
    }

    final results = doctors.where((doctor) {
      final title = doctor["title"]!.toLowerCase();
      final subtitle = doctor["subtitle"]!.toLowerCase();
      final input = query.toLowerCase();

      return title.contains(input) || subtitle.contains(input);
    }).toList();

    setState(() {
      filteredDoctors = results;
    });
  }

  
  void clearSearch() {
    searchController.clear();

    setState(() {
      filteredDoctors = doctors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("image/new.jpg", fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: searchController,
                  onChanged: searchDoctor,
                  decoration: InputDecoration(
                    hintText: "Search doctor...",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: searchController.text.isNotEmpty ? IconButton(
                            icon: Icon(Icons.close),
                            onPressed: clearSearch,
                          )
                        : null,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color.fromARGB(255, 245, 239, 239),
                    filled: true,
                  ),
                ),

                SizedBox(height: 15),

                Expanded(
                  child: filteredDoctors.isEmpty ? Center(
                          child: Text(
                            "No Results Found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        )
                          : ListView.builder(
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            return CoustemCard(
                              title: filteredDoctors[index]["title"]!,
                              subtitle: filteredDoctors[index]["subtitle"]!,
                              imagepath: filteredDoctors[index]["image"]!,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
