//
//  MusicPlayingViewController.swift
//  AwesomeFM
//
//  Created by Arthury on 15/8/13.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

import UIKit

class MusicPlayingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self._handleNetwork()
    }
    
    func _handleNetwork() {
        //申请一个一般的模式
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        //设置头文件类型，设置为json类型
        sessionConfiguration.HTTPAdditionalHeaders = ["Accept":"application/json"]
        //设置是否允许蜂窝数据
        sessionConfiguration.allowsCellularAccess = true
        //设置网络链接的超时时间
        sessionConfiguration.timeoutIntervalForRequest = 30.0
        
        let session = NSURLSession(configuration: sessionConfiguration)
        
        //swift用起来真爽，调用一个函数就是这么酸爽
        let url = NSURL(string:"https://itunes.apple.com/search?term=apple&media=software".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        //以链条的形式书写task，直接在末尾启动任务
        session.dataTaskWithURL(url!, completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
            
            if((NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error:nil)) != nil){
                println("json:\(NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error:nil))")
            }else{
                println("json value is illegal")
            }
            
        }).resume()
    }

}
