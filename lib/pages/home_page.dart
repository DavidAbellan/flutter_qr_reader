import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/pages/direcciones_page.dart';
import 'package:qrreader/pages/mapas_page.dart';
import 'package:qrreader/providers/ui_provider.dart';
import 'package:qrreader/widgets/custom_navigatorbar.dart';
import 'package:qrreader/widgets/scan_botton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () => {})
        ],
      ),
      body: MapasPage(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanBotton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  //obtener el selected menu opt

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
