package com.example.hello_plugin

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.*

class SelectionSortHandler(private val result: MethodChannel.Result) {
    fun handleMethodCall(call: MethodCall) {
        if (call.method == "selectionSort") {
            val list = call.arguments as List<Int>
            selectionSort(list)
        }
    }

    private fun selectionSort(arr: List<Int>) {
        val n = arr.size
        val sortedArr = arr.toMutableList()

        for (i in 0 until n - 1) {
            var minIndex = i
            for (j in i + 1 until n) {
                if (sortedArr[j] < sortedArr[minIndex]) {
                    minIndex = j
                }
            }
            Collections.swap(sortedArr, i, minIndex)
        }

        result.success(sortedArr)
    }
}
