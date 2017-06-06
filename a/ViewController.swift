//
//  ViewController.swift
//  a
//
//  Created by 佐比内優太 on 2017/04/30.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var timetableCollectionView: UICollectionView!
    
    
    let name = ["月曜1限","火曜1限","水曜1限","木曜1限","金曜1限",
                "月曜2限","火曜2限","水曜2限","木曜2限","金曜2限",
                "月曜3限","火曜3限","水曜3限","木曜3限","金曜3限",
                "月曜4限","火曜4限","水曜4限","木曜4限","金曜4限",
                "月曜5限","火曜5限","水曜5限","木曜5限","金曜5限",
                "月曜6限","火曜6限","水曜6限","木曜6限","金曜6限",]
    
    var selectedButton: UIButton?
    var memoList: [String] = []
    var rownumber: Int = 0
    
    @IBOutlet weak var testLabel: UILabel!
    var labelText: String?


    
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 30

    }
    
    //データを返すメソッド
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「TestCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCollectionViewCell
        
        //セルのラベルに番号を設定する。
        cell.testLabel.text = String(indexPath.row + 1)

        
        return cell
        
    }
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        timetableCollectionView.delegate = self
        timetableCollectionView.dataSource = self
        
        
        let defaults = UserDefaults.standard
        let loadedMemoList = defaults.object(forKey: "\(rownumber)")
        if (loadedMemoList as? [String] != nil) {
            memoList = loadedMemoList as! [String]
        }

    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            // SubViewController へ遷移するために Segue を呼び出す
     
        performSegue(withIdentifier: "toInformationViewController",sender: indexPath.row)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInformationViewController" {
            let informationViewController = segue.destination as! InformationViewController
            informationViewController.coursetitle = name[(sender as? Int)!]
            informationViewController.rownumber = (sender as? Int)!
        }
    }
    
    @IBAction func backToTop(segue: UIStoryboardSegue) {}
    
    func tableView(tableView: UITableView, didSelectedRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            let informationViewController = self.storyboard!.instantiateViewController(withIdentifier: "categorySelect")
            self.present(informationViewController, animated: true, completion: nil)
        }
    }

    
}

