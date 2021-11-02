import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/movies_screen.dart';
import 'viewModel/movieslist_view_model.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: const MovieListPage(),
      ),
    );
  }
}
