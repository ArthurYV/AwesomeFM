//
//  PalyListViewController.swift
//  AwesomeFM
//
//  Created by Arthury on 15/8/11.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

import UIKit
import SnapKit

class PalyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var playListTableView:UITableView = UITableView()
    @IBOutlet weak var playListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._initTableView()
    }
    
    func _initTableView() {
        
//        self.view.addSubview(playListTableView)
//        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
//        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
//        playListTableView.snp_makeConstraints { (make) -> Void in
//            //要把布局约束全部描述清楚才可以
//            make.top.equalTo(self.view).offset(navigationBarHeight! + statusBarHeight)
//            make.left.equalTo(self.view).offset(0)
//            make.bottom.equalTo(self.view).offset(0)
//            make.right.equalTo(self.view).offset(0)
//        }
        
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
