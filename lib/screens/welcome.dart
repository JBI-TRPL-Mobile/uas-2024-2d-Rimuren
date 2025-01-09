import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePlaceholder(),
                SizedBox(height: 20),
                DescriptionText(),
                SizedBox(height: 40),
                ActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'images/Everest.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.white,
            elevation: 5,
          ),
          child: Row(
            children: [
              SizedBox(width: 5),
              Text(
                "Sign In",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {
             Navigator.pushNamed(context, '/signup');
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.white,
            elevation: 5,
          ),
          child: Row(
            children: [
              SizedBox(width: 5),
              Text(
                "Sign Up",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
