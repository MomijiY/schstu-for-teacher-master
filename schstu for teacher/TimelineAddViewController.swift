//
//  TimelineAddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/10/11.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class TimelineAddViewController: UIViewController {
    
    @IBOutlet var contentTextView: UITextView!
    
    var me: AppUser!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func postContent() {
        let content = contentTextView.text!
        let saveDocument = Firestore.firestore().collection("posts").document()
        saveDocument.setData([
            "content": content,
            "postID": saveDocument.documentID,
//            "senderID": user.uid,
            "createdAt": FieldValue.serverTimestamp(),
            "updatedAt": FieldValue.serverTimestamp()
        ]) { error in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    func setupTextView() {
        let toolbar = UIToolbar()
        
        let flexibleSpaceBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        
        toolbar.items = [flexibleSpaceBarButton, doneButton]
        toolbar.sizeToFit()
        contentTextView.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        contentTextView.resignFirstResponder()
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
