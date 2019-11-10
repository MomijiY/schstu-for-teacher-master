//
//  makegroupViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/11/10.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class makegroupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var groupPasswordTextField: UITextField!
    
    var database: Firestore!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        groupNameTextField.text = "groupname"
        groupNameTextField.delegate = self
        groupNameTextField.textColor = UIColor.black
        
        database = Firestore.firestore()
        
        groupNameTextField.text = saveData.object(forKey: "groupname") as? String
        
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(makegroupViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        groupNameTextField.inputAccessoryView = toolBar
        // Do any additional setup after loading the view.
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @IBAction func MemorySave() {
        saveData.set(groupNameTextField.text, forKey: "")
        
        let groupname = ["groupname": groupNameTextField.text] as [String:Any]
        
        database.collection("groupname").document("groupname").setData(groupname){ err in
            if let err = err {
                print("Error writiing document: \(err)")
            } else {
                print("Document successfully wriitten!")
            }
        }
        
        let alert: UIAlertController = UIAlertController(
            title: "グループ作成",
            message: "グループの作成が完了しました",
            preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    self.presentingViewController?.dismiss(animated: true, completion: nil)
                    print("OKbutton")
            }
            )
        )
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if groupNameTextField.text == "groupname"{
            groupNameTextField.textColor = UIColor.black
            groupNameTextField.returnKeyType = .done
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        groupNameTextField.resignFirstResponder()
        return  true
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

