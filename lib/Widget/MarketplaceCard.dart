import 'package:flutter/material.dart';

class MarketplaceCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String location;
  final String date;
  final String contact;
  final String reviews;
  final String imageUrl;
  final int initialLikeCount;
  final int initialCommentCount;
  final int initialShareCount;

  const MarketplaceCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.date,
    required this.contact,
    required this.reviews,
    required this.imageUrl,
    required this.initialLikeCount,
    required this.initialCommentCount,
    required this.initialShareCount,
  });

  @override
  _MarketplaceCardState createState() => _MarketplaceCardState();
}

class _MarketplaceCardState extends State<MarketplaceCard> {
  late int likeCount;
  late int commentCount;
  late int shareCount;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialLikeCount;
    commentCount = widget.initialCommentCount;
    shareCount = widget.initialShareCount;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
  }

  void addComment() {
    setState(() {
      commentCount++;
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

  void showBuyNowDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buy Now'),
        content: Text(
            'Are you sure you want to buy "${widget.title}" for ${widget.price}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('Buy Now confirmed');
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void showContactSellerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact Seller'),
        content:
            Text('Would you like to contact the seller at ${widget.contact}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('Contacting seller');
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
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            // Image Section
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        widget.reviews,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Location: ${widget.location}',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    'Date: ${widget.date}',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    'Contact: ${widget.contact}',
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: showBuyNowDialog,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 140, 196, 255),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12.0),
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Buy Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      ElevatedButton(
                        onPressed: showContactSellerDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 178, 62),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          textStyle: const TextStyle(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Contact Seller',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Icons Row with Counts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: toggleLike,
                          ),
                          Text('$likeCount'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: addComment,
                            color: Colors.grey,
                          ),
                          Text('$commentCount'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => ShareDialog(
                                  imageUrl: widget.imageUrl,
                                  onShare: () {
                                    setState(() {
                                      shareCount++;
                                    });
                                  },
                                ),
                              );
                            },
                            color: Colors.blue,
                          ),
                          Text('$shareCount'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ShareDialog Widget for sharing functionality
class ShareDialog extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onShare;

  const ShareDialog({
    super.key,
    required this.imageUrl,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Share this item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imageUrl,
              height: 100, fit: BoxFit.cover), // Display image
          const SizedBox(height: 10),
          const Text('Do you want to share this item?'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            onShare(); // Update share count
            Navigator.of(context).pop();
            print('Item shared');
          },
          child: const Text('Share'),
        ),
      ],
    );
  }
}
