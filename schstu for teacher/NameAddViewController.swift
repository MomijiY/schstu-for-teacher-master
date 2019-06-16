//
//  NameAddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/04/29.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

var Namenonakami = [String]()

class NameAddViewController: ViewController {
    
    //テキストフィールドの設定
    @IBOutlet weak var NameTextField: UITextField!
    
    //追加ボタンの設定
    @IBAction func NameAddButten(_ sender: Any) {
        //変数に入力内容を入れる
        Namenonakami.append(NameTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        NameTextField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
}
