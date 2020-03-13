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
        wkWebviewController.urlString = "http://www.baidu.com"
        self.navigationController?.pushViewController(wkWebviewController, animated: true)
    }
    

    
}

