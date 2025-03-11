import 'package:flutter/material.dart';
import 'package:facebook_post/Widget/MyHomeCard.dart';

// Define a model class for the post data
class Post {
  final String name;
  final String postDate;
  final int likesCount;
  final int commentCount;
  final int shareCount;
  final String profileImageUrl; // URL for the profile image
  final String postImageUrl; // URL for the post image

  Post({
    required this.name,
    required this.postDate,
    required this.likesCount,
    required this.commentCount,
    required this.shareCount,
    required this.profileImageUrl,
    required this.postImageUrl,
  });
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of Post objects with realistic data
    final List<Post> posts = [
      Post(
        name: "John Doe",
        postDate: "2024-11-07 12:30 PM",
        likesCount: 120,
        commentCount: 45,
        shareCount: 10,
        profileImageUrl: "Assets/post/User.jpg", // Asset path
        postImageUrl: "Assets/post/post.jpg", // Asset path
      ),
      Post(
        name: "Jane Smith",
        postDate: "2024-11-06 9:00 AM",
        likesCount: 250,
        commentCount: 78,
        shareCount: 22,
        profileImageUrl: "Assets/post/User1.jpg", // Asset path
        postImageUrl: "Assets/post/post2.jpg",
      ),
      Post(
        name: "Michael Jordan",
        postDate: "2024-11-05 3:45 PM",
        likesCount: 550,
        commentCount: 95,
        shareCount: 35,
        profileImageUrl: "Assets/post/User2.jpg",
        postImageUrl: "Assets/post/post1.png",
      ),
      Post(
        name: "Cristiano Ronaldo",
        postDate: "2024-11-04 11:30 AM",
        likesCount: 1000,
        commentCount: 320,
        shareCount: 100,
        profileImageUrl: "Assets/post/User3.png",
        postImageUrl: "Assets/post/post3.png",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Posts'),
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        color: const Color.fromARGB(255, 228, 222, 222),
        child: ListView(
          padding: const EdgeInsets.only(top: 10.0),
          scrollDirection: Axis.vertical,
          children: posts.map((post) {
            return MyHomeCard(
              name: post.name,
              postDate: post.postDate,
              likesCount: post.likesCount,
              commentCount: post.commentCount,
              shareCount: post.shareCount,
              profileImageUrl: post.profileImageUrl,
              postImageUrl: post.postImageUrl,
            );
          }).toList(),
        ),
      ),
    );
  }
}
