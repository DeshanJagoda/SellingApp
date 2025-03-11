import 'package:facebook_post/Pages/Frindespage.dart';
import 'package:facebook_post/Pages/HomePage.dart';
import 'package:facebook_post/Pages/marketplacePage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SellerBook.com",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
              color: Colors.white,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home, color: Colors.white)),
              Tab(icon: Icon(Icons.videocam, color: Colors.white)),
              Tab(icon: Icon(Icons.people, color: Colors.white)),
              Tab(
                  icon: Icon(Icons.storefront,
                      color: Colors.white)), // Corrected icon
              Tab(icon: Icon(Icons.notifications, color: Colors.white)),
              Tab(icon: Icon(Icons.settings, color: Colors.white)),
            ],
            indicatorColor: Color.fromARGB(255, 219, 219, 219),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5.0,
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: const TabBarView(children: [
          Homepage(),
          Center(
            child: Text("Video"),
          ),
          FriendsPage(),
          MarketplacePage(),
          Center(
            child: Text("Notification"),
          ),
          Center(
            child: Text("Settings"),
          )
        ]),
      ),
    );
  }
}
