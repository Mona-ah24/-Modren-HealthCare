import 'package:flutter/material.dart';
import 'package:healthcare/CoustemCard.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> doctors = [
    {
      "title": "د. علي ناصر",
      "subtitle": "أخصائي الدماغ والأعصاب",
      "image": "image/7.jpg",
    },
    {
      "title": "د. أحمد عبدالله",
      "subtitle": "استشاري أمراض القلب",
      "image": "image/12.jpg",
    },
    {
      "title": "د. منى أحمد",
      "subtitle": "خبيرة تجميل الأسنان",
      "image": "image/17.jpg",
    },
    {
      "title": "د. سامي عمر",
      "subtitle": "أخصائي قسطرة القلب",
      "image": "image/13.jpg",
    },
    {
      "title": "د. نور حسن",
      "subtitle": "أخصائي آلام الصدر",
      "image": "image/14.jpg",
    },
    {
      "title": "د. زينب أحمد",
      "subtitle": "خبيرة أمراض صمامات القلب",
      "image": "image/16.jpg",
    },
    {
      "title": "د. هادي ياسر",
      "subtitle": "طبيب أسنان عام",
      "image": "image/15.jpg",
    },
    {
      "title": "د. صالح سالم",
      "subtitle": "جراح فم وأسنان",
      "image": "image/18.jpg",
    },
    {
      "title": "د. مازن علي",
      "subtitle": "استشاري طب الأعصاب",
      "image": "image/9.jpg",
    },
    {
      "title": "د. ندى راشد",
      "subtitle": "خبيرة اضطرابات الأعصاب",
      "image": "image/10.jpg",
    },
    {
      "title": "د. نور أحمد",
      "subtitle": "أخصائية السكتات الدماغية",
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
      resizeToAvoidBottomInset: true,

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
                    hintText: "ابحث عن طبيب...",
                    prefixIcon: Icon(Icons.search),

                    suffixIcon: searchController.text.isNotEmpty
                        ? IconButton(
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
                  child: filteredDoctors.isEmpty
                      ? Center(
                          child: Text(
                            "لا توجد نتائج",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredDoctors.length,
                          itemBuilder: (context, index) {
                            return CoustemCard(
                              id: "id${index + 1}",
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