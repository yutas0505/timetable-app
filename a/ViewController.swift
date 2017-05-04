//
//  ViewController.swift
//  a
//
//  Created by 佐比内優太 on 2017/04/30.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var button: UIButton!
    var Array: [String] = ["num1","num2","num3","num4","num5","num6","num7","num8","num9","num10",
                  "num11","num12","num13","num14","num15","num16","num17","num18","num19","num20",
                  "num21","num22","num23","num24","num25","num26","num27","num28","num29","num30",
                  "num31","num32","num33","num34","num35","num36"]
    
    var selectedButton: UIButton?
    
    
    //データの個数を返すメソッド
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 36
    }
    
    
    //データを返すメソッド
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        //コレクションビューから識別子「TestCell」のセルを取得する。
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCollectionViewCell
        
        return cell
        
    }
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedButton != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toSubViewController",sender: nil)
        }
        
    
        
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let _: SubViewController = (segue.destination as? SubViewController)!
            
        }
    }
    
    
    @IBAction func backToTop(segue: UIStoryboardSegue) {}




}

    
    



