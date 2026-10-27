import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pavlova Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  final String description =
      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Tubera', 
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // 1. The Image (Changed to Image.asset for local file)
          Image.asset(
  'lib/assets/pavlova.webp',
  height: 250,
  fit: BoxFit.cover,
),
          
          // 2. Title and Description
          const SizedBox(height: 15),
          const Text(
            'Strawberry Pavlova',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),

          // 3. Star Rating
          buildStar(3, 90),
          const SizedBox(height: 20),

          // 4. Icon Tabs
          buildRowTabs(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Method to build the Stars and Reviews
  Widget buildStar(int rating, int numreviews) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= rating; i++)
          const Icon(Icons.star, color: Colors.amber, size: 24),
        for (int i = 1; i <= (5 - rating); i++)
          const Icon(Icons.star, color: Colors.grey, size: 24),
        const SizedBox(width: 20),
        Text(
          '$numreviews Reviews',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  // Method to build the Individual Icon Tabs
  Widget buildIconTab(IconData iconval, String title, String time) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconval, color: Colors.amber, size: 28),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }

  // Method to build the Row of Tabs
  Widget buildRowTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIconTab(Icons.timer_outlined, 'PREP', '25 min'),
        buildIconTab(Icons.restaurant_menu, 'COOK', '1 hr'),
        buildIconTab(Icons.group_outlined, 'FEEDS', '4-6'),
      ],
    );
  }
}