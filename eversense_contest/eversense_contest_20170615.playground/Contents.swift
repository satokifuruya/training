//: Playground - noun: a place where people can play

import UIKit
import Foundation




// 累乗を計算する演算子を定義
infix operator ** { associativity left precedence 161 }
func ** (left: Int, right: UInt) -> Int {
    var powered = 1
    for _ in 0..<right {
        powered *= left
    }
    
    return powered
}

// n桁の最大の回文数を返す
func getMaxReversibleNumber(n :Int) -> Int {

    guard n >= 1 else {
        return 0
    }
    
    var maxReversibleNumber = 0
    var checkingNumber :Int
    
    let min = 10 ** UInt(n-1)
    let max = (10 ** UInt(n) ) - 1
    
    print("min:\(min)")
    print("max:\(max)")
    
    for i in (min ..< max) {
        for j in (i ..< max) {
            
            checkingNumber = i * j
            
            if (maxReversibleNumber < checkingNumber ) {
                if checkReversibleNumberWithString(checkingNumber) {
                    print("i:\(i)")
                    print("j:\(j)")
                    maxReversibleNumber = checkingNumber
                }
            }

            // これだと遅い
//            if checkReversibleNumberWithString(checkingNumber) {
//                if (maxReversibleNumber < checkingNumber ) {
//                    maxReversibleNumber = checkingNumber
//                }
//            }
        }
    }
    return maxReversibleNumber
}


// n*2桁の回文数を大きい順に取り出して、n桁同士の割り算で成り立つか判定する
func getMaxReversibleNumber_2(n :Int) -> Int {
    
    guard n >= 1 else {
        return 0
    }
    
    let min = 10 ** UInt((n-1)*2)
    let max = (10 ** UInt(n*2) ) - 1
    
    for i in (min ..< max).reverse() {
        if checkReversibleNumberWithString(i) {

            if checkDivisiblebyNDigit(i, n: n) {
                return i
            }
        }
    }
    return 0
}


// 逆にした数字を算出して、元の数字と一致するかを判定する
func checkReversibleNumber(chechNumber :Int) -> Bool {
    var reversedNumber = 0
    
    var processing = chechNumber
    var oneDigit :Int
    
    while(processing != 0){
        oneDigit = processing % 10
        reversedNumber = reversedNumber * 10 + oneDigit
        processing = processing/10
    }
    
    if chechNumber == reversedNumber {
        return true
    }
    
    return false
    
}

// 文字列として反転させて、元の文と一致するかを判定する
func checkReversibleNumberWithString(chechNumber :Int) -> Bool {
    let checkNumberString = String(chechNumber)
    
    let reversedString = String(checkNumberString.characters.reverse())
    
    if checkNumberString == reversedString {
        return true
    }
    
    return false
    
}

// n桁同士の掛け算で実現可能か
func checkDivisiblebyNDigit(num :Int,n :Int) -> Bool {
    let min = 10 ** UInt(n-1)
    let max = (10 ** UInt(n) ) - 1
    for i in (min ..< max).reverse() {
        if num % i == 0 {
            if String(num/i).characters.count == n {
                print("num:\(num)")
                print("i:\(i)")
                print("num/i:\(num/i)")
                return true
            }
        }
    }
    return false
}




//getMaxReversibleNumber(2)

//getMaxReversibleNumber_2(3)




