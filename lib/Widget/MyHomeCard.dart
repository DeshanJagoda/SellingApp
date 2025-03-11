import 'package:flutter/material.dart';

class MyHomeCard extends StatefulWidget {
  final String name;
  final String postDate;
  final int likesCount;
  final int commentCount;
  final int shareCount;
  final String profileImageUrl;
  final String postImageUrl;

  const MyHomeCard({
    super.key,
    required this.name,
    required this.postDate,
    required this.likesCount,
    required this.commentCount,
    required this.shareCount,
    required this.profileImageUrl,
    required this.postImageUrl,
  });

  @override
  _MyHomeCardState createState() => _MyHomeCardState();
}

class _MyHomeCardState extends State<MyHomeCard> {
  late int likes;
  late int comments;
  late int shares;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.likesCount;
    comments = widget.commentCount;
    shares = widget.shareCount;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  void addComment() {
    setState(() {
      comments++;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Comment'),
        content: TextField(
          decoration:
              const InputDecoration(hintText: 'Write your comment here...'),
          onSubmitted: (value) {
            Navigator.of(context).pop();
            print('Comment added: $value');
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void sharePost() {
    setState(() {
      shares++;
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Post'),
        content: const Text('Do you want to share this post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('Post shared');
            },
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image and Name
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.profileImageUrl),
            ),
            title: Text(widget.name),
            subtitle: Text(widget.postDate),
          ),
          // Post Image
          Image.asset(widget.postImageUrl),

          // Likes, Comments, and Share Actions
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Like Icon and Count
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: Colors.blue,
                  ),
                  onPressed: toggleLike,
                ),
                Text('$likes '),

                // Spacing between icons
                const SizedBox(width: 20),

                // Comment Icon and Count
                IconButton(
                  icon: const Icon(Icons.comment, color: Colors.grey),
                  onPressed: addComment,
                ),
                Text('$comments '),

                // Spacing between icons
                const SizedBox(width: 20),

                // Share Icon and Count
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.grey),
                  onPressed: sharePost,
                ),
                Text('$shares '),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
