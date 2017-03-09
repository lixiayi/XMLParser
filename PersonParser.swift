//
//  PersonParser.swift
//  0309
//
//  Created by xiaoyi li on 17/3/9.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit

class PersonParser: NSObject,XMLParserDelegate {
    var personList:[Person] = []
    var isUser:Bool = false
    var currentElementValue:String!
    var currentID:String = ""
    var currentName:String = ""
    var currentAge:String = ""
    
    override init(){
        
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "User" {
            isUser = true
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let str = string.trimmingCharacters(in: .whitespacesAndNewlines)
        self.currentElementValue = str
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if isUser == true {
            if elementName == "id" {
                currentID = self.currentElementValue
            }else if(elementName == "name"){
                currentName = self.currentElementValue
            }else if(elementName == "age"){
                currentAge = self.currentElementValue
            }
        }
        
        if(isUser == true){
            if elementName == "User" { //表示当前的一个User已经解析完毕，构造对象并存储
                let person:Person=Person()
                person.id=currentID
                person.name=currentName
                person.age=currentAge
                personList.append(person)
                isUser=false
            }
        }
    
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("解析错误")
    }
    
}
