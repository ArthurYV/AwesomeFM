//
//  PalyListViewController.swift
//  AwesomeFM
//
//  Created by Arthury on 15/8/11.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

import UIKit

class PalyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLSessionDownloadDelegate{

    @IBOutlet weak var playListTableView: UITableView!
    @IBOutlet weak var testImage: UIImageView!
    
    //声明的属性无法被创建的坑爹实事项，一定要搞清楚，否则到时候去讲课会坑爹
    //在方法内部创建属性就没有这么麻烦，在方法外部作为属性创建的时候就是如此的麻烦
    var session:NSURLSession?
    var dataTask:NSURLSessionDataTask?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.session = NSURLSession.sharedSession()
        self.dataTask = self.session?.dataTaskWithURL(NSURL(string: "http://fm.baidu.com/dev/api/?tn=channellist&hashcode=310d03041bffd10803bc3ee8913e2726&_=1428801468750")!, completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
            //回调处理
            //将接收到的数据json化
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: nil) as! NSDictionary
            //打印获取到的数据
            println("json:\(json)")
            //返回的数据并不是中文，这个要如何处理，原来在做云印的时候有遇到这样的问题，回头把原来的代码整理一下
            
        })
    }
    
    //下载完成时的回调
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        //将下载完成之后的数据转换为NSData
//        let data = NSData(contentsOfURL: location)
//        let img = UIImage(data: data!)
//        self.testImage.image = img
//        println("Image Load")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._initTableView()
        self.playListTableView.hidden = true
        self._handleNetworkRequest()
    }
    
    //实现下载进度
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        //参数说明
        //totalBytesWritten：已经下载的字节数
        //totalBytesExpectedToWrite：需要下载的字节数
        let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        println("下载进度：\(progress)")
        
    }
    
    func _handleNetworkRequest() {
        //dataTask?.resume()
        let dataUlr = NSURL(string:"http://download-cf.jetbrains.com/objc/AppCode-3.1.7.dmg")
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        //session的delegate可以在初始化的时候直接设置
        let downloadSession = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        let downloadTsk = downloadSession.downloadTaskWithURL(dataUlr!)
        downloadTsk.resume()
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
