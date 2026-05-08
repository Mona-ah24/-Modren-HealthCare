import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:healthcare/userModel.dart';

class PdfService {
  static Future<String?> exportToPdf(List<UserModel> users) async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.Table.fromTextArray(
              headers: ['Name', 'Phone', 'Age', 'Gender', 'Email'],
              data: users.map((u) => [
                u.name,
                u.phone,
                u.age.toString(),
                u.gender,
                u.email,
              ]).toList(),
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              cellAlignment: pw.Alignment.center,
            );
          },
        ),
      );

      // حفظ الملف في Documents
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/users.pdf';
      final file = File(path);
      await file.writeAsBytes(await pdf.save(), flush: true);

      print('✅ PDF file saved at: $path');

      // مشاركة أو طباعة
      await Printing.sharePdf(bytes: await pdf.save(), filename: 'users.pdf');

      return path;
    } catch (e) {
      print('❌ Error exporting PDF: $e');
      return null;
    }
  }
}