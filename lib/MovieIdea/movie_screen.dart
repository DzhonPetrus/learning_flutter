import 'package:flutter/material.dart';

import 'chart_category.dart';
import 'failure_model.dart';
import 'movie_model.dart';
import 'movie_repository.dart';

class MovieIdeaScreen extends StatefulWidget {
  const MovieIdeaScreen({Key? key}) : super(key: key);

  @override
  _MovieIdeaScreenState createState() => _MovieIdeaScreenState();
}

class _MovieIdeaScreenState extends State<MovieIdeaScreen> {
  late Future<List<Movie>> _futureMovies;
  String _state = 'unwatched';

  @override
  void initState() {
    super.initState();
    _futureMovies = MovieRepository().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${(_state == 'unwatched') ? 'Unwatched' : 'Watched'} Movies'),
        actions: [
          IconButton(
            icon: Icon((_state == 'unwatched') ? Icons.done : Icons.watch_later),
            tooltip: '${(_state == 'unwatched') ? 'Unwatched' : 'Watched'} Movies',
            onPressed: (){
              _state = (_state == 'watched') ? 'unwatched' : 'watched';
              _futureMovies = MovieRepository().getMovies();
              setState(() {});
            }, 
            )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){

      //   },
      //   child: const Icon(Icons.add_outlined),
      //   tooltip: 'Add New Movie',
      //   backgroundColor: Colors.blue[400],

      // ),
      body: RefreshIndicator(
        onRefresh: () async {
          _futureMovies = MovieRepository().getMovies();
          setState(() {});
        },
        child: getMovieBuilder(_state)
        ),
    );
  }

  FutureBuilder<List<Movie>> getMovieBuilder(state) {
    return FutureBuilder<List<Movie>>(
      future: _futureMovies,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final movies = snapshot.data!;
          if(state == 'watched') {
            final watchedMovies = movies.where((movie) => movie.isWatched).toList();
            return getMovieList(watchedMovies);
          } else {
            final unwatchedMovies = movies.where((movie) => !movie.isWatched).toList();
            return getMovieList(unwatchedMovies);
          }

        } else if(snapshot.hasError) {
          final failure = snapshot.error as Failure;
          return Center(child:Text(failure.message));
        }

        return const Center(child:CircularProgressIndicator());
      },
    );
  }

  ListView getMovieList(List<Movie> movies) {
    return ListView.builder(
            itemCount: movies.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) return ChartGenre(movies: movies);
              final movie = movies[index - 1];
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: getGenreColor(movie.genre),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.genre),
                    trailing: Checkbox(value: movie.isWatched, onChanged: (_){}),

                  )
                );
            },
            );
  }

}