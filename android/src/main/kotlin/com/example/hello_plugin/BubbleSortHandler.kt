package com.example.hello_plugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class BubbleSortHandler(private val result: MethodChannel.Result) {
    fun handleMethodCall(call: MethodCall) {
        if (call.method == "bubbleSort") {
            val list = call.arguments as List<Int>
            bubbleSort(list)
        }
    }

    private fun bubbleSort(arr: List<Int>) {
        val n = arr.size
        val sortedArr = arr.toMutableList()

        for (i in 0 until n - 1) {
            for (j in 0 until n - i - 1) {
                if (sortedArr[j] > sortedArr[j + 1]) {
                    Collections.swap(sortedArr, j, j + 1)
                }
            }
        }

        result.success(sortedArr)
    }
}
