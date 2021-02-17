import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
              title: Text(scanListProvider.scans[i].valor),
              subtitle: Text(scanListProvider.scans[i].id.toString()),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => print('abrir dirección...'),
            ));
  }
}
