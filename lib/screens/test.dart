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