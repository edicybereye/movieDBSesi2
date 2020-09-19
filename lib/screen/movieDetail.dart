import 'package:flutter/material.dart';
import 'package:movie_app_new/models/movie.dart';

class MovieDetail extends StatefulWidget {
  final int index;
  final Movie models;

  const MovieDetail({Key key, this.index, this.models}) : super(key: key);
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w220_and_h330_face${widget.models.backdropPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 150,
                              child: Hero(
                                tag: "${widget.index}",
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w220_and_h330_face${widget.models.posterPath}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("${widget.models.originalTitle}"),
                                Text("${widget.models.voteAverage}"),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
