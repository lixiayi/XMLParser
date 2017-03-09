//
//  Person.swift
//  0309
//
//  Created by xiaoyi li on 17/3/9.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit

class Person: NSObject {
    var id:String=""
    var name:String=""
    var age:String=""
    init(id:String,name:String,age:String) {
        self.id=id
        self.name=name
        self.age=age
    }
    override init(){}
}
