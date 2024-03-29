//
//  FirstViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/10.
//  Copyright © 2019 吉川椛. All rights reserved.
//


import UIKit
import Firebase

class FirstViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var userLabel: UILabel!
//    var userName: String = ""
    
    // ユーザー名
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: 150)
        label.textAlignment = NSTextAlignment.center
        
        label.numberOfLines = 2
        self.view.addSubview(label)
        
        let now = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        label.text = formatter.string(from: now)
        
        // ユーザー名を表示
        userLabel.text = userName
        
        // ユーザー名を表示
        if let userName = UserDefaults.standard.string(forKey: "userNameKey") {
            userLabel.text = "\(userName)先生こんにちは。"
        } else {
            userLabel.text = "読み込めなかった時"
        }
        
 
        
    
//        // ルートはサインアップのViewController
//        let rootVC = UINavigationController(rootViewController: UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() ?? UIViewController()
//        )
//
//        // サインアップ済みならホームのViewControllerを表示
//        if UserDefaults.standard.bool(forKey: "appSignUpStatusKey") {
//            rootVC.pushViewController(UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() ?? UIViewController(), animated: false)
//        }
//
////        window?.rootViewController = rootVC
////        window?.makeKeyAndVisible()

    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
