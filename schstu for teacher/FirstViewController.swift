//
//  FirstViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/10.
//  Copyright © 2019 吉川椛. All rights reserved.
//


import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
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
