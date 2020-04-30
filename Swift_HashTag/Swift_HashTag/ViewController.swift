//
//  ViewController.swift
//  Swift_HashTag
//
//  Created by baixue on 2020/3/21.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController , SwifthashtagDelegate {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHashTags()
    }


    func setupHashTags() {
        let eventName = ["百度","谷歌","网易","腾讯","阿里巴巴","这些都是我想去的公司啊啊啊"]
        var hashtags: [SwiftHashTags] = []
        for index in 0..<eventName.count{
            let hashtag = SwiftHashTags(title: eventName[index], id: index)
            hashtags.append(hashtag)
        }
        let swifthashtags = SwiftHashTagsView()
        swifthashtags.swifthashtagDelegate = self
        swifthashtags.frame = CGRect(x: 10, y: 100, width: UIScreen.main.bounds.width - 20, height: 300)
        swifthashtags.setHashTags(with: hashtags)
        view.addSubview(swifthashtags)

    }
    
    func selectedHashTag(title: String, id: Int) {
        print("id",id)
        print("title",title)
    }
    
    func unselectedHashTag(title: String, id: Int) {
        print("id",id)
        print("title",title)
    }
}

