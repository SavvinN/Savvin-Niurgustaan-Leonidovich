import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/routes/app_router.dart';

@RoutePage()
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите имя',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Введите статус',
                ),
              ),
              
             FloatingActionButton(
              onPressed: () {
                context.router.maybePop();
              },
              tooltip: 'Подтвердить',
              mini: true,
              child: const Icon(Icons.approval),
              ),

            ])));
  }
}
