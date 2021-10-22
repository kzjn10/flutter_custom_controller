import 'package:controller/pick_skill_level/pick_skill_level_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controller Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Controller Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final PickSkillLevelController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PickSkillLevelController(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PickSkillLevelWidget(controller: _controller),
              const SizedBox(height: 20),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Text('Value ${_controller.data?.data.value ?? 'N/a'}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
