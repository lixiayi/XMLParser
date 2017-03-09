//
//  SecondViewController.swift
//  0309
//
//  Created by xiaoyi li on 17/3/9.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func parseClick(_ sender: AnyObject) {
        
        let parser = XMLParser(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "personData", ofType: "xml")!) as URL)!
        
        let dele = PersonParser()
        parser.delegate = dele
        parser.parse()
        
        for p in dele.personList {
            print("id=\(p.id), name = \(p.name), age = \(p.age)")
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
