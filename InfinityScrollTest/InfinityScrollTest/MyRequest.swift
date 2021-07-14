//
//  MyRequest.swift
//  InfinityScrollTest
//
//  Created by Byungwook Jeong on 2021/07/14.
//

import Foundation

class MyRequest {
    private var numArr: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    func fetch(_ completion: @escaping ([String]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let numString = self.numArr.map { "#\($0)" }
            
            completion(numString)
            
            self.numArr = self.numArr.map { $0 + 10 }
        }
    }
}
