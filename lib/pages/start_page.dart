import 'package:flutter/material.dart';
import 'package:flutter_tube/api.dart';
import 'package:flutter_tube/models/video.dart';
import 'package:flutter_tube/pages/video_view.dart';

class StartPage extends StatefulWidget {
  final String search;
  const StartPage(this.search, {Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

_listvideos(String text) {
  Api api = Api();
  return api.search(text);
}

String videoId = '';

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listvideos(widget.search),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video>? videos = snapshot.data;
                  Video video = videos![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                VideoView(video.id.toString())),
                      );

                      // FlutterYoutube.playYoutubeVideoById(
                      //     apiKey: YOUTUBE_KEY_API, videoId: video.id);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.thumb.toString()),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            video.title!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(video.channel!,
                              style: const TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 4,
                  color: Colors.grey[850],
                ),
                itemCount: snapshot.data!.length,
              );
            } else {
              return const Center(
                child: Text('Nenhum dado encontrado'),
              );
            }
        }
      },
    );
  }
}
