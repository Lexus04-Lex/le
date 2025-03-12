import 'package:flutter/material.dart';
import 'package:practice/screens/parallax.dart'; // Ensure this file exists
import 'package:practice/screens/title.dart'; // Ensure this file exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: const Text('NS&D TECHNOLOGIES'),
        elevation: 10,
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add menu functionality here
            },
          ),
        ],
      ),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.yellow],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const AutoCompleteExample(), // Ensure this widget exists
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              child: const TextSection(
                text:
                    "At NS&D Technologies, we are passionate about building innovative software solutions that drive businesses forward. Our team of skilled developers, designers, and engineers specialize in creating cutting-edge applications tailored to meet the evolving needs of our clients. With expertise in mobile and web development, cloud computing, AI, and cybersecurity, we deliver robust and scalable solutions that empower organizations to stay ahead in the digital landscape. Whether you're a startup looking to build your first app or an enterprise in need of custom software, NS&D Technologies is committed to providing excellence at every stage. Our mission is simple: to transform ideas into reality through technology, efficiency, and creativity. Partner with us today and experience the future of software development.",
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 200, // Ensures horizontal scrolling visibility
              child: ParallaxExample(),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              child: const Buttons(), // Ensure this widget exists
            ),
            const SizedBox(height: 10),
            const Rate(), // Ensure this widget exists
          ],
        ),
      ),
    );
  }
}
