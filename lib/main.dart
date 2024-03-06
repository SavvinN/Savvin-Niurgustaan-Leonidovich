import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Messenger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myController = TextEditingController();

  List<Text> posts = [];

  void _addNewPost() {
    setState(() {
      if(myController.text.isNotEmpty)
      {
      posts.add(Text(myController.text));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        )
                      ]),
                  child: const Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                const SizedBox(width: 25),
                const Column(
                  children: <Widget>[
                    Text("Savvin Niurgustaan leonidovich"),
                    Text("12 march 2000",),
                    Text("Just chilling"),
                  ],
                ),
                
              ],
            ),
            const SizedBox(height: 5),
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter post text',
              ),
              maxLength: 255,
              maxLines: 4,
            ),

            FloatingActionButton(
              onPressed: _addNewPost,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),

            for(var item in posts) Container(
              decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        )
                      ]),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.fromLTRB(5,15,5,0),
              alignment: Alignment.centerLeft, 
              child: item,)
          ],
        ),
      ),
    );
  }
}
