import 'package:flutter/material.dart';
// import 'package:storiestutorial/util/story_circles.dart';
import 'package:thirumanam/stories/util/story_circles.dart';
import 'storypage.dart';

class StoryHomePage extends StatefulWidget {
  const StoryHomePage({Key? key}) : super(key: key);

  @override
  _StoryHomePageState createState() => _StoryHomePageState();
}

class _StoryHomePageState extends State<StoryHomePage> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('S T O R I E S'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryCircle(
                  function: _openStory,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}