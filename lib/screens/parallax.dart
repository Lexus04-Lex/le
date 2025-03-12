import 'package:flutter/material.dart';

class ParallaxExample extends StatelessWidget {
  const ParallaxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Set a fixed height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return LocationListItem(
            name: location.name,
            country: location.place,
            imageUrl: location.imageUrl,
          );
        },
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String country;

  const LocationListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Set width for each item
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300], // Temporary background to avoid white screen
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200, // Ensure images have a height
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    country,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Location {
  const Location({
    required this.name,
    required this.place,
    required this.imageUrl,
  });

  final String name;
  final String place;
  final String imageUrl;
}

const urlPrefix = 'https://docs.flutter.dev/cookbook/img-files/effects/parallax';
const locations = [
  Location(name: 'Mount Rushmore', place: 'U.S.A', imageUrl: '$urlPrefix/01-mount-rushmore.jpg'),
  Location(name: 'Gardens By The Bay', place: 'Singapore', imageUrl: '$urlPrefix/02-singapore.jpg'),
  Location(name: 'Machu Picchu', place: 'Peru', imageUrl: '$urlPrefix/03-machu-picchu.jpg'),
  Location(name: 'Vitznau', place: 'Switzerland', imageUrl: '$urlPrefix/04-vitznau.jpg'),
  Location(name: 'Bali', place: 'Indonesia', imageUrl: '$urlPrefix/05-bali.jpg'),
  Location(name: 'Mexico City', place: 'Mexico', imageUrl: '$urlPrefix/06-mexico-city.jpg'),
  Location(name: 'Cairo', place: 'Egypt', imageUrl: '$urlPrefix/07-cairo.jpg'),
];
