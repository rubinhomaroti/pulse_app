import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/ui/widgets/timeline.dart';

import '../../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/gradient.png'), fit: BoxFit.fill),
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
                      Flexible(
                        child: Lottie.asset("assets/animations/gamer.json"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bia",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: IconText(
                                text: "São Paulo - SP",
                                icon: MdiIcons.mapMarkerOutline,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: IconText(
                                text: "Cardiopatia congênita",
                                icon: MdiIcons.heartOutline,
                                style: TextStyle(
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
                                    children: const [
                                      Text(
                                        "250",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Padding(
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
                                      children: const [
                                        Text(
                                          "470",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Padding(
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
                    ],
                  ),
                ),
              ),
            ),
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 16.0),
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
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: 32.0,
                                  child: Lottie.asset("assets/animations/bowie.json"),
                                  backgroundColor: Colors.white,
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
          SliverList(
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
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(MdiIcons.plusCircleOutline),
                                splashRadius: 16.0,
                                iconSize: 32.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Timeline(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 8.0,
                        right: 32.0,
                        bottom: 16.0,
                      ),
                      children: <Widget>[
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Container(height: 100, color: Colors.green),
                        Container(height: 100, color: Colors.blue),
                        Container(height: 100, color: Colors.red),
                        Container(height: 100, color: Colors.green),
                        Container(height: 100, color: Colors.blue),
                        Container(height: 50, color: Colors.red),
                        Container(height: 200, color: Colors.green),
                        Container(height: 100, color: Colors.blue),
                      ],
                      indicators: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.circle,
                              size: 8.0,
                              color: Colors.red,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text("19:30", style: TextStyle(fontSize: 12.0)),
                            ),
                          ],
                        ),
                        Icon(Icons.access_alarm),
                        Icon(Icons.access_alarm),
                        Icon(Icons.access_alarm),
                        Icon(Icons.access_alarm),
                        Icon(Icons.access_alarm),
                        Icon(Icons.backup),
                        Icon(Icons.accessibility_new),
                        Icon(Icons.access_alarm),
                      ],
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          )
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
