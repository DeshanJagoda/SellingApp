import 'package:facebook_post/Widget/MarketplaceCard.dart';
import 'package:flutter/material.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  // List of car details
  final List<Map<String, dynamic>> carDetails = [
    {
      "title": "2018 Honda Civic",
      "description": "A reliable car in great condition, low mileage.",
      "price": "\$15,000",
      "location": "Los Angeles, CA",
      "date": "01/01/2024",
      "contact": "+1234567890",
      "reviews": "4.7/5",
      "imageUrl": "Assets/car/honda_civic_2018.jpg",
      "likeCount": 120,
      "commentCount": 45,
      "shareCount": 30,
    },
    {
      "title": "2020 Toyota Camry",
      "description":
          "A smooth drive, well-maintained with a full service history.",
      "price": "\$18,500",
      "location": "San Francisco, CA",
      "date": "05/12/2024",
      "contact": "+0987654321",
      "reviews": "4.8/5",
      "imageUrl": "Assets/car/toyota_camry_2020.jpg",
      "likeCount": 150,
      "commentCount": 50,
      "shareCount": 35,
    },
    {
      "title": "2019 BMW 3 Series",
      "description":
          "Sporty and luxurious, fully loaded with premium features.",
      "price": "\$25,000",
      "location": "New York, NY",
      "date": "07/15/2024",
      "contact": "+1122334455",
      "reviews": "4.9/5",
      "imageUrl": "Assets/car/bmw_3_series_2019.jpg",
      "likeCount": 200,
      "commentCount": 75,
      "shareCount": 50,
    },
    {
      "title": "2022 Tesla Model S",
      "description":
          "Electric car with cutting-edge technology, high-performance.",
      "price": "\$45,000",
      "location": "San Diego, CA",
      "date": "09/20/2024",
      "contact": "+1122334455",
      "reviews": "4.6/5",
      "imageUrl": "Assets/car/tesla.png",
      "likeCount": 250,
      "commentCount": 100,
      "shareCount": 60,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars'),
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 228, 222, 222),
        child: ListView.builder(
          padding: const EdgeInsets.all(1.0),
          scrollDirection: Axis.vertical,
          itemCount: carDetails.length,
          itemBuilder: (context, index) {
            final car = carDetails[index];
            return MarketplaceCard(
              title: car['title'] as String,
              description: car['description'] as String,
              price: car['price'] as String,
              location: car['location'] as String,
              date: car['date'] as String,
              contact: car['contact'] as String,
              reviews: car['reviews'] as String,
              imageUrl: car['imageUrl'] as String,
              initialLikeCount: car['likeCount'] as int,
              initialCommentCount: car['commentCount'] as int,
              initialShareCount: car['shareCount'] as int,
            );
          },
        ),
      ),
    );
  }
}
