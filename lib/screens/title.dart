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

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 250, fit: BoxFit.cover,);
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