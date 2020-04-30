//
//  ViewController.swift
//  Swift_BannerImg
//
//  Created by baixue on 2020/3/25.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let button = UIButton()
        button.setTitle("按钮", for: .normal)
        button.backgroundColor = UIColor.red
        button.frame = CGRect.init(x: 100, y: 100, width: 200, height: 30)
        button.tag = 1
        //添加点击方式，不区分传参与不传参
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        view.addSubview(button)
    }
    //按钮点击事件
    @objc func tapped(sender: UIButton) {
        print(sender.tag)
        let HomeViewControllers = HomeViewController()
        navigationController?.pushViewController(HomeViewControllers, animated: true)
    }
}
