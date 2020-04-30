//
//  CollectionHeaderView.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    var view = UIView()
    var currentTime = UILabel()
    var historyTime = UILabel()
    var headerImg = UIImageView(image: UIImage(named: "head_img"))
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = UIView.init(frame: CGRect(x:0,y:0, width:self.frame.size.width, height:self.frame.size.height))
        self.addSubview(view)
        
        self.headerImg.frame = CGRect(x:30,y:50, width:80, height:80)
        self.addSubview(headerImg)
        
        self.currentTime = UILabel.init(frame: CGRect(x:130, y: -10, width:200, height:self.frame.size.height))
        self.addSubview(currentTime)
        
        self.historyTime = UILabel.init(frame: CGRect(x:130, y: 30, width:200, height:self.frame.size.height))
        self.addSubview(historyTime)
    }
}
