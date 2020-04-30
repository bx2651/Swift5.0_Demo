//
//  ViewController.swift
//  Swift_UIPickView
//
//  Created by baixue on 2020/4/21.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit


class ViewController:UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    private var pickerView : UIPickerView!
    private var uiView : UIView!
    private var cancleBtn : UIButton!
    private var okBtn : UIButton!
    
    var choiceFlag = true
    
    var arr = ["河流","湖泊","水库"]
    let riverList = ["西江","郁江","柳江"]
    let lakeList = ["西湖","洞庭湖","千岛湖"]
    var array = Array<String?>()
    override func viewDidLoad() {
        
        setupUI2()
    }
    
    let ChoiceRiver: UIButton = {
        let button = UIButton(frame:CGRect(x:100, y:100, width:100, height:30))
        button.backgroundColor = UIColor.blue
        button.setTitle("选择区域",for:.normal)
        button.addTarget(self, action:#selector(pickerViewIsShow),
        for: .touchUpInside)
        return button
    }()
    

    @objc func pickerViewIsShow(){
        pickerView.isHidden = false
        uiView.isHidden = false
    }
    
    @objc func cancleAction(){
        arr = ["河流","湖泊","水库"]
        if choiceFlag == false {
            choiceFlag = !choiceFlag
        }
        self.pickerView.isHidden = true
        self.uiView.isHidden = true
        self.pickerView.reloadAllComponents()
    }
    @objc func okAction(){

        if choiceFlag {
            choiceFlag = !choiceFlag
            
            let message = pickerView.selectedRow(inComponent: 0)
            print(message)
            if message as AnyObject === 0 as AnyObject {
                print("this is 0")
                arr = riverList
                self.pickerView.reloadAllComponents()
            }else if message as AnyObject === 1 as AnyObject {
                print("this is 1")
                arr = lakeList
                self.pickerView.reloadAllComponents()
            }else if message as AnyObject === 2 as AnyObject {
                print("this is 2")
                if array.count > 0{
                    self.pickerView.reloadAllComponents()
                }else{
                    arr = ["您没有水库可选择，请重新选择"]
                    self.pickerView.reloadAllComponents()
                }
                
            }
        }else{
            print(pickerView.selectedRow(inComponent: 0))
            cancleAction()
        }

    }

    
    func setupUI2(){
        view.addSubview(ChoiceRiver)
        /**
         选择弹框s初始化
         */
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: self.view.frame.height-200, width: self.view.frame.width, height: 200))
        self.pickerView.backgroundColor = UIColor.init(displayP3Red: 214, green: 214, blue: 214, alpha: 1)
        self.pickerView.isHidden = true
        self.pickerView.delegate = self//绑定代理
        self.pickerView.dataSource = self//绑定数据

        self.uiView = UIView(frame: CGRect(x: 0, y: self.view.frame.height-250, width: self.view.frame.width, height: 50))
        self.uiView.backgroundColor = UIColor.init(displayP3Red: 214, green: 214, blue: 214, alpha: 1)
        self.uiView.layer.masksToBounds = true
        self.uiView.isHidden = true

        self.cancleBtn = UIButton(frame: CGRect(x: 20, y: 3, width: 100, height: 44))
        self.cancleBtn.setTitle("取消", for: .normal)
        self.cancleBtn.setTitleColor(UIColor.red, for: .normal)
        self.cancleBtn.addTarget(self, action: #selector(cancleAction), for: .touchUpInside)

        self.okBtn = UIButton(frame: CGRect(x: self.view.frame.width-120, y: 3, width: 100, height: 44))
        self.okBtn.setTitle("确定", for: .normal)
        self.okBtn.setTitleColor(UIColor.red, for: .normal)
        self.okBtn.addTarget(self, action: #selector(okAction), for: .touchUpInside)
        
        view.addSubview(pickerView)
        uiView.addSubview(cancleBtn)
        uiView.addSubview(okBtn)
        view.addSubview(uiView)
    }
    
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
}
