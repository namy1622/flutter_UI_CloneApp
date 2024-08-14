import 'package:flutter/material.dart';

import 'insta_body.dart';

class InstaHome extends StatelessWidget{

  
  final topBar = AppBar(
    backgroundColor: const Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: const Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35, child: Image.asset("assets/insta_logo.png"),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: InstaBody(),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.home, size: 30,)
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search,  size: 30)
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.favorite,  size: 30)
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.account_box,  size: 30)
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  
}