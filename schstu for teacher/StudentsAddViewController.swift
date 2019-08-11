//
//  StudentsAddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/07/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//
import UIKit

//変数の設置
var Studentsnonakami = [String]()

class StudentsAddViewController: UIViewController {
    //テキストフィールドの設定
    @IBOutlet weak var NameTextField: UITextField!
    
    //追加ボタンの設定
    @IBAction func TodoAddButten(_ sender: Any) {
        //変数に入力内容を入れる
        Studentsnonakami.append(NameTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        NameTextField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( Studentsnonakami, forKey: "StudentsList" )
    }
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
