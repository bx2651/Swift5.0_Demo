//
//  CollectionViewCell.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var riverName: UILabel!
    @IBOutlet weak var patrolTime: UILabel!
    @IBOutlet weak var patrolDistance: UILabel!
    @IBOutlet weak var commitFrequency: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var historyData : TourHistoryInfo? {
        didSet {
            guard let historyData = historyData else { return }
            
            riverName.text = "ceshi"
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
}
