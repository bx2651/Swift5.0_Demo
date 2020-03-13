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
    
    
    //用法：将文件夹中的WKWebViewController放到项目中，需要点击跳转到web页面的按钮中添加以下代码即可。
    //assets文件夹中需要放入返回上一页或ios按钮页面的图标，如果图标名字不一致，则需要在WKWebViewController中改成相应的名字
    
    @IBAction func GoToWebView(_ sender: Any) {
        let wkWebviewController:WKWebviewController = WKWebviewController()
        //如果是http请求,则需要在info.plist中设置App Transport Security Settings下的Allow Arbitrary Loads为YES,https不需要
        wkWebviewController.urlString = "http://www.baidu.com"
        self.navigationController?.pushViewController(wkWebviewController, animated: true)
    }
    

    
}

