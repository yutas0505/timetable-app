//
//  MemoViewController.swift
//  a
//
//  Created by 佐比内優太 on 2017/05/04.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit

private let unselectedRow = -1

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBOutlet weak var editMemoField: UITextField!
    @IBOutlet weak var memoListView: UITableView!

    
    var memoList: [String] = []
    var editRow: Int = unselectedRow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        memoListView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        editMemoField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        let loadedMemoList = defaults.object(forKey: "MEMO_LIST")
        if (loadedMemoList as? [String] != nil) {
            memoList = loadedMemoList as! [String]
            
    }
    
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapSubmitButton(sender: UIButton) {
        applyMemo()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        if indexPath.row >= memoList.count {
            return cell
        }
        
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= memoList.count {
            return
        }
        editRow = indexPath.row
        editMemoField.text = memoList[editRow]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        applyMemo()
        return true
    }
    
    func applyMemo() {
        if editMemoField.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            memoList.append(editMemoField.text!)
        } else {
            memoList[editRow] = editMemoField.text!
        }
        
        let defaults = UserDefaults.standard
        defaults.set(memoList, forKey: "MEMO_LIST:")
        
        editMemoField.text = ""
        editRow = unselectedRow
        memoListView.reloadData()
        }
    }
}
