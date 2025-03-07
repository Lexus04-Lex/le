// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/title.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://uyjedkojbrwwguwrzmwb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5amVka29qYnJ3d2d1d3J6bXdiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAwNjUzNzIsImV4cCI6MjA1NTY0MTM3Mn0.5h9YNs1RlUJFuyaIEuWku8KIpSYUT6DBlVrfR8Go1ms',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: HomePage(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomePage({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> suggestions = [
      "Flutter",
      "Dart",
      "Supabase",
      "Firebase",
      "React",
      "Vue",
      "Angular",
      "Python"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
              decoration: BoxDecoration(
                gradient: widget.isDarkMode
                    ? null
                    : const LinearGradient(
                        end: Alignment.bottomRight,
                        begin: Alignment.topLeft,
                        transform: GradientRotation(20 / 4),
                        colors: [
                          Color.fromARGB(255, 81, 173, 248),
                          Color.fromARGB(255, 139, 242, 142),
                          Color.fromARGB(255, 206, 113, 222),
                          Color.fromARGB(255, 108, 214, 214),
                          Color.fromARGB(255, 98, 97, 97),
                        ],
                      ),
                color: widget.isDarkMode ? Colors.black : null,
              ),
              
              child: Center(
            
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      
                    const SizedBox(height: 10,),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.isEmpty) {
                            return const Iterable<String>.empty();
                          }
                          return suggestions.where(
                              (entry) => entry.toLowerCase().contains(textEditingValue.text.toLowerCase()));
                        },
                        onSelected: (String selection) {
                          print('Selected: $selection');
                        },
                        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: 'Search Technology',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            
                    const SizedBox(height: 20.0),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: DecoratedBox(decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      
                      child:const TitleSection(
                        
                        name: 'Pearl Tech Solutions', location: 'Kireka Kampala Uganda') ,
                      ),
                    ),
                  ),
        
                  // const SizedBox(height: 20.0),
        
        
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: DecoratedBox(decoration: BoxDecoration(
                        color: Colors.blue,),
                        
                        ),),
        
                        
                  ),

                  ClipPath(
                    // clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.all(10),
                      child: ImageSection(
                        image: 'assets/pearl.jpeg',
                         ),
                        ),
                  ),
        
                  
                  Container(
                    margin: EdgeInsets.all(20),
                    
                    child: Text(
                   "DESCRIPTION: Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run."),
                  ),

                  Center(
                    child: Container(
                      
                      padding: EdgeInsets.only(top: 20),
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      gradient: LinearGradient(colors: [
         
                            Colors.amber,
                            Colors.amberAccent,
                            Colors.blue,
                            Colors.blueGrey,
                      ])
                      ),
                      
                      child: const Buttons(),
                    ),
                    
                  ),
                  
                    const SizedBox(height: 20.0),
            
                    RatingBar.builder(
                      minRating: 1,
                      maxRating: 5,
                      allowHalfRating: true,
                      initialRating: 3.0,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print('Rating: $rating');
                      },
                    ),
            
                    const SizedBox(height: 20.0),
                    const Text('Rate our app on the play store'),
            
                    // const SizedBox(height: 20.0),
            
                    
            
                    CupertinoSwitch(
                      value: widget.isDarkMode,
                      onChanged: widget.onThemeChanged,
                      activeTrackColor: CupertinoColors.activeBlue,
                      inactiveTrackColor: CupertinoColors.systemGrey,
                      thumbColor: CupertinoColors.systemIndigo,
                      inactiveThumbColor: CupertinoColors.systemPink,
                    ),
                    Text(
                      widget.isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(
                        fontSize: 18,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
    
  }
}
