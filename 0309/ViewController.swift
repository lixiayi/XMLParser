//
//  ViewController.swift
//  0309
//
//  Created by xiaoyi li on 17/3/9.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//



/*
 * !!!重要说明!!!
 * 使用前使用SQLiteManager建一个库data.db，百度搜火狐的插件
 * 把data.db加入工程,否则编译报错，找到不库文件
 */
import UIKit
class ViewController: UIViewController {

    var db:SQLiteDB!
    @IBOutlet var usernam: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSHomeDirectory()
        print(path)
       
        db = SQLiteDB.shared
        
        let result = db.execute(sql: "create table if not exists t_user (uid integer primary key, uname varchar(20), mobile varchar(20))")
        print(result)
        
        initUser()
        
        
    }


    @IBAction func save(_ sender: AnyObject) {
        saveUser()
    }
    
    func initUser() {
        let data = db.query(sql: "select * from t_user")
        if data.count>0 {
            let user = data[data.count - 1]
            usernam.text = user["uname"] as? String
            password.text = user["mobile"] as? String
            
        }
    }
    
    func saveUser() {
        let uname = self.usernam.text!
        let mobile = self.password.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql: sql)
        print(result)
    }

}

