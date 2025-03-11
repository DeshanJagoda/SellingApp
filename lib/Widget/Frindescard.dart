import 'package:flutter/material.dart';

class FriendCard extends StatefulWidget {
  final String name;
  final String date;
  final String friendsCount;
  final String image;
  final int initialLikes;
  final int initialComments;
  final int initialShares;

  const FriendCard({
    super.key,
    required this.name,
    required this.date,
    required this.friendsCount,
    required this.image,
    required this.initialLikes,
    required this.initialComments,
    required this.initialShares,
  });

  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  late int likes;
  late int comments;
  late int shares;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.initialLikes;
    comments = widget.initialComments;
    shares = widget.initialShares;
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

  void viewProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('View Profile'),
        content: Text('You are viewing the profile of ${widget.name}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void contactUser() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Contact ${widget.name}'),
        content: const Text('Do you want to contact this person?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('Contact initiated with ${widget.name}');
            },
            child: const Text('Contact'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.asset(
                  widget.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.date,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.people, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            widget.friendsCount,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          IconButton(
                            icon: Icon(
                              isLiked
                                  ? Icons.thumb_up
                                  : Icons.thumb_up_alt_outlined,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: toggleLike,
                          ),
                          Text('$likes', style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 15),
                          IconButton(
                            icon: const Icon(Icons.comment,
                                color: Colors.grey, size: 20),
                            onPressed: addComment,
                          ),
                          Text('$comments',
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 15),
                          IconButton(
                            icon: const Icon(Icons.share,
                                color: Colors.green, size: 20),
                            onPressed: sharePost,
                          ),
                          Text('$shares', style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: viewProfile,
                  child: const Text('View'),
                ),
                ElevatedButton(
                  onPressed: contactUser,
                  child: const Text('Contact'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
