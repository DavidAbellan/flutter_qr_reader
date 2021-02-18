import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart' as util;

class MapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: Key(scanListProvider.scans[i].id.toString()),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarScansPorId(scanListProvider.scans[i].id);
              },
              child: ListTile(
                leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
                title: Text(scanListProvider.scans[i].valor),
                subtitle: Text(scanListProvider.scans[i].id.toString()),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                onTap: () => util.launchURL(scanListProvider.scans[i], context),
              ),
            ));
  }
}
