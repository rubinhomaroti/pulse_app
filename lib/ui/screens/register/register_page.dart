import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pulse_app/ui/widgets/avatar.dart';
import 'package:pulse_app/ui/widgets/icon_text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 244, 205),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 48.0),
              child: Center(
                child: Text(
                  "ESCOLHA SEU AVATAR",
                  style: TextStyle(
                    color: Color.fromARGB(255, 153, 123, 218),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: AvatarCarousel(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 16.0, right: 32.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconText(
                          icon: MdiIcons.weightKilogram,
                          text: "Peso:",
                          iconColor: Colors.black,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: IconText(
                            icon: MdiIcons.bicycleElectric,
                            text: "Atividade Física:",
                            iconColor: Colors.black,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(keyboardType: TextInputType.text),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: IconText(
                            icon: MdiIcons.heartPulse,
                            text: "Pressão Média:",
                            iconColor: Colors.black,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(keyboardType: TextInputType.number),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: IconText(
                            icon: MdiIcons.pill,
                            text: "Medicamentos:",
                            iconColor: Colors.black,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(keyboardType: TextInputType.text),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36.0, right: 36.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  child: const Text("Próximo"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
