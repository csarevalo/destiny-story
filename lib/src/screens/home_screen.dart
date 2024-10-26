import 'package:destiny_story/src/controller/story_brain.dart';
import 'package:destiny_story/src/widgets/select_path_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          child: ChangeNotifierProvider(
            create: (context) => StoryBrain(),
            child: const StoryContent(),
          ),
        ),
      ),
    );
  }
}

class StoryContent extends StatelessWidget {
  const StoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final storyBrain = Provider.of<StoryBrain>(context, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Selector<StoryBrain, String>(
                  selector: (ctx, p) => p.getStory().title,
                  builder: (_, storyTitle, ___) => Text(
                    storyTitle,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.blueGrey[50],
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Selector<StoryBrain, String>(
              selector: (ctx, p) => p.getChoice1(),
              builder: (_, choice1, ___) => SelectPathButton(
                onPressed: () => storyBrain.nextStory(1),
                text: choice1,
                backgroundColor: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Selector<StoryBrain, String>(
              selector: (ctx, p) => p.getChoice2(),
              builder: (_, choice2, ___) => choice2.isEmpty
                  ? const SizedBox.shrink()
                  : SelectPathButton(
                      onPressed: () => storyBrain.nextStory(2),
                      text: choice2,
                      backgroundColor: Colors.pink[200],
                    ),
            ),
          ),
          const SizedBox(height: 18.0)
        ],
      ),
    );
  }
}
