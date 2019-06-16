//
//  AddViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/04/29.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class AddViewController: ViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var todotextview: UITextView!
    @IBOutlet weak var segmentedCon: UISegmentedControl!
    @IBOutlet  weak  var doneBtn: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardWillShow(with:)), name: .UIKeyboardWillShow,  object: nil)
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
