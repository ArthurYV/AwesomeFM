//
//  PalyListViewController.swift
//  AwesomeFM
//
//  Created by Arthury on 15/8/11.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

import UIKit

class PalyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var playListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._initTableView()
    }
    
    func _initTableView() {
        
        
        playListTableView.delegate = self
        playListTableView.dataSource = self
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
}
