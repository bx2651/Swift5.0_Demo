//
//  ViewController.swift
//  Swift_JS_Interaction
//
//  Created by baixue on 2020/3/13.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController, UIWebViewDelegate {

    var textFiled = UITextField.init()
    var webView = UIWebView.init()
    
    @objc func btnAction(btn:UIButton){
        //加载textfield中的网址
        let request = NSURLRequest.init(url: NSURL.init(string: "http://" + textFiled.text!)! as URL)
        webView.loadRequest(request as URLRequest)
        
    }
    
    @objc func backBtnAction(backBtn:UIButton) {
        webView.goBack()
    }
    
    @objc func forwardBtnAction(forwardBtn:UIButton)  {
        webView.goForward()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //初始化textfield
        textFiled.frame = CGRect(x: 20, y: 40, width: 260, height: 30)
        textFiled.borderStyle = .bezel
        textFiled.clearButtonMode = .whileEditing
        textFiled.backgroundColor = UIColor.white
        self.view.addSubview(textFiled)

        //开始运行btn
        let btn = UIButton.init(frame: CGRect(x: 290, y: 40, width: 30, height: 30))
        btn.setTitle("GO", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(ViewController.btnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        //后退btn
        let backBtn = UIButton.init(frame: CGRect(x: btn.frame.origin.x + 40, y: btn.frame.origin.y, width: 30, height: 30))
        backBtn.setTitle("<", for: UIControl.State.normal)
        backBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        backBtn.addTarget(self, action: #selector(backBtnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(backBtn)

        //前进btn
        let forwardBtn = UIButton.init(frame: CGRect(x: backBtn.frame.origin.x + 40, y: backBtn.frame.origin.y, width: 30, height: 30))
        forwardBtn.setTitle(">", for: UIControl.State.normal)
        forwardBtn.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        forwardBtn.addTarget(self, action: #selector(ViewController.forwardBtnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(forwardBtn)


        webView.frame = CGRect(x:0, y:80,width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height - 80)
        webView.backgroundColor = UIColor.lightGray
        self.view.addSubview(webView)


        //设置代理(不要忘记!如果不设置就无法调用webView的代理方法)
        webView.delegate = self
    }


    
    

}

