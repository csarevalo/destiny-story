import 'package:destiny_story/src/models/story.dart';
import 'package:flutter/material.dart';

class StoryBrain extends ChangeNotifier {
  /// Used to keep track progress of the [Story]
  int storyIndex = 0;

  final List<Story> _storyData = [
    Story(
      id: 0,
      title:
          'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
      choice1: 'I\'ll hop in. Thanks for the help!',
      choice2: 'Better ask him if he\'s a murderer first.',
    ),
    Story(
      id: 1,
      title: 'He nods slowly, unphased by the question.',
      choice1: 'At least he\'s honest. I\'ll climb in.',
      choice2: 'Wait, I know how to change a tire.',
    ),
    Story(
      id: 2,
      title:
          'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
      choice1: 'I love Elton John! Hand him the cassette tape.',
      choice2: 'It\'s him or me! You take the knife and stab him.',
    ),
    Story(
      id: 3,
      title:
          'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
      ending: true,
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      id: 4,
      title:
          'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
      ending: true,
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      id: 5,
      title:
          'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
      ending: true,
      choice1: 'Restart',
      choice2: '',
    )
  ];

  /// Proceeds to the next [Story] based on the User's [choice]
  void nextStory(int choice) {
    // Restart the story once it's ending
    if (_storyData[storyIndex].ending) {
      storyIndex = 0;
      restart();
      return;
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
        return;
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


//TODO: Step 23 - Use the storyIndexber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.



//TODO: Step 25 - Change the storyIndexber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyIndexber) and selecting Refactor -> Rename to make the change across all the places where it's used.



//TODO: Step 20 - Download the story plan here: https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3

//TODO: Step 21 - Using the story plan, update nextStory() to change the storyIndexber depending on the choice made by the user. e.g. if choiceNumber was equal to 1 and the storyIndexber is 0, the storyIndexber should become 2.

//TODO: Step 22 - In nextStory() if the storyIndexber is equal to 3 or 4 or 5, that means it's the end of the game and it should call a method called restart() that resets the storyIndexber to 0.

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyIndexber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.