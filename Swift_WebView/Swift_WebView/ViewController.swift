//
//  ViewController.swift
//  Swift_WebView
//
//  Created by baixue on 2020/3/12.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.baidu.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
