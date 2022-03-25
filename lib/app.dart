import 'package:flutter/material.dart';

import 'ui/screens/home/home_page.dart';
import 'ui/screens/posts/posts_page.dart';
import 'ui/screens/register/register_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const RegisterPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/register': (context) => const RegisterPage(),
        '/posts': (context) => const PostsPage(),
      },
    );
  }
}
