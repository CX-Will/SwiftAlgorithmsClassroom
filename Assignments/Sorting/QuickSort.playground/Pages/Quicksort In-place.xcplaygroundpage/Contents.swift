/*:
## 1. Quicksort In-place

### 1.1. Lomuto's partition

Implement [Lomuto's partition algorithm]( https://en.wikipedia.org/wiki/Quicksort#Lomuto_partition_scheme ).
    Remember that you need to guard `swap` from swapping a location with itself.

*/

func lomutoPartition<T>(inout array: [T], low: Int, high: Int, @noescape _ isOrderedBefore: (T, T) -> Bool) -> Int {
    let pivot = array[high]
    
    // ...

    return 0
}

//var lomutoArray1 = [2, 1, 4]
//assert(lomutoPartition(&lomutoArray1, low: 0, high: lomutoArray1.count-1, <) == 2)
//assert(lomutoArray1 == [2, 1, 4])
//
//var lomutoArray2 = [2, 1, 0]
//assert(lomutoPartition(&lomutoArray2, low: 0, high: lomutoArray2.count-1, <) == 0)
//assert(lomutoArray2 == [0, 1, 2])
//
//var lomutoArray3 = [5, 6, 0, 2, 1, 7, 3]
//assert(lomutoPartition(&lomutoArray3, low: 0, high: lomutoArray3.count-1, <) == 3)
//assert(lomutoArray3 == [0, 2, 1, 3, 5, 7, 6])
//
//var lomutoArray4 = [1, 1, 1, 0]
//assert(lomutoPartition(&lomutoArray4, low: 0, high: lomutoArray4.count-1, <) == 0)
//assert(lomutoArray4 == [0, 1, 1, 1])



/*:
### 1.2. Hoare's partition

Implement [Hoare's partition algorithm]( https://en.wikipedia.org/wiki/Quicksort#Hoare_partition_scheme ). Note that if you follow the pseudo code given in Wikipedia, the pivot's final location might not be at the returned index. You can check Sedgewick's Algorithms book for another version. Add more tests when you are done with your implementation.

*/

func hoarePartition<T>(inout array: [T], low: Int, high: Int, @noescape _ isOrderedBefore: (T, T) -> Bool) -> Int {
    let pivot = array[low]
   
    // ...

    return 0
}

//var hoareArray1 = [2, 5, 4]
//assert(hoarePartition(&hoareArray1, low: 0, high: hoareArray1.count-1, <) == 0)
//assert(hoareArray1 == [2, 5, 4])
//
//var hoareArray2 = [5, 6, 0, 2, 1, 7, 3]
//assert(hoarePartition(&hoareArray2, low: 0, high: hoareArray2.count-1, <) == 4)
//assert(hoareArray2 == [1, 3, 0, 2, 5, 7, 6])
//
//var hoareArray3 = [1, 1, 1, 0]
//assert(hoarePartition(&hoareArray3, low: 0, high: hoareArray3.count-1, <) == 1)
//assert(hoareArray3 == [0, 1, 1, 1])


/*:
### 1.3. Sort

By using your `hoarePartition`, implement an in-place quicksort.
*/

func quickSort<T>(inout array: [T], low: Int, high: Int, @noescape _ isOrderedBefore: (T, T) -> Bool) {
    
    // ...
}

//var array1 = [1]
//quickSort(&array1, low: 0, high: array1.count - 1, <)
//assert(array1 == [1])
//
//var array2 = [Int]()
//quickSort(&array2, low: 0, high: array2.count - 1, <)
//assert(array2 == [])
//
//var array3 = [1, 2, 3]
//quickSort(&array3, low: 0, high: array3.count - 1, <)
//assert(array3 == [1, 2, 3])
//
//var array4 = [3, 0, 2, 1, 2, -1]
//quickSort(&array4, low: 0, high: array4.count - 1, <)
//assert(array4 == [-1, 0, 1, 2, 2, 3])
//
//var array5 = [1, 2, 3]
//quickSort(&array5, low: 0, high: array5.count - 1, >)
//assert(array5 == [3, 2, 1])
//
//var array6 = [5, 1, 2]
//quickSort(&array6, low: 0, high: array6.count - 1, <)
//assert(array6 == [1, 2, 5])


/*:
### 1.4. 🇳🇱 problem

Read about [the Dutch National Flag problem]( https://en.wikipedia.org/wiki/Quicksort#Repeated_elements ). Your function takes a pivot's index. It should rearrange the elements such that all elements less than pivot come first, followed by elements equal to pivot, followed by elements greater than pivot. It should return a tuple of `smaller` and `larger`.

When the algorithm is running, there are 4 groups of elements. We need 3 indices, here named `smaller`, `equal`, and `larger`.

    Bottom group:   low ..< smaller
    Middle group:   smaller ..< equal
    Unknown group:  equal ..< larger+1
    Top group:      larger+1 ..< high + 1

*/

func dutchFlagPartition<T: Comparable>(inout array: [T], pivotIndex: Int, low: Int, high: Int) -> (Int, Int) {
    let pivot = array[pivotIndex]
    
    var smaller = 0
    var equal = 0
    var larger = high
    
    // ...
    
    return (smaller, larger)
}

//var dutcharray = [5, 1, 2, 2, 4, 5]
//let lowAndHigh = dutchFlagPartition(&dutcharray, pivotIndex: 2, low: 0, high: dutcharray.count - 1)
//assert(lowAndHigh.0 == 1)
//assert(lowAndHigh.1 == 2)
//assert(dutcharray == [1 ,2 ,2, 4, 5, 5])
//
//
//var dutcharray2 = [5, 10, 5, 5, 2, 5]
//let lowAndHigh2 = dutchFlagPartition(&dutcharray2, pivotIndex: 0, low: 0, high: dutcharray2.count - 1)
//assert(lowAndHigh2.0 == 1)
//assert(lowAndHigh2.1 == 4)
//assert(dutcharray2 == [2, 5, 5, 5, 5, 10])
//

/*:
### 1.5. Reading Swift Source Code

You can check out [how Swift implements `sort`]( https://github.com/apple/swift/blob/99fcb2dfe1d0836f5a00fc3b9ebde19da313d167/stdlib/public/core/Sort.swift.gyb#L163 ). The file is a GYB template which stands for Generate Your Boilerplate. You need to clone the Swift repo, and run `./utils/gyb` on the `Sort.swift.gyb` to convert it to actual Swift source code.

As you can see, the function is called [`introSort`](https://en.wikipedia.org/wiki/Introsort ), a hybrid sorting algorithm where quicksort falls back to insertion sort and heap sort.

*/


/*:
[Table of Contents](Table%20of%20Contents) | [Previous](@previous) | [Next](@next)
*/

