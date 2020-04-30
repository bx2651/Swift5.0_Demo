//
//  ViewController.swift
//  YYCollectionView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit

let ScreenWidth  = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class HistoryViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate{
    var collectionView : UICollectionView?
    let Identifier       = "CollectionViewCell"
    let headerIdentifier = "CollectionHeaderView"
    let footIdentifier   = "CollectionFootView"

    var a = 0
    var historyData : TourHistoryInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "历史巡河记录"
        self.view.backgroundColor = UIColor.white
        // 初始化
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: ScreenWidth-20, height: 180)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: ScreenWidth, height: 150)
        layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)

        collectionView = UICollectionView.init(frame: CGRect(x:0, y:64, width:ScreenWidth, height:ScreenHeight), collectionViewLayout: layout)
        collectionView?.backgroundColor = UIColor.systemGray5
        collectionView?.delegate = self
        collectionView?.dataSource = self
        self.view.addSubview(collectionView!)
        
        // 注册cell
        collectionView?.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Identifier)
        // 注册headerView
        collectionView?.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // 注册footView
        collectionView?.register(CollectionFootView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier)
   
    }

//    //header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 150)
    }
    //footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 80)
    }

    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {        
        if kind == UICollectionView.elementKindSectionHeader{
            let headerView : CollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! CollectionHeaderView
            headerView.view.backgroundColor = UIColor.systemBlue
            headerView.currentTime.text = "本月巡河5次，1.2km"
            headerView.historyTime.text = "总巡河次数：14次"
            return headerView
        }else{
            let footView : CollectionFootView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier, for: indexPath) as! CollectionFootView
            footView.view.backgroundColor = UIColor.white
            footView.label.text = "滑到底啦~"
            return footView
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! CollectionViewCell
//        cell.bgView.backgroundColor = armColor()
        cell.bgView.backgroundColor = UIColor.white
//        cell.commitFrequency.text = String(format:"%ditem",indexPath.row)
//        cell.commitFrequency.text = " \(historyData?.data.list[a].reportCount ?? "0") 次"
//        
//        cell.patrolDistance.text = " \(historyData?.data.list[a].instence ?? "0") 米"
//        cell.patrolTime.text = historyData?.data.list[a].timeLen
//        cell.riverName.text = historyData?.data.list[a].objName
//        cell.date.text = historyData?.data.list[a].startDate
//        if a < (historyData?.data.list.count)!-1 {
//            a += 1
//        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      print(indexPath.row)
    }

    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

