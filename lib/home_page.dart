import 'package:flutter/material.dart';
import 'package:flutter_tube/pages/high_page.dart';
import 'package:flutter_tube/pages/library_page.dart';
import 'package:flutter_tube/pages/start_page.dart';
import 'package:flutter_tube/pages/subscription_page.dart';
import 'package:flutter_tube/search_videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexNow = 0;
  String search = '';

  @override
  Widget build(BuildContext context) {
    List pages = [
      StartPage(search),
      const HighPage(),
      Container(),
      const SubscriptionPage(),
      const LibraryPage()
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Image.asset(
          'assets/images/youFlutter-logo.png',
          width: 120,
        ),
        actions: [
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.add_alert,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              var res =
                  await showSearch(context: context, delegate: SearchVideos());
              setState(() {
                search = res!;
              });
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: pages[_indexNow],
      backgroundColor: Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexNow,
        onTap: (index) {
          setState(() {
            _indexNow = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.grey[400],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: 'Em alta'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                size: 50,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_rounded), label: 'Inscrições'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: 'Biblioteca'),
        ],
      ),
    );
  }
}
