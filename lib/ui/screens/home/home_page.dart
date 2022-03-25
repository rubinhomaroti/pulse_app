import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/data/entities/entities.dart';
import 'package:pulse_app/data/mocks/patients_mock.dart';
import 'components/components.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Patient newPatient = PatientsMock.getPatient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 240.0,
            flexibleSpace: Header(patient: newPatient),
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.dotsVertical),
                color: Colors.white,
                onPressed: () {},
                iconSize: 32.0,
                splashRadius: 16.0,
              ),
            ],
          ),
          StatusBox(patient: newPatient),
          FriendsList(patient: newPatient),
          Feed(patient: newPatient),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(MdiIcons.accountCircleOutline), label: "Perfil"),
          BottomNavigationBarItem(icon: Icon(MdiIcons.bullseyeArrow), label: "Metas"),
          BottomNavigationBarItem(icon: Icon(MdiIcons.homeOutline), label: "Início"),
          BottomNavigationBarItem(icon: Icon(MdiIcons.bookOpenPageVariantOutline), label: "Diário"),
          BottomNavigationBarItem(icon: Icon(MdiIcons.imageOutline), label: "Publicações"),
        ],
        currentIndex: 2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.purple),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        iconSize: 32.0,
      ),
    );
  }
}
