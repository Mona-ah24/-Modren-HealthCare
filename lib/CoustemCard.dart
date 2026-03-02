import 'package:flutter/material.dart';
import 'package:healthcare/success.dart';

class CoustemCard extends StatefulWidget {
  final String title;
  final String imagepath;
  final String subtitle;

  const CoustemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagepath,
  });

  @override
  State<CoustemCard> createState() => _CoustemCardState();
}

class _CoustemCardState extends State<CoustemCard> {
  bool orderPlaced = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(255, 230, 237, 238),
      elevation: 2.1,
      child: ListTile(
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 9, 108, 126),
        ),
        title: Text("${widget.title}"),
        subtitle: Text("${widget.subtitle}"),
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: Image.asset(
            "${widget.imagepath}",
            fit: BoxFit.contain,
          ).image,
        ),
        trailing: orderPlaced
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.message, color: Color.fromARGB(255, 39, 146, 150),
                      size: 20,
                    ),
                    onPressed: () {
                      
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 39, 146, 150),size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        orderPlaced = false;
                      });
                    },
                  ),
                ],
              )
            : ElevatedButton(
          onPressed: () {
            setState(() {
              orderPlaced = true;
            });
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => success()));
          },
          child: Text(
            orderPlaced ? "Booked" : "Get",
            style: TextStyle(color: const Color.fromARGB(255, 9, 108, 126)),
          ),
        ),
      ),
    );
  }
}
