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
    
    
    @IBOutlet weak var groupnametextfield: UITextField!
    @IBOutlet weak var grouppasswordtextfield: UITextField!

    
    var database: Firestore!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupnametextfield.text = "coment"
        groupnametextfield.delegate = self
        groupnametextfield.textColor = UIColor.black
        
        Firestore.firestore().collection("group").document("groupname").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data)
        }
        
        Firestore.firestore().collection("group").document("grouppassword").getDocument{ (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data)
            
        }
        
        
        database = Firestore.firestore()
        

        groupnametextfield.text = saveData.object(forKey: "name") as? String
        grouppasswordtextfield.text = saveData.object(forKey: "password") as? String
 
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(seeMemoryViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        groupnametextfield.inputAccessoryView = toolBar
        grouppasswordtextfield.inputAccessoryView = toolBar
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @IBAction func MemorySave() {

        saveData.set(groupnametextfield.text, forKey: "name")
        saveData.set(grouppasswordtextfield.text, forKey: "password")
        
        let coment = [
            "text": groupnametextfield.text!

            
            ] as [String:Any]
        
        let password = [
            "password": grouppasswordtextfield.text!
        ] as [String:Any]
        
        database.collection("group").document("groupname").setData(coment){ err in
            if let err = err {
                print("Error writiing document: \(err)")
            } else {
                print("Document successfully wriitten!")
            }
        }
        
        database.collection("group").document("grouppassword").setData(password){ err in
            if let err = err {
                print("Error writiing document: \(err)")
            } else {
                print("Document successfully wriitten!")
            }
        }
        
        let alert: UIAlertController = UIAlertController(
            title: "保存完了",
            message: "生徒に対してのコメントの保存が完了しました。",
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        groupnametextfield.resignFirstResponder()
        grouppasswordtextfield.resignFirstResponder()
        return  true
    }
    
    private func textViewDidBeginEditing(_ textView: UITextView) {
        if groupnametextfield.text == "coment"{
            groupnametextfield.textColor = UIColor.black
            groupnametextfield.returnKeyType = .done
        }
        if grouppasswordtextfield.text == "password" {
            grouppasswordtextfield.textColor = UIColor.black
            grouppasswordtextfield.returnKeyType = .done
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            groupnametextfield.resignFirstResponder()
            grouppasswordtextfield.resignFirstResponder()
        }
        return true
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
