import 'package:flutter/material.dart';
import 'package:movie_app_new/custom/itemTab.dart';
import 'package:movie_app_new/custom/posterMovie.dart';
import 'package:movie_app_new/screen/movieDetail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  int _selectPage = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[300],
              Colors.indigo[800],
            ],
          )),
          child: TabBarView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: PageView.builder(
                        onPageChanged: (a) {
                          setState(() {
                            _selectPage = a;
                          });
                        },
                        controller: pageController,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetail(
                                            index: index,
                                          )));
                            },
                            child: PosterMovie(
                              selectPage: _selectPage,
                              index: index,
                              imgUrl:
                                  "https://image.tmdb.org/t/p/w220_and_h330_face/mY7SeH4HFFxW1hiI6cWuwCRKptN.jpg",
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Title Movie",
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
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "7.0",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "IMDB",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                child: Center(
                  child: Text("Popular"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Top Rated"),
                ),
              ),
              Container(
                child: Center(
                  child: Text("Coming Soon"),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(),
        // NAVIGASI ATAS
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              color: Colors.white,
              width: 0.5,
            )),
            isScrollable: true,
            tabs: [
              ItemTabs(
                icon: Icons.home,
                title: "Now Playing",
              ),
              ItemTabs(
                icon: Icons.favorite,
                title: "Popular",
              ),
              ItemTabs(
                icon: Icons.feedback,
                title: "Top Rated",
              ),
              ItemTabs(
                title: "Coming Soon",
                icon: Icons.history,
              ),
              // Tab(
              //   icon: Icon(Icons.home),
              //   text: "Popular",
              // ),
              // Tab(
              //   icon: Icon(Icons.home),
              //   text: "Top Rated",
              // ),
              // Tab(
              //   icon: Icon(Icons.home),
              //   text: "Coming Soon",
              // ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Movies"),
          centerTitle: true,
          // MENU SEBELAH KANAN ATAS
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
