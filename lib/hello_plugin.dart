import 'dart:async';
import 'package:flutter/services.dart';

class HelloPlugin {
  static const MethodChannel _channel = const MethodChannel('hello_plugin');
  static const EventChannel _eventChannel = EventChannel('hello_plugin_events');

  static Future<List<int>> bubbleSort(List<int> inputList) async {
    final List<dynamic> sortedList =
        await _channel.invokeMethod('bubbleSort', inputList);
    return sortedList.cast<int>();
  }

  static Future<List<int>> selectionSort(List<int> inputList) async {
    final List<dynamic> sortedList =
        await _channel.invokeMethod('selectionSort', inputList);
    return sortedList.cast<int>();
  }

  static Future<List<int>> insertionSort(List<int> inputList) async {
    final List<dynamic> sortedList =
        await _channel.invokeMethod('insertionSort', inputList);
    return sortedList.cast<int>();
  }
}
