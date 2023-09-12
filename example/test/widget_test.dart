import 'package:flutter_test/flutter_test.dart';
import 'package:hello_plugin/hello_plugin.dart';

void main() {
  group('Sorting Plugin Tests', () {
    test('Bubble Sort Test', () async {
      List<int> unsortedList = [64, 25, 12, 22, 11];
      List<int> expectedList = [11, 12, 22, 25, 64];
      List<int> sortedList = await HelloPlugin.bubbleSort(unsortedList);
      expect(sortedList, expectedList);
    });

    test('Selection Sort Test', () async {
      List<int> unsortedList = [64, 25, 12, 22, 11];
      List<int> expectedList = [11, 12, 22, 25, 64];
      List<int> sortedList = await HelloPlugin.selectionSort(unsortedList);
      expect(sortedList, expectedList);
    });

    test('Insertion Sort Test', () async {
      List<int> unsortedList = [64, 25, 12, 22, 11];
      List<int> expectedList = [11, 12, 22, 25, 64];
      List<int> sortedList = await HelloPlugin.insertionSort(unsortedList);
      expect(sortedList, expectedList);
    });
  });
}
