import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:healthcare/userModel.dart';

class ExcelService {
  static Future<String?> exportToExcel(List<UserModel> users) async {
    try {
      final excel = Excel.createExcel();
      final sheet = excel['Users'];

      // إضافة العناوين
      // sheet.appendRow(['Name', 'Phone', 'Age', 'Gender', 'Email']);

      // // إضافة البيانات
      // for (var user in users) {
      //   sheet.appendRow([
      //     user.name.toString(),
      //     user.phone,
      //     user.age.toString(),
      //     user.gender,
      //     user.email,
      //   ]);
      // }

      // حفظ الملف في Documents
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/users.xlsx';
      final fileBytes = excel.encode();

      if (fileBytes != null) {
        final file = File(path);
        await file.writeAsBytes(fileBytes, flush: true);
        print('✅ Excel file saved at: $path');
        return path;
      }
      return null;
    } catch (e) {
      print('❌ Error exporting Excel: $e');
      return null;
    }
  }
}