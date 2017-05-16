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
    var classList: [String] = []
    var editRow: Int = unselectedRow
    
    @IBAction func backToView1(segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = coursetitle
        // Do any additional setup after loading the view.
        
        
        let defaults = UserDefaults.standard
        let loadedClassList = defaults.object(forKey: "\(rownumber)")
        if (loadedClassList as? [String] != nil) {
            classList = loadedClassList as! [String]
        }
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        applyClass()
        return true
    }

    
    
    func applyClass() {
        if classnameField.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            classList.append(classnameField.text!)
        } else {
            classList[editRow] = classnameField.text!
        }
        
        let defaults = UserDefaults.standard
        defaults.set(classList, forKey: "\(rownumber)")
        
        classnameField.text = ""
        editRow = unselectedRow
        classLabel.updateConstraints()
    }


    
    @IBOutlet weak var classnameField: UITextField!
    
    @IBOutlet weak var classLabel: UILabel!
    
    
    @IBAction func nameButton(_ sender: Any) {
        
        let inputText = classnameField.text
        classLabel.text = inputText
        classnameField.text = nil

    }
    


}
