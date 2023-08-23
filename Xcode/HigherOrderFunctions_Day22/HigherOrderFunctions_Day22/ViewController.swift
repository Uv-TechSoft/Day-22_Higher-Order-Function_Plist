//
//  ViewController.swift
//  HigherOrderFunctions_Day22
//
//  Created by Imam MohammadUvesh on 08/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        forloopwithmap()
        compact()
        flatmap()
        sorted()
        foreachLoop()
    }

    func forloopwithmap()
    {
        let numbers = [1,3,5,7,9,11,13,15,17,19,21]
        var numbercollection = [Int]()
        for x in numbers
        {
            numbercollection.append(x * 2)
        }
        print(numbercollection)
        
        let d1 = numbers.map
        { numbers in
            return numbers * 2
        }
         print(d1)
        let double1 = numbers.map({(numbers) -> Int in return numbers * 2 })
        print(double1)
        let double2 = numbers.map{$0 * 2}
        print(double2)
    }
    
    func compact()
    {
        let numberwithNil = [3,5,nil,8,11,113,nil]
        let noNilNumber = numberwithNil.compactMap{ $0 != nil ? $0! * 2 : nil}
        print(noNilNumber)
        
        let dx = numberwithNil.map{(number) -> Int? in if let number = number
            {
               return number * 2
            }else
            {
             return nil
            }
            
        }
        print(dx)
       
        let dx1 = numberwithNil.map{ number -> Int? in return number == nil ? nil: number! * 2 }
        print(dx1)
        
        let dx2 = numberwithNil.map{ $0 == nil ? nil: $0! * 2}
        print(dx2)
        
        let c1 = numberwithNil.compactMap({$0 == nil ? nil : $0! * 2 })
            print(c1)
        
        let c2 = numberwithNil.compactMap({$0}).map{ $0 * 2 }
        print(c2)
        
        let doubleNums = numberwithNil.map{(number) -> Int? in
            if let number = number
            {
                return number * 2
            }
            else
            {
                return nil
            }
        }
        
        print(doubleNums)
        
        let doubleNumbs = numberwithNil.map{$0 != nil ? $0! * 2 : nil}
        print(doubleNumbs)
        
        let noNilDoubled = numberwithNil.compactMap{ $0 != nil ? $0! * 2 : nil}
        print(noNilDoubled)
        
    }
    
    //MARK: FlatMap is useful when there are collections inside collections, and we want to merge them into one single collection.
    
    func flatmap()
    {
        let marks = [[1,2,3],[4,5,6],[7,8,9],[1,2,4,5,3]]
        var allmarks = [Int]()
        
        for marksheet in marks
        {
            print("Marksheet Data",marksheet)
            allmarks += marksheet
            print("All Marks",allmarks)
        }
        print(allmarks)
        
        let f1 = marks.flatMap{ array -> [Int] in return array}
        print(f1)
        
        let f2 = marks.flatMap({ $0 })
        print(f2)
        
        let allMarks = marks.flatMap{(array) -> [Int] in return array}
        print(allMarks)
        
        
        let alMarks = marks.flatMap{$0}
        print(alMarks)
    }
    
    func sorted()
    {
      let toSort = [3,9,7,54,11,34,2,344,67,99,111]
        print(toSort.sorted())
        
        let s1 = toSort.sorted
        {
            n1, n2 in return n1 < n2
        }
        print(s1)
        
        let s2 = toSort.sorted(by: {$0 > $1})
        print(s2)
        
        let s3 = toSort.sorted(by: <)
        print(s3)
        
        let sorted = toSort.sorted{(num1, num2) -> Bool in return num1 > num2
        }
        print(sorted)
        
        let sorted1 = toSort.sorted{$0 > $1}
        print(sorted1)
        
        let sorted2 = toSort.sorted(by: >)
        print(sorted2)
    }
    
    func foreachLoop()
    {
       let numbers = [2,5,7,9,11,12,15,20,22,24,28,30]
        
        for number in numbers
        {
            number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is Odd")
        }
        
        numbers.forEach
        {
            number in number.isMultiple(of: 2) ? print("\(number) is Even") : print("\(number) is Odd")
        }
        numbers.forEach(
            {$0.isMultiple(of: 2) ?  print("\($0) is Even") : print("\($0) is Odd")
            })
        
        print(1.isMultiple(of: 2))
        
        numbers.forEach
            {
            (number) in number.isMultiple(of: 2) ? print("\(number) is Even") : print("\(number) is Odd")
            }
        
        numbers.forEach
        {
            $0.isMultiple(of: 2) ? print("\($0) is Even") : print("\($0) is Odd")
        }
    }
}

