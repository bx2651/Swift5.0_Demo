//
//  WK.swift
//  Ganymede
//
//  Created by baixue on 2020/3/17.
//  Copyright © 2020 multisim. All rights reserved.
//

import UIKit
import WebKit


let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height

class WKWebviewController: UIViewController,WKUIDelegate,WKNavigationDelegate
{
    var urlString:String?
    
    private var leftBarButton:UIBarButtonItem?
    private var leftBarButtonSecond:UIBarButtonItem?
    private var negativeSpacer:UIBarButtonItem?
    
    
    /*
     *加载WKWebView对象
     */
    lazy var wkWebview:WKWebView =
        {
            () -> WKWebView in
            print(self.view.bounds)
            
            var tempWebView = WKWebView.init(frame: self.view.bounds)
            tempWebView.uiDelegate = self
            tempWebView.navigationDelegate = self
            tempWebView.backgroundColor = UIColor.white
            tempWebView.autoresizingMask = UIView.AutoresizingMask.init(rawValue: 1|4)
            tempWebView.isMultipleTouchEnabled = true
            tempWebView.autoresizesSubviews = true
            tempWebView.scrollView.alwaysBounceVertical = true
            tempWebView.allowsBackForwardNavigationGestures = true
            
            return tempWebView
    }()
    
    
    /*
     *懒加载UIProgressView进度条对象
     */
    lazy var progress:UIProgressView =
        {
            () -> UIProgressView in
            var rect:CGRect = CGRect.init(x: 0, y: 64, width: kScreenW, height: 2.0)
            let tempProgressView = UIProgressView.init(frame: rect)
            tempProgressView.tintColor = UIColor.red
            tempProgressView.backgroundColor = UIColor.gray
            return tempProgressView
    }()
    
    /*
     *创建BarButtonItem
     */
    
    func setupBarButtonItem()
    {
        
        self.leftBarButton = UIBarButtonItem.init(image: UIImage.init(named: "back_item"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(WKWebviewController.selectedToBack))
        self.negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
        self.negativeSpacer?.width = -5
        self.leftBarButtonSecond = UIBarButtonItem.init(image: UIImage.init(named: "close_item"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(WKWebviewController.selectedToClose))
        self.leftBarButtonSecond?.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 20)
        
        let items = [self.negativeSpacer,self.leftBarButton]
        self.navigationItem.leftBarButtonItems = items as? [UIBarButtonItem]
    }
    
    /*
     *设置UI部分
     */
    func setupUI()
    {
        self.setupBarButtonItem()
        self.view.addSubview(self.wkWebview)
        self.view.addSubview(self.progress)
    }
    
    /*
     *加载网页 request
     */
    func loadRequest()
    {
        self.wkWebview.load(NSURLRequest.init(url: NSURL.init(string: self.urlString!)! as URL) as URLRequest)
    }
    
    /*
     *添加观察者
     *作用：监听 加载进度值estimatedProgress、是否可以返回上一网页canGoBack、页面title
     */
    func addKVOObserver()
    {
        self.wkWebview.addObserver(self, forKeyPath: "estimatedProgress", options: [NSKeyValueObservingOptions.new,NSKeyValueObservingOptions.old], context: nil)
        self.wkWebview.addObserver(self, forKeyPath: "canGoBack", options:[NSKeyValueObservingOptions.new,NSKeyValueObservingOptions.old], context: nil)
        self.wkWebview.addObserver(self, forKeyPath: "title", options: [NSKeyValueObservingOptions.new,NSKeyValueObservingOptions.old], context: nil)
    }
    
    /*
     *移除观察者,类似OC中的dealloc
     *观察者的创建和移除一定要成对出现
     */
    deinit
    {
        self.wkWebview.removeObserver(self, forKeyPath: "estimatedProgress")
        self.wkWebview.removeObserver(self, forKeyPath: "canGoBack")
        self.wkWebview.removeObserver(self, forKeyPath: "title")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.setupUI()
        self.loadRequest()
        self.addKVOObserver()
    }
    
    
    
    /*
     *返回按钮执行事件
     */
    @objc func selectedToBack()
    {
        if (self.wkWebview.canGoBack == true)
        {
            self.wkWebview.goBack()
        }
        else
        {
            self.navigationController?.popViewController(animated: false)
        }
    }
    
    /*
     *关闭按钮执行事件
     */
    @objc func selectedToClose()
    {
        self.navigationController?.popViewController(animated: false)
    }
    
    
    /*
     *观察者的监听方法
     */
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        
        if keyPath == "estimatedProgress"
        {
            print(self.progress.progress)
            self.progress.alpha = 1.0
            self.progress .setProgress(Float(self.wkWebview.estimatedProgress), animated: true)
            if self.wkWebview.estimatedProgress >= 1
            {
                UIView.animate(withDuration: 1.0, animations: {
                    self.progress.alpha = 0
                }, completion: { (finished) in
                    self.progress .setProgress(0.0, animated: false)
                })
            }
        }
        else if keyPath == "title"
        {
            self.navigationItem.title = self.wkWebview.title
        }
        else if keyPath == "canGoBack"
        {
            if self.wkWebview.canGoBack == true
            {
                let items = [self.negativeSpacer,self.leftBarButton,self.leftBarButtonSecond]
                self.navigationItem.leftBarButtonItems = items as? [UIBarButtonItem]
            }
            else
            {
                let items = [self.negativeSpacer,self.leftBarButton]
                self.navigationItem.leftBarButtonItems = items as? [UIBarButtonItem]
            }
        }
        else
        {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        ///偏好设置
        //let preferences = WKPreferences()
        //preferences.javaScriptEnabled = true

        //let configuration = WKWebViewConfiguration()
        //configuration.preferences = preferences
        //configuration.selectionGranularity = WKSelectionGranularity.character
        //configuration.userContentController = WKUserContentController()
        // 给webview与swift交互起名字，webview给swift发消息的时候会用到
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "exitApp")
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "downMap")
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "finishActivity")
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "showToast")
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "callIos")
        wkWebview.configuration.userContentController.add(WeakScriptMessageDelegate.init(self), name: "drawMap")
        
    }
    //退出登录
    func exitApp() {
    }
    //下载地图
    func downMap() {
       
    }
    //结束webview
    func finishActivity() {
        print("结束当前页面")
        self.navigationController?.popViewController(animated: true)
       
    }
    //显示提示
    func showToast() {
        
    }
    //调用打电话功能
    func callIos() {
        
    }
    //画地图
    func drawMap() {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension WKWebviewController: WKScriptMessageHandler{
    ///接收js调用方法
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        ///message.name是约定好的方法名,message.body是携带的参数
        switch message.name {
        case "exitApp":
            exitApp()
        case "downMap":
            downMap()
        case "finishActivity":
            finishActivity()
        case "callIos":
            callIos()
        case "drawMap":
            drawMap()
        case "showToast":
            showToast()
            
        default:
            break
        }
    }
}


///内存管理,使用delegate类防止ViewController不释放
class WeakScriptMessageDelegate: NSObject, WKScriptMessageHandler {
    weak var scriptDelegate: WKScriptMessageHandler?
    init(_ scriptDelegate: WKScriptMessageHandler) {
        self.scriptDelegate = scriptDelegate
        super.init()
    }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        scriptDelegate?.userContentController(userContentController, didReceive: message)
    }
    deinit {
        print("WeakScriptMessageDelegate is deinit")
    }
}
