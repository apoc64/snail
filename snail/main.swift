//
//  main.swift
//  snail
//
//  Created by Steven Schwedt on 8/31/18.
//  Copyright © 2018 Steven Schwedt. All rights reserved.
//

import Foundation

//Given an n x n array, write a function that returns the array elements arranged from outermost elements to the middle element, traveling clockwise.
let arrayMatrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
];

func snail(inputMatrix: [[Int]]) -> [Int] {
    var matrix = inputMatrix
    var result: [Int] = []
    
    let firstArray = matrix.removeFirst()
    for num in firstArray {
        result.append(num)
    }
    if matrix.isEmpty { return result }
    for (i, _) in matrix.enumerated() {
        result.append(matrix[i].removeLast())
    }
    if matrix.isEmpty { return result }
    let lastArray = matrix.removeLast()
    for num in lastArray.reversed() {
        result.append(num)
    }
    if matrix.isEmpty { return result }
    for (i, _) in matrix.reversed().enumerated() {
        result.append(matrix[i].removeFirst())
    }
    
    if !matrix.isEmpty {
        result += snail(inputMatrix: matrix)
    }
    
    return result
}

print(snail(inputMatrix: arrayMatrix))
//#=> [1, 2, 3, 6, 9, 8, 7, 4, 5]
