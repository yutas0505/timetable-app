//
//  ViewController1.swift
//  a
//
//  Created by 佐比内優太 on 2017/05/04.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit
private let unselectedRow = -1

class InformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    var coursetitle: String?
    var rownumber: Int = 0
    
    
    @IBAction func backToView1(segue: UIStoryboardSegue) {}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = coursetitle
        
        let userDefaults = UserDefaults.standard
        if let labelText = userDefaults.string(forKey: "\(rownumber)") {
            classLabel.text = labelText
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    @IBAction func memoButton(_ sender: Any) {
        performSegue(withIdentifier: "toMemoViewController",sender: nil)
    }
    
    @IBAction func ImageButton(_ sender: Any) {
        performSegue(withIdentifier: "toImageViewController",sender: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMemoViewController" {
            let memoViewController = segue.destination as! MemoViewController
            memoViewController.rownumber = rownumber
        }
        
        if segue.identifier == "toImageViewController" {
            _ = segue.destination as! ImageViewController

        }
        
        if segue.identifier == "toViewController" {
            let ViewController = segue.destination as! ViewController
            ViewController.text1 = "数学"
            
        }
        
    }

    
    @IBOutlet weak var classnameField: UITextField!
    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBAction func nameButton(_ sender: Any) {
        
        _ = classnameField.text
        classLabel.text = classnameField.text
        
        let defaults = UserDefaults.standard
        defaults.set(classLabel.text, forKey: "\(rownumber)")
        defaults.synchronize()

    }

}
