import 'package:destiny_story/src/controller/story_brain.dart';
import 'package:destiny_story/src/widgets/select_path_button.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/imgs/background.png',
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        storyBrain.getStory().title,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.blueGrey[50],
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SelectPathButton(
                    onPressed: () => storyBrain.nextStory(1),
                    text: storyBrain.getChoice1(),
                    backgroundColor: Colors.greenAccent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SelectPathButton(
                    onPressed: () => storyBrain.nextStory(2),
                    text: storyBrain.getChoice2(),
                    backgroundColor: Colors.pink[200],
                  ),
                ),
                const SizedBox(height: 18.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
