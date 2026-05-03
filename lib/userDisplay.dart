import 'package:flutter/material.dart';
import 'package:healthcare/bdf_service.dart';
import 'package:healthcare/userDataInput.dart';
import 'package:healthcare/sqlDatabase.dart';
import 'package:healthcare/userModel.dart';
import 'package:healthcare/excel_service.dart';
class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() async {
    final data = await DatabaseHelper.instance.getUsers();
    setState(() => users = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final u = users[index];
          return ListTile(
            title: Text(u.name),
            subtitle: Text('${u.phone} | ${u.age} | ${u.gender} | ${u.email}'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => ExcelService.exportToExcel(users),
            label: const Text('Export to Excel'),
            icon: const Icon(Icons.table_chart),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: () => PdfService.exportToPdf(users),
            label: const Text('Export to PDF'),
            icon: const Icon(Icons.picture_as_pdf),
          ),
        ],
      ),
    );
  }
}