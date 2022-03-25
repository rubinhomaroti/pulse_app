import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/data/entities/entities.dart';

class StatusBox extends StatelessWidget {
  const StatusBox({required this.patient, Key? key}) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Olá ${patient.getFirstName()}, como você está se sentindo hoje?",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
                  isCollapsed: true,
                  suffixIconConstraints: BoxConstraints(),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      MdiIcons.pencil,
                      size: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
