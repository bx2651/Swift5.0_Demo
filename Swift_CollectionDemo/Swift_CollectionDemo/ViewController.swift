//
//  ViewController.swift
//  Swift_CollectionDemo
//
//  Created by baixue on 2020/3/30.
//  Copyright © 2020 白雪. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TourViewModelDelegate {
    func isDataLoading(_ loading: Bool) {
        
    }
    
    func didReceiveStartPatrolResult(_ result: ResultEndPatrolBean) {
        
    }
    
    func didReceiveEndPatrolResult(_ result: ResultEndPatrolBean) {
        
    }
    
    func didReceiveTourPatrolInfo(_ result: PatrolStatisticsResult) {
        
    }
    
    func didReceiveRiverSpaceCoordinate(_ result: ResultOfRiverCoordinate) {
        
    }
    
    func didReceiveTourHistory(_ result: ResultTourHistory) {
        let view = HistoryViewController()
        view.historyData = result.data.list[0]
        navigationController?.pushViewController(view, animated: true)
    }
    
    func getHistory(){
        TourHistoryVM = TourVM()
        TourHistoryVM?.delegate = self
        TourHistoryVM?.getTourHistory(gmCode: "450100000005")
    }

    private var TourHistoryVM : TourVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick(_ sender: Any) {
        getHistory()
    }
    

}
