//
//  ViewController.swift
//  a
//
//  Created by 佐比内優太 on 2017/04/30.
//  Copyright © 2017年 Yuta Sahinai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
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
        
        //セルの背景色をランダムに設定する。
        cell.backgroundColor = UIColor(red: CGFloat(drand48()),
                                       green: CGFloat(drand48()),
                                       blue: CGFloat(drand48()),
                                       alpha: 1.0)
        
        //セルのラベルに番号を設定する。
        cell.testLabel.text = String(indexPath.row + 1)
        
        return cell
        
    }
    
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "toSubViewController",sender: nil)
        }
        
    }
    
    // Segue 準備
    func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let _: SubViewController = (segue.destination as? SubViewController)!
        }
    }

    
    



