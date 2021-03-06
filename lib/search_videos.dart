import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchVideos extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
      IconButton(
        onPressed: null,
        icon: Icon(Icons.mic),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data?[index]),
                  leading: Icon(Icons.arrow_back_sharp),
                  onTap: () {
                    close(context, snapshot.data?[index]);
                  },
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
        },
      );
    }
  }

  Future<List> suggestions(String search) async {
    http.Response response = await http.get(Uri.parse(
        "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"));

    if (response.statusCode == 200) {
      return json.decode(response.body)[1].map((sug) {
        return sug[0];
      }).toList();
    } else {
      throw Exception("Failed to load suggestions");
    }
  }
}
