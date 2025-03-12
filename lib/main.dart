import 'package:flutter/material.dart';
import 'package:practice/screens/parallax.dart';
import 'package:practice/screens/title.dart';
 
 void main(){
   runApp(MyApp());
 }

 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: HomeWidget(),
    );
  }  
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: Text('NS&D TECHNOLOGIES'),
  elevation: 10,
  backgroundColor: Colors.blue,
  centerTitle: true,
  actions: [
    IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {
        // Add functionality here
      },
    ),
  ],
),

      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.yellow
          ])
        ),
        
        child: Container(
          // margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AutoCompleteExample(),
                ), 

                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(),
                  child: TextSection(text: "At NS&D Technologies, we are passionate about building innovative software solutions that drive businesses forward. Our team of skilled developers, designers, and engineers specialize in creating cutting-edge applications tailored to meet the evolving needs of our clients.With expertise in mobile and web development, cloud computing, AI, and cybersecurity, we deliver robust and scalable solutions that empower organizations to stay ahead in the digital landscape. Whether you're a startup looking to build your first app or an enterprise in need of custom software, NS&D Technologies is committed to providing excellence at every stage.Our mission is simple: to transform ideas into reality through technology, efficiency, and creativity. Partner with us today and experience the future of software development"),
               ),

               const SizedBox(height: 10,),

                       Column(
                         children: [
                           Container(
                                                    
                            decoration: BoxDecoration(),
                            child: ParallaxExample(),
                           ),
                         ],
                       ),
              
               const SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(),
                  child: Buttons(),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Rate(),
                )
              ],
            ),
        ),
      ),
    );
  }
}