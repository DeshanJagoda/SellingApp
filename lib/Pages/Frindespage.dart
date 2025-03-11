import 'package:facebook_post/Widget/Frindescard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  final List<Map<String, dynamic>> friendsList = [
    {
      'name': 'John Doe',
      'date': '2015-01-01T00:00:00',
      'friendsCount': '10',
      'image': 'Assets/post/User.jpg',
      'likes': 20,
      'comments': 12,
      'shares': 5,
    },
    {
      'name': 'Jane Smith',
      'date': '2017-03-15T00:00:00',
      'friendsCount': '15',
      'image': 'Assets/post/User1.jpg',
      'likes': 35,
      'comments': 8,
      'shares': 2,
    },
    {
      'name': 'Michael Johnson',
      'date': '2019-07-20T00:00:00',
      'friendsCount': '5',
      'image': 'Assets/post/User2.jpg',
      'likes': 10,
      'comments': 3,
      'shares': 1,
    },
    {
      'name': 'Emily Davis',
      'date': '2021-11-05T00:00:00',
      'friendsCount': '8',
      'image': 'Assets/post/User3.png',
      'likes': 25,
      'comments': 6,
      'shares': 3,
    },
  ];

  String formatDate(String dateString) {
    try {
      final parsedDate = DateTime.parse(dateString);
      return DateFormat('MMM d, yyyy')
          .format(parsedDate); // Format as "Jan 1, 2015"
    } catch (e) {
      return dateString; // If parsing fails, return original
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller'),
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 228, 222, 222),
        child: ListView.builder(
          itemCount: friendsList.length,
          itemBuilder: (context, index) {
            var friend = friendsList[index];
            return FriendCard(
              name: friend['name'],
              date: formatDate(friend['date']),
              friendsCount: friend['friendsCount'],
              image: friend['image'],
              initialLikes: friend['likes'],
              initialComments: friend['comments'],
              initialShares: friend['shares'],
            );
          },
        ),
      ),
    );
  }
}
