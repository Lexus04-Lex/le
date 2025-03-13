import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            Expanded(child:
            Text(
              'Alex',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ),

            Expanded(child: 
            Text(
              'A software Company',
              style: TextStyle(fontSize: 18),
            ),
            ),

            Expanded(child: 
            Icon(Icons.person),
            ),
          ],
        
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWithText(color: color, label: 'CALL', icon: Icons.call),
          ButtonWithText(color: color, label: 'SHARE', icon: Icons.share),
          ButtonWithText(color: color, label: 'ROUTE', icon: Icons.near_me)
          
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({super.key, required this.color, required this.label, required this.icon});
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(color:color, icon),
        Padding(padding: EdgeInsets.all(10)),

        Text(
          label, 
          style: TextStyle(color: color),
        )
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(text, softWrap: true,),
    );
  }
}

class Rate extends StatelessWidget {
  const Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          RatingBar(
            allowHalfRating: true,
            
            minRating: 1,
            maxRating: 5,
            ratingWidget:
           RatingWidget(
            full:Icon(Icons.star, color: Colors.amber,),
             half:Icon(Icons.star_half, color: Colors.amber,), 
             empty: Icon(Icons.star_border, color: Colors.amber,)),
            onRatingUpdate: (value) => ('rating'),
          ),
        ],
      ),
    );
  }
}

class AutoCompleteExample extends StatelessWidget {
  const AutoCompleteExample({super.key});

  static const List<String> _options = <String>[
    'Flutter',
    'Dart',
    'Firebase',
    'Supabase',
    'Kotlin',
    'Swift',
    'JavaScript',
    'Python'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return _options.where((String option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You selected: $selection')),
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: 'Search',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
          ),
        );
      },
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoPlayerApp());

// class VideoPlayerApp extends StatelessWidget {
//   const VideoPlayerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Video Player Demo',
//       home: VideoPlayerScreen(),
//     );
//   }
// }

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

//     // Initialize the controller and store the Future for later use.
//     _initializeVideoPlayerFuture = _controller.initialize();

//     // Use the controller to loop the video.
//     _controller.setLooping(true);
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Butterfly Video')),
//       // Use a FutureBuilder to display a loading spinner while waiting for the
//       // VideoPlayerController to finish initializing.
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the VideoPlayerController has finished initialization, use
//             // the data it provides to limit the aspect ratio of the video.
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               // Use the VideoPlayer widget to display the video.
//               child: VideoPlayer(_controller),
//             );
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Wrap the play or pause in a call to `setState`. This ensures the
//           // correct icon is shown.
//           setState(() {
//             // If the video is playing, pause it.
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               // If the video is paused, play it.
//               _controller.play();
//             }
//           });
//         },
//         // Display the correct icon depending on the state of the player.
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }