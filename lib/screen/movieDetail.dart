import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app_new/custom/itemRatingMovie.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Platform.isIOS
              ? Icon(Icons.arrow_back_ios)
              : Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[300],
                Colors.indigo[800],
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${widget.models.originalTitle}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Category Movie | 2 Hours",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ItemRating(
                                          rating: "${widget.models.popularity}",
                                          titleRating: "Popularity",
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        ItemRating(
                                          rating: "${widget.models.voteCount}",
                                          titleRating: "Vote",
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        ItemRating(
                                          rating:
                                              "${widget.models.voteAverage}",
                                          titleRating: "Ratings",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.models.overview.length > 150
                    ? "${widget.models.overview.substring(0, 150)}..."
                    : "${widget.models.overview}"),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    )),
                child: Text(
                  "Buy Tickets",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
