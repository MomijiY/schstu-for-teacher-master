//
//  allMemoryViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/18.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit
import Firebase

class allMemoryViewController: UIViewController {
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var database: Firestore!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var Rememory: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var subjectLabel: UILabel!

    @IBOutlet weak var pageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        database = Firestore.firestore()
        
    }
    
    @IBAction func RememoryAc() {
        database.collection("data").document("example").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data["text"]!)
            
            self.timeLabel.text = data["text"] as? String
    }
        database.collection("data").document("example").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data["subject"]!)
            
            self.subjectLabel.text = data["subject"] as? String
        }
        database.collection("data").document("example").getDocument { (snap, error) in
            if let error = error {
                fatalError("\(error)")
            }
            guard let data = snap?.data() else { return }
            print(data["page"]!)
            
            self.pageLabel.text = data["page"] as? String
   
            }
        
        saveData.set(timeLabel.text, forKey: "Text")
        saveData.set(pageLabel.text, forKey: "Page")
        saveData.set(subjectLabel.text, forKey: "Subject")
   }
    
}
