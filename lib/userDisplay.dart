import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthcare/userModel.dart';
import 'package:healthcare/excel_service.dart';
import 'package:healthcare/bdf_service.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  Stream<List<UserModel>> _getUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();
    });
  }

  void _exportExcel(List<UserModel> users) {
    ExcelService.exportToExcel(users);
  }

  void _exportPdf(List<UserModel> users) {
    PdfService.exportToPdf(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),

      body: StreamBuilder<List<UserModel>>(
        stream: _getUsers(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,

            itemBuilder: (context, index) {
              final u = users[index];

              return Card(
                margin: const EdgeInsets.all(8),

                child: ListTile(
                  leading: const Icon(Icons.person),

                  title: Text(u.name),

                  subtitle: Text(
                    '📞 ${u.phone}\n'
                    '🎂 Age: ${u.age} | ⚧ ${u.gender}\n'
                    '📧 ${u.email}',
                  ),

                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),

      // EXPORT BUTTONS
      floatingActionButton: StreamBuilder<List<UserModel>>(
        stream: _getUsers(),

        builder: (context, snapshot) {
          final users = snapshot.data ?? [];

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                heroTag: "excel",
                onPressed: users.isEmpty ? null : () => _exportExcel(users),
                label: const Text('Excel'),
                icon: const Icon(Icons.table_chart),
              ),

              const SizedBox(height: 12),

              FloatingActionButton.extended(
                heroTag: "pdf",
                onPressed: users.isEmpty ? null : () => _exportPdf(users),
                label: const Text('PDF'),
                icon: const Icon(Icons.picture_as_pdf),
              ),
            ],
          );
        },
      ),
    );
  }
}