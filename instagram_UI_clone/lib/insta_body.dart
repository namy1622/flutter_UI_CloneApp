import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/insta_home.dart';

import 'insta_list.dart';

class InstaBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(child: InsaList())
      ],
    );
  }

}