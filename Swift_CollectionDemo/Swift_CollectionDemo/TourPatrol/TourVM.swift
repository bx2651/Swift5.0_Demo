//
//  TourVM.swift
//  Ganymede
//
//  Created by multisim on 2020/3/15.
//  Copyright © 2020 multisim. All rights reserved.
//

import UIKit



protocol TourViewModelDelegate: class {
    func isDataLoading(_ loading: Bool)
    func didReceiveStartPatrolResult(_ result: ResultEndPatrolBean)
    func didReceiveEndPatrolResult(_ result: ResultEndPatrolBean)
    func didReceiveTourPatrolInfo(_ result: PatrolStatisticsResult)
    func didReceiveRiverSpaceCoordinate(_ result : ResultOfRiverCoordinate)
    func didReceiveTourHistory(_ result : ResultTourHistory)
}


class TourVM{
    
    weak var delegate: TourViewModelDelegate?
    private var currentSearchNetworkTask: URLSessionDataTask?
    private let netService = TourNetWorkService()
    
    init() {}
    
    func TourPatrolInfoByLogin(adCode : String , userID : String) {
        currentSearchNetworkTask?.cancel()
        delegate?.isDataLoading(true)
        netService.getTourPatrolByLogin(adCode : adCode , userID: userID){
            [weak self] result in
            guard let sSelf = self else {return}
            sSelf.delegate?.didReceiveTourPatrolInfo(result)
        }
    }
    
    func polyRiverLine(objCode:String){
        currentSearchNetworkTask?.cancel()
        delegate?.isDataLoading(true)
        netService.getRiverCoordinate(objCode: objCode){
            [weak self] result in
            guard let sSelf = self else {return}
            sSelf.delegate?.didReceiveRiverSpaceCoordinate(result)
        }
    }
    
    func startPatrol(RiverPatrolParam : RiverPatrolParam) {
        currentSearchNetworkTask?.cancel()
        delegate?.isDataLoading(true)
        netService.startPatrol(RiverPatrolParam : RiverPatrolParam){
            [weak self] result in
            guard let sSelf = self else {return}
            sSelf.delegate?.didReceiveStartPatrolResult(result)
        }
    }
    
    
    func endPatrol(RiverPatrolParam : RiverPatrolParam) {
        currentSearchNetworkTask?.cancel()
        delegate?.isDataLoading(true)
        netService.endPatrol(RiverPatrolParam : RiverPatrolParam){
            [weak self] result in
            guard let sSelf = self else {return}
            sSelf.delegate?.didReceiveEndPatrolResult(result)
        }
    }
    
    func getTourHistory(gmCode:String){
        currentSearchNetworkTask?.cancel()
        delegate?.isDataLoading(true)
        netService.getTourHistory(gmCode: gmCode){
            [weak self] result in
            print("============")
            guard let sSelf = self else {return}
            sSelf.delegate?.didReceiveTourHistory(result)
        }
    }
    
}
