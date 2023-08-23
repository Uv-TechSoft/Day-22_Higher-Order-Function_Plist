//
//  ViewController.swift
//  Higher Order Functions
//
//  Created by Yogesh Patel on 20/08/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        forloopWithMap()
//        compact()
//        flatMap()
//        sorted()
          foreachLoop()
    }
    
    func forloopWithMap(){
        // For loop
        let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
        var doubled = [Int]()
        
        for number in numbers {
            doubled.append(number * 2)
        }
        
        //print(doubled)
        
        let d1 = numbers.map { number in
            return number * 2
        }
        print(d1)
        
        let d2 = numbers.map{ $0 * 2 }
        print(d2)
        
        // Prints [4, 10, 6, 18, 30, 24, 16, 34, 40, 22]
        
        
        //        let doubled1 = numbers.map({ (number) -> Int in
        //            return number * 2
        //        })
        //        print(doubled1)
        //
        //        let doubled2 = numbers.map { $0 * 2 }
        //        print(doubled2)
        //Prints [4, 10, 6, 18, 30, 24, 16, 34, 40, 22]
    }
    
    func compact(){
        
        let numbersWithNil = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]
        
//        let notNilDoubled = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : nil }
//        print(notNilDoubled)
        
        let d1 = numbersWithNil.map { (number) -> Int? in
            if let number = number{
                return number * 2
            }else{
                return nil
            }
        }
        print(d1)
        
        let d3 = numbersWithNil.map { number -> Int? in
            return number == nil ? nil : number! * 2
        }
        print(d3)
        
        let d2 = numbersWithNil.map{ $0 == nil ? nil : $0! * 2 }
        print(d2)
        
        let c1 = numbersWithNil.compactMap({ $0 == nil ? nil : $0! * 2 })
        print(c1)
        
        let c2 = numbersWithNil.compactMap({ $0 }).map{ $0 * 2 }
        print(c2)
        
        /*
         let doubledNums = numbersWithNil.map { (number) -> Int? in
         if let number = number {
         return number * 2
         } else {
         return nil
         }
         }
         */
        
        //let doubledNums = numbersWithNil.map { $0 != nil ? $0! * 2 : nil }
        
        //let notNilDoubled = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : nil }
        //[10, 30, 6, 18, 24, 34]
    }
    
    /*
     flatMap is useful when there are collections inside collections, and we want to merge them into one single collection.
     */
    func flatMap(){
        let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]
        var allMarks = [Int]()
        
        for marksArray in marks {
            print("marksArray", marksArray)
            allMarks += marksArray
            print("allMarks", allMarks)
        }
        
        print(allMarks)
        
        let f1 = marks.flatMap { array -> [Int] in
            return array
        }
        print(f1)
        let f2 = marks.flatMap({ $0 })
        print(f2)
        
        /*
         let allMarks = marks.flatMap { (array) -> [Int] in
         return array
         }
         */
        
        /*
         let allMarks = marks.flatMap { $0 }
         */
        // Prints [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]
    }
    
    func sorted(){
        let toSort = [5, 3, 8, 2, 10]
        print(toSort.sorted())
        // Prints [2, 3, 5, 8, 10]
        let s1 = toSort.sorted { n1, n2 in
            return n1 < n2
        }
        print(s1)
        
        let s2 = toSort.sorted(by: { $0 > $1 })
        print(s2)
        
        let s3 = toSort.sorted(by: <)
        print(s3)
        /*
         let sorted = toSort.sorted { (num1, num2) -> Bool in
         return num1 > num2
         }
         */
        
        /*
         let sorted = toSort.sorted { $0 > $1 }
         */
        
        /*
         let sorted = toSort.sorted(by: >)
         */
    }
    
    /*
     Contains, Filter
     */
    
    func foreachLoop(){
        let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]
        
        for number in numbers {
            number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
        }
        
        numbers.forEach { number in
            number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
        }
        numbers.forEach({ $0.isMultiple(of: 2) ? print("\($0) is even") : print("\($0) is odd") })
        
        print(1.isMultiple(of: 2))
        
        /*
         numbers.forEach { (number) in
         number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
         }
         */
        /*
         numbers.forEach { $0.isMultiple(of: 2) ? print("\($0) is even") : print("\($0) is odd") }
         */
        
    }
}

