//
//  NewInfoViewController.swift
//  schstu for teacher
//
//  Created by 吉川椛 on 2019/06/08.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class NewInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet var table: UITableView!
    
    var oshiraseNameArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        oshiraseNameArray = ["お知らせ１", "お知らせ2", "お知らせ3", "お知らせ4",  "お知らせ5", "お知らせ6", "お知らせ7"]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oshiraseNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = oshiraseNameArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(oshiraseNameArray[indexPath.row])が選ばれました！")
    }
    
}
