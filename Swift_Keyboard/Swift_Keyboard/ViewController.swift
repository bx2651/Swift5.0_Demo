//
//  ViewController.swift
//  Swift_Keyboard
//
//  Created by baixue on 2020/4/14.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(passwordTf)
    }
    
  
    let passwordTf: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "请输入密码",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        tf.borderStyle = .none
        tf.backgroundColor = UIColor.clear
        tf.textColor = .white
        tf.textAlignment = .left
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tf.layer.borderWidth = 1
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tf
        
        
    }()
    
}

