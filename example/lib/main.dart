import 'package:flutter/material.dart';
import 'package:hello_plugin/hello_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<int> unsortedList = [64, 25, 12, 22, 11];
  List<int> sortedList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> _sortList(String algorithm) async {
    switch (algorithm) {
      case 'bubble':
        sortedList = await HelloPlugin.bubbleSort(unsortedList);
        break;
      case 'selection':
        sortedList = await HelloPlugin.selectionSort(unsortedList);
        break;
      case 'insertion':
        sortedList = await HelloPlugin.insertionSort(unsortedList);
        break;
      default:
        sortedList = [];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sorting Plugin Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _sortList('bubble'),
                child: Text('Bubble Sort'),
              ),
              ElevatedButton(
                onPressed: () => _sortList('selection'),
                child: Text('Selection Sort'),
              ),
              ElevatedButton(
                onPressed: () => _sortList('insertion'),
                child: Text('Insertion Sort'),
              ),
              SizedBox(height: 20),
              Text('Sorted List:'),
              SizedBox(height: 10),
              Text(sortedList.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
