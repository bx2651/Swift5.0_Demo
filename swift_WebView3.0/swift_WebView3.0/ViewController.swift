//
//  ViewController.swift
//  swift_WebView3.0
//
//  Created by baixue on 2020/3/13.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func button1(_ sender: Any) {
        let webVC = SwiftWebVC(urlString: "https://www.google.com")
        webVC.delegate = self as? SwiftWebVCDelegate
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    @IBAction func button2(_ sender: Any) {
    }
    @IBAction func button3(_ sender: Any) {
    }
    @IBAction func button4(_ sender: Any) {
    }
    
}

