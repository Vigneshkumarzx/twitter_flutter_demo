import 'package:flutter/material.dart';

class Tweet extends StatelessWidget {
  final String avatar;
  final String username;
  final String name;
  final String timeAgo;
  final String text;
  final String comments;
  final String retweets;
  final String favorites;

  const Tweet({
    super.key,
    required this.avatar,
    required this.username,
    required this.name,
    required this.timeAgo,
    required this.text,
    required this.comments,
    required this.retweets,
    required this.favorites,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tweetAvatar(),
          Expanded(child: twitterBody()), // Wrap tweetBody with Expanded
        ],
      ),
    );
  }

  Widget tweetAvatar() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatar),
      ),
    );
  }

  Widget tweetText() {
    return Text(
      text,
      overflow: TextOverflow.clip,
    );
  }

  Widget twitterBody() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        twitHeader(),
        twitterText(),
        tweetButton(),
      ],
    ));
  }

  Widget twitHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          child: Text(
            username,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '@$name · $timeAgo',
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 14.0,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget twitterText() {
    return Text(
      text,
      overflow: TextOverflow.clip,
    );
  }

  Widget twitIconButton(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.0,
          color: Colors.black45,
        ),
        Container(
          margin: const EdgeInsets.all(6.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget tweetButton() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          twitIconButton(Icons.comment, comments),
          twitIconButton(Icons.reviews_outlined, retweets),
          twitIconButton(Icons.favorite, favorites),
          twitIconButton(Icons.analytics, ''),
        ],
      ),
    );
  }
}
