import 'package:flutter/material.dart';

enum CardType { red, blue }

class ColorService extends ChangeNotifier {
  int redTapCount = 0;
  int blueTapCount = 0;

  void incrementRed() {
    redTapCount++;
    notifyListeners();
  }

  void incrementBlue() {
    blueTapCount++;
    notifyListeners();
  }
}

final colorService = ColorService();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  // int redTapCount = 0;
  // int blueTapCount = 0;

  // void _incrementRedTapCount() {
  //   setState(() {
  //     redTapCount++;
  //   });
  // }

  // void _incrementBlueTapCount() {
  //   setState(() {
  //     blueTapCount++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? const ColorTapsScreen()
          : const StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  // final int redTapCount;
  // final int blueTapCount;
  // final VoidCallback onRedTap;
  // final VoidCallback onBlueTap;

  // const ColorTapsScreen({
  //   super.key,
  //   required this.redTapCount,
  //   required this.blueTapCount,
  //   required this.onRedTap,
  //   required this.onBlueTap,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          ColorTap(
            type: CardType.blue,
            tapCount: colorService.redTapCount,
            onTap: colorService.incrementRed,
          ),
          ColorTap(
            type: CardType.red,
            tapCount: colorService.blueTapCount,
            onTap: colorService.incrementBlue,
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  // final int redTapCount;
  // final int blueTapCount;

  // const StatisticsScreen({
  //   super.key,
  //   required this.redTapCount,
  //   required this.blueTapCount,
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Red Taps: ${colorService.redTapCount}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Blue Taps: ${colorService.blueTapCount}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
