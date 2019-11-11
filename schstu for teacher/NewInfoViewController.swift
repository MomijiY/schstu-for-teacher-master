//
//  NewInfoViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/08.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class NewInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return oshirasenakami.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let OshiraseCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "OshiraseCell", for: indexPath)
        //変数の中身を作る
        OshiraseCell.textLabel!.text = oshirasenakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return OshiraseCell
    }
//    @IBOutlet weak var tableView: UITableView!
//
//    var oshirasenakami = [String]()
//

    override func viewDidLoad() {
        super.viewDidLoad()
//        if let noties = UserDefaults.standard.object(forKey: "Oshiraselist") as? [String] {
//            oshirasenakami = noties
//        }
    }
}
    
//    //追加ボタンの設定
//    @IBAction func TodoAddButten(_ sender: Any) {
//        //変数に入力内容を入れる
//        oshirasenakami.append("Todo\(oshirasenakami.count)")
//
//        //変数の中身をUDに追加
//        UserDefaults.standard.set(oshirasenakami, forKey: "Oshiraselist" )
//
//        // tableViewのリロードがなかった
//        tableView.reloadData()
//    }
//
//    //cancelボタンの設定
//    @IBAction func CancelButton(_ sender: Any) {
//        tableView.reloadData()
//    }
//
//}
//
//extension NewInfoViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return oshirasenakami.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let noticell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
//
//
//        noticell.textLabel?.text = oshirasenakami[indexPath.row]
//
//        return noticell
//    }
//
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete{
//            oshirasenakami.remove(at: indexPath.row)
//
//            UserDefaults.standard.set(oshirasenakami, forKey: "Oshiraselist")
//
//            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
//
//            tableView.reloadData()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        // 別の画面に遷移
//        performSegue(withIdentifier: "Tomemory", sender: nil)
//    }
//}
