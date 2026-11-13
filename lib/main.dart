import 'package:flutter/material.dart';

void main() {
  runApp(const StepCounterApp());
}

class StepCounterApp extends StatelessWidget {
  const StepCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '步數集點大作戰',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const GameHomePage(),
    );
  }
}

class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key});

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  int _steps = 0;
  int _points = 0;

  // 模擬走路增加步數與點數
  void _simulateStep() {
    setState(() {
      _steps += 100; // 每次點擊增加 100 步
      _points += 10; // 每累積步數獲得 10 點
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('步數集點手遊'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_walk, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            Text(
              '今日步數: $_steps',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '獲得點數: $_points 點',
              style: const TextStyle(fontSize: 22, color: Colors.orange),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _simulateStep,
              icon: const Icon(Icons.add),
              label: const Text('模擬走路 (+100步)', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}