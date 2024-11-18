import 'package:flutter/material.dart';
import 'package:twitter_demo_in_flutter/image_constant.dart';
import 'package:twitter_demo_in_flutter/tweets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.grey.shade100,
            leading: Container(
              margin: const EdgeInsets.all(10.0),
              child: const CircleAvatar(
                backgroundImage: AssetImage(ImageConstant.logo),
              ),
            ),
            title: const Text(
              'X',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'For You'),
                Tab(text: 'Following'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              listOfTweets(),
              const Center(
                child: Text('Following view'),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.draw),
            onPressed: () {},
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildBottomIconButton(Icons.home, Colors.blue),
                buildBottomIconButton(Icons.search, Colors.blue),
                buildBottomIconButton(Icons.note_alt, Colors.blue),
                buildBottomIconButton(Icons.people, Colors.blue),
                buildBottomIconButton(Icons.notifications, Colors.blue),
                buildBottomIconButton(Icons.mail, Colors.blue),
              ],
            ),
          ),
        ));
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      icon: Icon(icon, color: color),
      iconSize: 25.0,
      onPressed: () {},
    );
  }

  Widget listOfTweets() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return tweets[index];
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 0,
        ),
        itemCount: tweets.length,
      ),
    );
  }

  Widget twitHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 0.5),
          child: const Text(
            'Shantheking',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          '  @sparkout . 5m',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 18.0,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
