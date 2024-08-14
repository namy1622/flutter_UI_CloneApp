import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'insta_sotries.dart';

class InsaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InstaListState();
  }
}

class _InstaListState extends State<InsaList> {
  bool isPressed = false;
  final snackBar = const SnackBar(
    content: Text('Đây là một thông báo ngắn.'),
    duration: Duration(seconds: 3),
  );

  final void Function() toast = () {Fluttertoast.showToast(
    msg: "Đây là một thông báo toast",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );};
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0
          ? new SizedBox(
              child: InstaStories(),
              height: deviceSize.height * 0.15,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://cf.shopee.vn/file/sg-11134258-7rdvs-lydo0tgnzsfr45"),
                                  )),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              'imthpk',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert))
                      ],
                    ),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: Image.network(
                        "https://images.pexels.com/photos/672657/pexels-photo-672657.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                          icon: Icon(
                              isPressed ? Icons.favorite : Icons.heart_broken),
                          color: isPressed ? Colors.red : Colors.black,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        IconButton(onPressed: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: const SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Text('Đây là Dialog tùy chỉnh'),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                            icon:  Icon(FontAwesomeIcons.comment),
                        ),

                        const SizedBox(
                          width: 16.0,
                        ),
                        const Icon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                    //   Icon(FontAwesomeIcons.bookmark);
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Liked by namsp, myna and 423,3 others'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image:  NetworkImage(
                                    "https://cf.shopee.vn/file/sg-11134258-7rdvs-lydo0tgnzsfr45")),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add a comment...",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                        Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
                  )
                ]),
    );
  }
}
