import 'package:flutter/material.dart';
import 'package:movieapp_mvvm_flutter/viewModel/movieslist_view_model.dart';
import 'package:movieapp_mvvm_flutter/widgets/movies_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Movies MVVM Example")),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    vm.fetchMovies(value);
                    _controller.clear();
                  }
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: MovieList(movies: vm.movies),
            ), //we will create this further down
          ],
        ),
      ),
    );
  }
}
