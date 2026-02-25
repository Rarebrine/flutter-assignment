import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppBasic());
}

class WhatsAppBasic extends StatelessWidget {
  const WhatsAppBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatefulWidget {
  @override
  State<WhatsAppHomePage> createState() => _WhatsAppHomePageState();
}

class _WhatsAppHomePageState extends State<WhatsAppHomePage>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff075E54),

        // Title color fixed
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,     // ← FIXED
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: const [
          Icon(Icons.camera_alt_outlined, color: Colors.white), // ← FIXED
          SizedBox(width: 20),
          Icon(Icons.search, color: Colors.white),              // ← FIXED
          SizedBox(width: 10),
          Icon(Icons.more_vert, color: Colors.white),           // ← FIXED
          SizedBox(width: 10),
        ],

        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,

          labelColor: Colors.white,       // ← SELECTED TAB TEXT COLOR FIXED
          unselectedLabelColor: Colors.white70, // ← UNSELECTED TABS VISIBLE

          tabs: const [
            Tab(text: "CHATS"),
            Tab(text: "STATUS"),
            Tab(text: "CALLS"),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff25D366),
        child: const Icon(Icons.message),
      ),

      body: TabBarView(
        controller: tabController,
        children: [
          buildChatList(),
          buildStatusTab(),
          buildCallsTab(),
        ],
      ),
    );
  }

  // -------------------------
  // CHATS TAB
  // -------------------------
  Widget buildChatList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade400,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          title: Text("Contact $index",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text("Hey! This is a sample message."),
          trailing: const Text("12:30 PM",
              style: TextStyle(color: Colors.grey)),
        );
      },
    );
  }

  // -------------------------
  // STATUS TAB
  // -------------------------
  Widget buildStatusTab() {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add, size: 16, color: Colors.white),
                ),
              )
            ],
          ),
          title: const Text("My Status",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text("Tap to add status update"),
        ),

        const Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            "Recent updates",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),

        ...List.generate(
          5,
          (i) => ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text("Contact $i"),
            subtitle: const Text("Today, 10:00 AM"),
          ),
        ),
      ],
    );
  }

  // -------------------------
  // CALLS TAB
  // -------------------------
  Widget buildCallsTab() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text("Caller $index",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: const [
              Icon(Icons.call_received, color: Colors.red, size: 18),
              SizedBox(width: 5),
              Text("Yesterday, 8:45 PM"),
            ],
          ),
          trailing: const Icon(Icons.phone, color: Colors.green),
        );
      },
    );
  }
}