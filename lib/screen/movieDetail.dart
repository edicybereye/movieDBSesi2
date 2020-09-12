import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final int index;

  const MovieDetail({Key key, this.index}) : super(key: key);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: 150,
                  child: Hero(
                    tag: "${widget.index}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w220_and_h330_face/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
