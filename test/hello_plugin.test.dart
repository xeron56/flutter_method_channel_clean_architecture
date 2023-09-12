import 'package:flutter_test/flutter_test.dart';
import 'package:hello_plugin/hello_plugin.dart';

void main() {
  group('HelloPlugin', () {
    test('bubbleSort should sort the list in ascending order', () async {
      final unsortedList = [5, 3, 1, 4, 2];
      final expectedSortedList = [1, 2, 3, 4, 5];

      final sortedList = await HelloPlugin.bubbleSort(unsortedList);

      expect(sortedList, expectedSortedList);
    });
  });
}
