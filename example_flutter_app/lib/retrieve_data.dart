import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'appbar.dart';
import 'drawer.dart';

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String message;
  final String status;

  const Album({
    required this.message,
    required this.status,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      message: json['message'],
      status: json['status'],
    );
  }
}

class RetrieveData extends StatefulWidget {
  @override
  State<RetrieveData> createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data!.message);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
