import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/data/entities/patient.dart';
import 'package:pulse_app/ui/widgets/widgets.dart';

class Feed extends StatefulWidget {
  const Feed({required this.patient, Key? key}) : super(key: key);

  final Patient patient;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final ImagePicker _imagePicker = ImagePicker();

  final List<Widget> _activities = <Widget>[];

  final List<Widget> _indicators = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 20.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Recente",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: PopupMenuButton(
                          icon: const Icon(MdiIcons.plusCircleOutline),
                          iconSize: 32.0,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () async => await _pickImage(),
                              child: Row(
                                children: const [
                                  Icon(MdiIcons.fileImagePlusOutline),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text("Foto"),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              onTap: () async => await _displayNewJournalDialog(context),
                              child: Row(
                                children: const [
                                  Icon(MdiIcons.notebookPlusOutline),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text("Diário"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Timeline(
                children: _activities,
                indicators: _indicators,
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 8.0,
                  right: 32.0,
                  bottom: 16.0,
                ),
              ),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }

  Future _pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      addActivity(image: image);
    }
  }

  Future<void> _displayNewJournalDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Novo diário'),
            content: TextField(
              onChanged: (value) {},
              controller: TextEditingController(),
              decoration: const InputDecoration(hintText: "Como está sendo o seu dia?"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  void addActivity({XFile? image, String? journal}) async {
    Widget? imgActivity;
    if (image != null) {
      imgActivity = await _buildImageActivity(image);
    }
    setState(() {
      if (imgActivity != null) {
        widget.patient.addImagePost(image?.path);
        _activities.insert(0, imgActivity);
        _indicators.insert(0, _buildHourOfDay(TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)));
      } else if (journal != null) {
        widget.patient.addImagePost(journal);
        _activities.insert(0, _buildJournalActivity(journal));
        _indicators.insert(0, _buildHourOfDay(TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute)));
      }
    });
  }

  Future<Widget> _buildImageActivity(XFile image) async {
    Uint8List imageBytes = await image.readAsBytes();
    return Image.memory(imageBytes);
  }

  Widget _buildJournalActivity(String journal) {
    return Text(journal);
  }

  Widget _buildHourOfDay(TimeOfDay time) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.circle,
          size: 8.0,
          color: Colors.red,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text("${time.hour}:${time.minute}", style: const TextStyle(fontSize: 12.0)),
        ),
      ],
    );
  }
}
