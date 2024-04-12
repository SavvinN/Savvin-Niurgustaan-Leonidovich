import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/generated/locale_keys.g.dart';

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

  void _changeLanguage() {
    setState(() {
      if(context.locale == const Locale('ru'))
      {
        context.setLocale(const Locale('en'));
      }
      else if (context.locale == const Locale('en'))
      {
        context.setLocale(const Locale('ru'));
      }
    });
  }

  Widget header()
  {
    return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 0),
                        )],
                        image: const DecorationImage(
                          image: AssetImage('assets//images/1.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.rectangle,
                        ),
                ),
                    const SizedBox(height: 10),

                    const Text("#NAME"),   

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(LocaleKeys.PostCountText).tr(), 
                        const Text('#POSTCOUNT'), 
              ]     ),
                    
              ],
            );
  }

  Widget textBox()
  {
    return TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: LocaleKeys.TextField.tr(),
                border: const OutlineInputBorder(),
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
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>
              [
              const SizedBox(width: 15),

              FloatingActionButton(
              onPressed: _changeLanguage,
              tooltip: 'Change Language',
              mini: true,
              child: const Icon(Icons.language),
              ),
        
              ],
            ),
            header(),
            
            const SizedBox(height: 15),
            textBox(),
            FloatingActionButton(
              onPressed: _addNewPost,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 5),
            for(var item in posts) Container(
              decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      ),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.fromLTRB(2,10,2,0),
              alignment: Alignment.centerLeft, 
              child: item,)
          ],
        ),
      ),
    );
  }
}
