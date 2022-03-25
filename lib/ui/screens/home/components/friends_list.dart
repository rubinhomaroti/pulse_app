import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pulse_app/data/entities/entities.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({required this.patient, Key? key}) : super(key: key);

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return SliverVisibility(
      visible: patient.hasFriends(),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Amigos",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                height: 104.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: patient.friends?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              radius: 32.0,
                              child: Lottie.asset(patient.friends![index].avatar!),
                              backgroundColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
