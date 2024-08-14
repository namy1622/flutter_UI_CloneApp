import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPageView extends StatelessWidget{
  final _storyController = StoryController();


  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text(title: '''If you do not make time for your wellness,
you will be forced to make time for your illness.
#ReadThatAgain''', backgroundColor: Colors.red, ),
      StoryItem.pageImage(
        duration: Duration(seconds: 20),
          url:
          "https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
          controller: _storyController),
      StoryItem.pageImage(
          url:
          "https://techcrunch.com/wp-content/uploads/2015/08/safe_image.gif",
          controller: _storyController,
          imageFit: BoxFit.contain),
    ];
      return  Material(
        child:  StoryView(
          storyItems: storyItems,
          controller: controller,
          inline: false,
          repeat: true
        )
      );
  }

}