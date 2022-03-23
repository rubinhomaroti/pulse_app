import 'package:pulse_app/data/entities/entities.dart';
import 'package:uuid/uuid.dart';

class PatientsMock {
  static Patient getPatient() => Patient(
        id: const Uuid().v4().toUpperCase(),
        name: 'Rubens Maroti',
        weight: 80.0,
        city: 'São Paulo',
        state: 'SP',
        avatar: 'assets/animations/bowie.json',
        disease: 'Cardiopatia congênita',
        activities: ['Natação', 'Surf'],
        friends: getFriends(),
      );

  static List<Patient> getFriends() => [
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Maria da Silva",
          city: "São Paulo",
          state: "SP",
          disease: "Cardiopatia congênita",
          avatar: "assets/animations/afro-woman.json",
          activities: ['Dança', 'Corrida'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Pedro de Melo",
          city: "São Bernardo do Campo",
          state: "SP",
          disease: "Tumores no coração",
          avatar: "assets/animations/arts-man.json",
          activities: ['Futebol', 'Tênis'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Joana Darc",
          city: "Florianópolis",
          state: "SC",
          disease: "Aneurisma da aorta",
          avatar: "assets/animations/amy.json",
          activities: ['Corrida', 'Natação'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Joaquim Barros",
          city: "Santo André",
          state: "SP",
          disease: "Arritmias cardíacas",
          avatar: "assets/animations/egyptian.json",
          activities: ['Vôlei', 'Futebol'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Beatriz Barbosa",
          city: "São Paulo",
          state: "SP",
          disease: "Trombose venosa",
          avatar: "assets/animations/flowers.json",
          activities: ['Natação'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Patricia Mendes",
          city: "Ubatuba",
          state: "SP",
          disease: "Febre reumática",
          avatar: "assets/animations/frida.json",
          activities: ['Natação', 'Surf'],
        ),
        Patient(
          id: const Uuid().v4().toUpperCase(),
          name: "Caio Castro",
          city: "Rio de Janeiro",
          state: "RJ",
          disease: "Angina de peito",
          avatar: "assets/animations/guitarrist.json",
          activities: ['Natação', 'Surf'],
        ),
      ];
}
