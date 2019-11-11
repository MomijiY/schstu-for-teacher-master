//
//  seeMemoryViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/05.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class seeMemoryViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var contentTextView: UITextView!

    
    var database: Firestore!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTextView.text = "coment"
        contentTextView.delegate = self
        contentTextView.textColor = UIColor.black
        
        
        database = Firestore.firestore()
        

        contentTextView.text = saveData.object(forKey: "content") as? String
 
        let toolBar =  UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        
        toolBar.barStyle = UIBarStyle.default
        
        toolBar.sizeToFit()
        
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(seeMemoryViewController.commitButtonTapped))
        
        toolBar.items = [spacer, commitButton]
        
        contentTextView.inputAccessoryView = toolBar
    }
    
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }
    
    @IBAction func MemorySave() {

        saveData.set(contentTextView.text, forKey: "content")
        
        let coment = [
            "text": contentTextView.text!

            
            ] as [String:Any]
        
        database.collection("coment").document("coment").setData(coment){ err in
            if let err = err {
                print("Error writiing document: \(err)")
            } else {
                print("Document successfully wriitten!")
            }
        }
        
        let alert: UIAlertController = UIAlertController(
            title: "保存完了",
            message: "生徒に対してのコメントが完了しました。",
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
        textField.resignFirstResponder()
        return  true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if contentTextView.text == "coment"{
            contentTextView.textColor = UIColor.black
            contentTextView.returnKeyType = .done
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            contentTextView.resignFirstResponder()
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
