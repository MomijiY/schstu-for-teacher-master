//
//  StudentsViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/07/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

var Studentsnonakami = [String]()

class StudentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return Studentsnonakami.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let StudentsCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "StudentsCell", for: indexPath)
        //変数の中身を作る
        StudentsCell.textLabel!.text = Studentsnonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return StudentsCell
    }
    
    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            //itemArray.remove(at: indexPath.row)
            Studentsnonakami.remove(at: indexPath.row)
            
            // todokebetsunonakamiが更新されたので保存
            UserDefaults.standard.set(Studentsnonakami, forKey: "StudentsList" )
            
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }

    
    @IBAction func button(_ sender: Any) {
        //変数に入力内容を入れる
        Studentsnonakami.append(textField.text!)
        //追加ボタンを押したらフィールドを空にする
        textField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( Studentsnonakami, forKey: "StudentsList" )
        
        tableView.reloadData()
    }
    
    @IBAction func cancelbtn(_ sender: Any) {
        tableView.reloadData()
    }
    
//
//
//
//    // アイテムの型
//    class Item {
//        var title : String
//        var done: Bool = false
//
//        init(title: String) {
//            self.title = title
//        }
//    }
//
//    // この配列に作ったアイテムを追加していく
//    var itemArray: [Item] = []
//
//    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //戻り値の設定(表示するcell数)
//        return Studentsnonakami.count
//    }
//
//    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //変数を作る
//        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
//        //変数の中身を作る
//        TodoCell.textLabel!.text = Studentsnonakami[indexPath.row]
//        //戻り値の設定（表示する中身)
//        return TodoCell
//    }
//
//    //セルの編集許可
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//    {
//        return true
//    }
//
//    //スワイプしたセルを削除
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            itemArray.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//        }
//    }
//
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let students = UserDefaults.standard.object(forKey: "StudentsList") as? [String] {
            Studentsnonakami = students
        }
//        //追加画面で入力した内容を取得する
//        if UserDefaults.standard.object(forKey: "StudentsList") != nil {
//            studentsnonakami = UserDefaults.standard.object(forKey: "StudentsList") as! [String]
//        }
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

