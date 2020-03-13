//
//  ViewController.swift
//  Swift_WebView2.0
//
//  Created by baixue on 2020/3/12.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

let Width = UIScreen.main.bounds.size.width
let Height = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoToWebView(_ sender: Any) {
        let wkWebviewController:WKWebviewController = WKWebviewController()
        //如果url地址是http,则需要在info.plist中设置App Transport Security Settingsx下的Allow Arbitrary Loads为YES,https则不需要,原因请自行谷歌
        wkWebviewController.urlString = "http://www.baidu.com"
        self.navigationController?.pushViewController(wkWebviewController, animated: true)
    }
    

    
}

