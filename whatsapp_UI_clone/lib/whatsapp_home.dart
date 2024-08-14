import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/pages/camera_screen.dart';
import 'package:whatsappclone/pages/chat_screen.dart';
import 'package:whatsappclone/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;

  const WhatsAppHome({super.key, required this.cameras});

  @override
  State<StatefulWidget> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showTab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showTab = true;
      } else {
        showTab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            )
          ],
        ),
        actions: const [
          Icon(Icons.search),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0)
          ),
          Icon(Icons.more_horiz)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraScreen(widget.cameras),
           const ChatScreen(),
           const StatusScreen(),
          // CallsScreen(),
        ],
      ),
    );
  }
}
