package com.example.hello_plugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class InsertionSortHandler(private val result: MethodChannel.Result) {
    fun handleMethodCall(call: MethodCall) {
        if (call.method == "insertionSort") {
            val list = call.arguments as List<Int>
            insertionSort(list)
        }
    }

    private fun insertionSort(arr: List<Int>) {
        val n = arr.size
        val sortedArr = arr.toMutableList()

        for (i in 1 until n) {
            val key = sortedArr[i]
            var j = i - 1

            while (j >= 0 && sortedArr[j] > key) {
                sortedArr[j + 1] = sortedArr[j]
                j--
            }
            sortedArr[j + 1] = key
        }

        result.success(sortedArr)
    }
}
