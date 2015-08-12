//
//  StopAndRunViewController.swift
//  AwesomeFM
//
//  Created by Arthury on 15/8/13.
//  Copyright (c) 2015年 Arthury. All rights reserved.
//

import UIKit

class StopAndRunViewController: UIViewController, NSURLSessionDownloadDelegate {

    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var resumeBtn: UIButton!
    @IBOutlet weak var progress: UIProgressView!
    
    //如果不是可选类型就不需要使用初始化方法，为什么
    var session:NSURLSession!
    var downloadTask:NSURLSessionDownloadTask!
    var resueData:NSData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._initNetWork()
    }

    func _initNetWork(){
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        let url = NSURL(string: "http://download-cf.jetbrains.com/objc/AppCode-3.1.7.dmg")
        downloadTask = session.downloadTaskWithURL(url!)
        downloadTask.resume()
    }
    
    //监测下载进度
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        println("下载进度：\(progress)")
        
        //线程操作有关，为什么要这样写才可以
        dispatch_async(dispatch_get_main_queue()) {
            self.progress.progress = progress
            return
        }
        
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    }
    
    @IBAction func stopDownload(sender: AnyObject) {
        downloadTask.cancelByProducingResumeData { (_resumeData:NSData!) -> Void in
            self.resueData = _resumeData
        }
        downloadTask.cancel()
    }

    //一直点会出现奇怪的错误
    @IBAction func resumeDownload(sender: AnyObject) {
        downloadTask = session.downloadTaskWithResumeData(self.resueData)
        downloadTask.resume()
    }

}
