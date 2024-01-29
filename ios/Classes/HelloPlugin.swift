import Flutter
import UIKit

public class HelloPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "hello_plugin", binaryMessenger: registrar.messenger())
        let instance = HelloPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "insertionSort":
            if let args = call.arguments as? [Int] {
                result(insertionSort(arr: args))
            } else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for insertionSort", details: nil))
            }
      
        case "bubbleSort":
            if let args = call.arguments as? [Int] {
                result(bubbleSort(arr: args))
            } else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for bubbleSort", details: nil))
            }
 
        case "selectionSort":
            if let args = call.arguments as? [Int] {
                result(selectionSort(arr: args))
            } else {
                result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for selectionSort", details: nil))
            }     
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func insertionSort(arr: [Int]) -> [Int] {
        var sortedArr = arr
        let n = sortedArr.count

        for i in 1..<n {
            let key = sortedArr[i]
            var j = i - 1

            while j >= 0 && sortedArr[j] > key {
                sortedArr[j + 1] = sortedArr[j]
                j -= 1
            }
            sortedArr[j + 1] = key
        }
        return sortedArr
    }

   private func bubbleSort(arr: [Int]) -> [Int] {
        var sortedArr = arr
        let n = sortedArr.count

        for i in 0..<n {
            for j in 0..<n - i - 1 {
                if sortedArr[j] > sortedArr[j + 1] {
                    let temp = sortedArr[j]
                    sortedArr[j] = sortedArr[j + 1]
                    sortedArr[j + 1] = temp
                }
            }
        }
        return sortedArr
    }

    private func selectionSort(arr: [Int]) -> [Int] {
        var sortedArr = arr
        let n = sortedArr.count

        for i in 0..<n {
            var minIndex = i
            for j in i + 1..<n {
                if sortedArr[j] < sortedArr[minIndex] {
                    minIndex = j
                }
            }
            let temp = sortedArr[minIndex]
            sortedArr[minIndex] = sortedArr[i]
            sortedArr[i] = temp
        }
        return sortedArr
    } 
}
