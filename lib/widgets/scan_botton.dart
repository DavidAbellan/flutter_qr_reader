import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart' as util;

class ScanBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus),
        onPressed: () async {
          String barcodeScanRes = 'geo:38.483035,-0.776777';
          try {
            barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#ff6666", "Cancel", true, ScanMode.QR);
            print(barcodeScanRes);
          } catch (error) {
            barcodeScanRes = 'Failed to get platform version.';
          }

          //Api key AIzaSyCFdo3-EpAeQPUN4AAjWKO4lfjfoi9vltc

          ///if el usuario cancela
          if (barcodeScanRes == '-1') {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          //scanListProvider.nuevoScan(barcodeScanRes);
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
          util.launchURL(nuevoScan, context);
        });
  }
}
