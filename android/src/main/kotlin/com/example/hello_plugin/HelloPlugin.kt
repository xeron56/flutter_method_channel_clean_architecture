package com.example.hello_plugin

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Handler
import io.flutter.plugin.common.EventChannel


class HelloPlugin : FlutterPlugin {
    private lateinit var channel: MethodChannel
    private lateinit var eventSink: EventChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "hello_plugin")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
               "bubbleSort" -> {
                BubbleSortHandler(result).handleMethodCall(call)
            }
            "selectionSort" -> {
                SelectionSortHandler(result).handleMethodCall(call)
            }
            "insertionSort" -> {
                InsertionSortHandler(result).handleMethodCall(call)
            }
            else -> {
                result.notImplemented()
            }
            }
        }

        eventSink = EventChannel(binding.binaryMessenger, "hello_plugin_events")
        eventSink.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                // Here you can add event sources, if needed.
            }

            override fun onCancel(arguments: Any?) {
                // Here you can remove event sources, if needed.
            }
        })
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}


