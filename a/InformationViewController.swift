//
//  ViewController1.swift
//  a
//
//  Created by 佐比内優太 on 2017/05/04.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var coursetitle: String?
    var rownumber: Int = 0
    
    @IBAction func backToView1(segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = coursetitle
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
