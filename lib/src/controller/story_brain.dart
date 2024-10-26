import 'package:destiny_story/src/constants/main_story.dart';
import 'package:destiny_story/src/models/story.dart';
import 'package:flutter/material.dart';

class StoryBrain extends ChangeNotifier {
  /// Used to keep track progress of the [Story]
  int storyIndex = 0;

  /// Private [_storyData] acquired from [MainStory]
  final List<Story> _storyData = mainStory;

  /// Proceeds to the next [Story] based on the User's [choice]
  void nextStory(int choice) {
    // Restart the story once it's ending
    if (_storyData[storyIndex].ending) {
      storyIndex = 0;
      restart();
      return; //keep
    }
    // Transform input choice (1 or 2) to index (0 or 1)
    choice--;
    // Set next story [id] base on the input [choice]
    switch (storyIndex) {
      case 0:
        storyIndex = [2, 1][choice];
      case 1:
        storyIndex = [2, 3][choice];
      case 2:
        storyIndex = [5, 4][choice];
      default:
        storyIndex = 0;
        restart();
        return; //keep
    }
    // Verify element exists in debugMode
    assert(_storyData.elementAtOrNull(storyIndex) != null, 'Invalid Story Id');
    notifyListeners();
  }

  /// Get current [Story]
  Story getStory() {
    return _storyData[storyIndex];
  }

  /// Get the current [Story]'s first choice outcome
  String getChoice1() {
    return _storyData[storyIndex].choice1;
  }

  /// Get the current [Story]'s second choice outcome
  String getChoice2() {
    return _storyData[storyIndex].choice2;
  }

  /// Restart the overall story progress [storyIndex]
  void restart() {
    storyIndex = 0;
    notifyListeners();
  }
}
