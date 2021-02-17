import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';

class ScanBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes;
          try {
            barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#ff6666", "Cancel", true, ScanMode.QR);
            print(barcodeScanRes);
          } catch (error) {
            barcodeScanRes = 'Failed to get platform version.';
          }
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          scanListProvider.nuevoScan(barcodeScanRes);
          scanListProvider.nuevoScan('geo:15.33,15.66');
          print('respuestaaaa');
          print(barcodeScanRes);
        });
  }
}
