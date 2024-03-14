import 'package:flutter/material.dart';

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

  Widget header()
  {
    return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
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
                        )],
                        image: const DecorationImage(
                          image: AssetImage('assets//images/1.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                        ),
                ),
                const SizedBox(width: 25),
                const Column(
                  children: <Widget>[
                    Text("Barbatos"),
                    Text("16 June",),
                  ],
                ),
                
              ],
            );
  }

  Widget textBox()
  {
    return TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter post text',
              ),
              maxLength: 255,
              maxLines: 4,
            );
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
            header(),
            const SizedBox(height: 5),
            textBox(),
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
