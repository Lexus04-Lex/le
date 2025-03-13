import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));


if(response.statusCode == 200)
{
  return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic> );

} else {
  throw Exception("Album Failed to load ");
}
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'userId': int userId, 'id': int id, 'title': String title} => Album (
          userId: userId,
          id: id,
          title: title,

        ),
      _=> throw const FormatException('Album Failed to load')
    };
  }
}

class Internet extends StatefulWidget {
  const Internet({super.key});

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  late Future<Album> futureAlbum;
  @override
  void initState(){
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: futureAlbum, builder: (context, snapshot){
      if(snapshot.hasData){
        return Text(snapshot.data!.title);
      } else if(snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return const CircularProgressIndicator();
    }
    );
  }
}