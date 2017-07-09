//
//  calculator.swift
//  billSplit
//
//  Created by Cindy Zhou on 6/29/17.
//  Copyright © 2017 Cindy Zhou. All rights reserved.
//

import Foundation


class Person{
    
    var name: String?
    
    var amount: Double = 0
    
    var foods: Array<Food> = [Food("apple")]
    
    init(_ personName: String){
        name = personName
    }
    
    
}

class Food{
    var name: String?
    var ogprice: Double = 0
    var splitPeople: Int = 0
    var splitPrice: Double = 0
    init(_ foodName:String){
        name = foodName
    }
}

class GroupInformation{
    
    var numberofMembers: Int = 0
    var taxRate: Double = 0.0
    var tipRate: Double = 0.0
    
}
