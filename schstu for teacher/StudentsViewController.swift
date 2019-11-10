//
//  StudentsViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/07/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

var Studentsnonakami = [String]()

class StudentsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
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
            tableView.reloadData()
            
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
        
        //キーボードを閉じる
        textField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
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
        
        textField.delegate = self
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        
        if let students = UserDefaults.standard.object(forKey: "StudentsList") as? [String] {
            Studentsnonakami = students
        }
        
        tableView.isEditing = true
        tableView.isScrollEnabled = false
//        //追加画面で入力した内容を取得する
//        if UserDefaults.standard.object(forKey: "StudentsList") != nil {
//            studentsnonakami = UserDefaults.standard.object(forKey: "StudentsList") as! [String]
//        }
    }
    
  
    //並べ替え可能にするメソッド。
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //並べ替え結果を処理するメソッド。
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // TODO: 入れ替え時の処理を実装する（データ制御など）
        if let targetTitle:String = Studentsnonakami[sourceIndexPath.row] {
            //元の位置のデータを配列から削除
            Studentsnonakami.remove(at:sourceIndexPath.row)
            //移動先の位置にデータを配列に挿入
            Studentsnonakami.insert(targetTitle, at: destinationIndexPath.row)
        }
        //テーブルビューをリロードする。
        tableView.reloadData()
    }
    
    //編集状態の見た目を編集する。
    //左側の＋やーを表示
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete //表示させる。
    }
    //編集モード時に左にずれるか。
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false //ずれない。
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "Tomemory", sender: nil)
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

