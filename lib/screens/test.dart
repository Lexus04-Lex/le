import 'package:flutter/material.dart';
import 'package:practice/screens/parallax.dart';

class TestParallax extends StatelessWidget {
  const TestParallax({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index){
        final location = locations[index];
        return LocationListItem(imageUrl: location.imageUrl, name: location.name, country: location.place);
      }
    );
  }
}

class LocationListItem extends StatelessWidget {
  const LocationListItem({super.key, required this.imageUrl, required this.name, required this.country});
  final String name;
  final String imageUrl;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)], begin: Alignment.center, end:  Alignment.topRight),
             
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.2),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(imageUrl, fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                   
              
              },
              errorBuilder: (context, error, stackTrace){

              return const Center(child: Icon(Icons.error, color: Colors.red,),);

              },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({super.key});

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();

//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//       ),
//     );

//     _initializeVideoPlayerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Complete the code in the next step.
//     return Container();
//   }
// }
//---------------------------------------------------
//New
// Use a FutureBuilder to display a loading spinner while waiting for the
// VideoPlayerController to finish initializing.
// FutureBuilder(
//   future: _initializeVideoPlayerFuture,
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.done) {
//       // If the VideoPlayerController has finished initialization, use
//       // the data it provides to limit the aspect ratio of the video.
//       return AspectRatio(
//         aspectRatio: _controller.value.aspectRatio,
//         // Use the VideoPlayer widget to display the video.
//         child: VideoPlayer(_controller),
//       );
//     } else {
//       // If the VideoPlayerController is still initializing, show a
//       // loading spinner.
//       return const Center(child: CircularProgressIndicator());
//     }
//   },
// )

//Another one -------------------------------------
// FloatingActionButton(
//   onPressed: () {
//     // Wrap the play or pause in a call to `setState`. This ensures the
//     // correct icon is shown.
//     setState(() {
//       // If the video is playing, pause it.
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//       } else {
//         // If the video is paused, play it.
//         _controller.play();
//       }
//     });
//   },
//   // Display the correct icon depending on the state of the player.
//   child: Icon(
//     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//   ),
// )

