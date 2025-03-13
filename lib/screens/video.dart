import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Lexus extends StatefulWidget {
  const Lexus({super.key});

  @override
  State<Lexus> createState() => _LexusState();
}

class _LexusState extends State<Lexus> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState(){
    super.initState();
  _controller = VideoPlayerController.networkUrl(
    Uri.parse('https://www.skysports.com/watch/video/13327482/oleksandr-zinchenko-arsenal-against-real-madrid-will-be-an-amazing-experience')
  );
  _initializeVideoPlayerFuture = _controller.initialize();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          FutureBuilder(
            future:_initializeVideoPlayerFuture ,
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
                );
                
              }else{
                return Center(child: CircularProgressIndicator());
              }
              
            }
            
          ),
          FloatingActionButton(onPressed: (){
            if(_controller.value.isPlaying){
              _controller.pause();
            } else {
              _controller.play();
            }
            Icon(_controller.value.isPlaying ?
            Icons.pause : Icons.play_arrow
            );
          }),
        ],
      ),
      
      );
  }


}