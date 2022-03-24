import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/data/entities/entities.dart';
import 'package:pulse_app/ui/widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({required this.patient, Key? key}) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gradient.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 80.0,
            right: 40.0,
            bottom: 40.0,
          ),
          child: Row(
            children: [
              Flexible(child: Lottie.asset(patient.avatar!)),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: IconText(
                          text: "${patient.city} - ${patient.state}",
                          icon: MdiIcons.mapMarkerOutline,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: IconText(
                          text: patient.disease!,
                          icon: MdiIcons.heartOutline,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "${patient.friends?.length ?? 0}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Amigos",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0),
                              child: Column(
                                children: [
                                  Text(
                                    patient.posts?.length.toString() ?? "0",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Publicações",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
