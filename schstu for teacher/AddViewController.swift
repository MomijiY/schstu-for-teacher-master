//
//  AddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/04/29.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

var oshirasenakami = [String]()

class AddViewController: ViewController, UITextFieldDelegate{
    
    var database: Firestore!
    
    @IBOutlet weak var TextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database = Firestore.firestore()
        
        TextView.text = saveData.object(forKey: "noti") as? String
        
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(seeMemoryViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        TextView.inputAccessoryView = toolBar
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @IBAction func saveMemo() {
        
        

        let teacher_data = [
            "noti": TextView.text!
            ] as [String:Any]

        database.collection("teacher_data").document("noti").setData(teacher_data){ err in
            if let err = err {
                print("Error writiing document: \(err)")
            } else {
                print("Document successfully wriitten!")
            }
            
            oshirasenakami.append(self.TextView.text!)
            self.TextView.text = ""
            
            UserDefaults.standard.set(oshirasenakami, forKey: "Oshiraselist")
        }
        
        let alert: UIAlertController = UIAlertController(title: "OK", message: "お知らせが完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: { action in
                
                self.navigationController?.popViewController(animated: true)
            }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return  true
    }
}
