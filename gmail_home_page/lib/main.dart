import 'package:flutter/material.dart';

void main() {
  runApp(const GmailApp());
}

class GmailApp extends StatelessWidget {
  const GmailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GmailHomePage(),
    );
  }
}

class GmailHomePage extends StatefulWidget {
  @override
  State<GmailHomePage> createState() => _GmailHomePageState();
}

class _GmailHomePageState extends State<GmailHomePage> with SingleTickerProviderStateMixin {

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
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Gmail",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("A"),
          ),
          const SizedBox(width: 15),
        ],
      ),

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search in mail",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tabs
          TabBar(
            controller: tabController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(text: "Primary"),
              Tab(text: "Social"),
              Tab(text: "Promotions"),
            ],
          ),

          // Email list
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                buildEmailList(),
                buildEmailList(),
                buildEmailList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable email list widget
  Widget buildEmailList() {
    return ListView.builder(
      itemCount: 10, // 10 fake emails
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade300,
            child: Text(
              "S",
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            "Sender $index",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: const Text("This is a sample email preview line..."),
          trailing: const Icon(Icons.star_border),
        );
      },
    );
  }
}