import UIKit

var greeting = "Hello, playground"


/*let s = "Indiana"
var resMap = [Character: Int]()
for item in s {
    let v = resMap[item]
    if v != nil {
        resMap[item]! = resMap[item]! + 1
        
    } else {
        resMap[item] = 1
    }
}
print(resMap)*/
 
let myArray = ["bob", "joe", "four"]
var myRArray: Array<Any> = []
var length = myArray.count-1
for _ in myArray {
    myRArray.append(myArray[length])
    length = length-1
}
print(myRArray)

let myArray1 = [1,2,3,4,5,6,7,8,9,10]
var myPrimeArray: Array<Int> = []
for item in myArray1 {
    if item == 1||item == 2 {
        myPrimeArray.append(item)
    } else {
        for i in 2..<item {
            if item%i ==  0 {
                break;
            }
            if item%i != 0 && i == item-1 {
                myPrimeArray.append(item)
            }
        }
    }
}
print(myPrimeArray)

var myOddArray: Array<Int> = []
var myEvenArray: Array<Int> = []
for item in myArray1 {
    if item%2 == 0 {
        myEvenArray.append(item)
    }
    if item%2 != 0 {
        myOddArray.append(item)
    }
}
print(myOddArray)
print(myEvenArray)

let aNumber = 20
var factorial = 1
for n in 1...aNumber {
    factorial = factorial*n
}
print(factorial)

let array2 = [1,2,3,4,5,6,7]
let groupSize = 2
var array3: Array<Int> = []
var finalArray: Array<Array<Int>> = []
for item in array2 {
    array3.append(item)
    if array2.index(before: item) > 0 {
        if (array2.index(before: item)+1)%groupSize == 0 {
            finalArray.append(array3)
            array3.removeAll()
        }
    }
}
print(finalArray)

