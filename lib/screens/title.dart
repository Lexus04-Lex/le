import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      
      child: Row(
        
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          /*3*/
          Icon(Icons.star, color: Colors.white),
          const Text('41'),
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
          ButtonWithText(icon: Icons.call, label: 'CALL', color: color),
          ButtonWithText(icon: Icons.near_me, label: 'ROUTE', color: color),
          ButtonWithText(icon: Icons.share, label: 'SHARE', color: color,)
        ],
      ),

    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({super.key,
  required this.icon,
  required this.label,
  required this.color,
  });
  final IconData icon;
  final String label;
  final Color color;
  
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,

      children: [
        Icon(icon, color: color),
        Padding(padding: EdgeInsets.all(20.0),
        child: Text(
          label,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color),
        ),
        
        ),
        
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true, 
      style: TextStyle(
        wordSpacing: 2,
        letterSpacing: 1,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(image, width: 600, height: 240, fit: BoxFit.cover,
      
      ),
    );
  }
}