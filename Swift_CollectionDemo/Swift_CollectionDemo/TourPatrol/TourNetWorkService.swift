//
//  TourNetWorkService.swift
//  helloIOSMobile
//
//  Created by 马腾斌 on 2020/3/9.
//  Copyright © 2020 multisim. All rights reserved.
//

import Foundation
import Moya

protocol TourNetworkable {
    var provider: MoyaProvider<TourApi> { get }
    func getTourPatrolByLogin(adCode:String,userID:String,completion:@escaping(PatrolStatisticsResult)-> ())
    func startPatrol(RiverPatrolParam:RiverPatrolParam, completion: @escaping(ResultEndPatrolBean)->())
    func endPatrol(RiverPatrolParam: RiverPatrolParam, completion: @escaping(ResultEndPatrolBean)->())
    func getTourHistory(gmCode:String, completion: @escaping(ResultTourHistory)->())
    func getValidTourHistory(gmCode:String, completion: @escaping(ResultPatrolHistoryBean)->())
    func getStaticQuestion(completion: @escaping(ResultStaticQuestion)->())
    func getRiverCoordinate(objCode:String, completion: @escaping (ResultOfRiverCoordinate) -> ())
    
}


struct TourNetWorkService: TourNetworkable {
    
    var provider = MoyaProvider<TourApi>()
    
    func getTourPatrolByLogin(adCode:String,userID:String, completion: @escaping (PatrolStatisticsResult) -> ()) {
        provider.request(.getTourPatrolByLogin(adCode:adCode,userID:userID)){result in
            switch result{
            case let .success(moyaResponse):
                do {
                    let response = try JSONDecoder().decode(PatrolStatisticsResult.self, from: moyaResponse.data)
                    completion(response)
                    
                    if response.flag {
                        
                        let riverPatrolPlan = """
                        本年度计划巡河\(response.data.planCount!)次
                        已经巡河\(response.data.tourCount!)次
                        巡河完成率\(response.data.tourProbability!)
                        """
                    }
                    
                }catch{
                    print(error)
                }
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    
    func startPatrol(RiverPatrolParam:RiverPatrolParam, completion: @escaping (ResultEndPatrolBean) -> ()) {
        provider.request(.startPatrol(RiverPatrolParam: RiverPatrolParam)) { result in
            switch result {
            case let .success(moyaResponse):
                //                API 作为根元素返回数组 [UsrBalance].self
                
                
                do {
                    let response = try JSONDecoder().decode(ResultEndPatrolBean.self, from: moyaResponse.data)
                    completion(response)
                    
                    
                }catch{
                    print(error)
                }
                
//                let data = moyaResponse.data
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
//                } catch {
//                    print("faith")
//                }
                
                
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    
    func endPatrol(RiverPatrolParam: RiverPatrolParam, completion: @escaping (ResultEndPatrolBean) -> ()) {
        provider.request(.endPatrol(RiverPatrolParam: RiverPatrolParam)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try JSONDecoder().decode(ResultEndPatrolBean.self, from: moyaResponse.data)
                    
                }catch{
                    print(error)
                    
                }
                   
            //completion(response)
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    func getTourHistory(gmCode:String, completion: @escaping (ResultTourHistory) -> ()) {
        provider.request(.getTourHistory(gmCode: gmCode)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try JSONDecoder().decode(ResultTourHistory.self, from: moyaResponse.data)
                    completion(response)
                }catch{
                    print(error)
                }
            //completion(response)
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    func getValidTourHistory(gmCode:String, completion: @escaping (ResultPatrolHistoryBean) -> ()) {
        provider.request(.getValidTourHistory(gmCode: gmCode)) { result in
            switch result {
            case let .success(moyaResponse):
                
                let response = try? JSONDecoder().decode(ResultPatrolHistoryBean.self, from: moyaResponse.data)
                
            //completion(response)
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    func getStaticQuestion(completion: @escaping (ResultStaticQuestion) -> ()) {
        provider.request(.getStaticQuestion) { result in
            switch result {
            case let .success(moyaResponse):
                
                let response = try? JSONDecoder().decode(ResultStaticQuestion.self, from: moyaResponse.data)
                
            //completion(response)
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
    
    func getRiverCoordinate(objCode:String, completion: @escaping (ResultOfRiverCoordinate) -> ()) {
        provider.request(.getRiverCoordinate(objCode: objCode)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let response = try JSONDecoder().decode(ResultOfRiverCoordinate.self, from: moyaResponse.data)
                    completion(response)
                }catch{
                    print(error)
                }
                
                let data = moyaResponse.data
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                } catch {
                    print("faith")
                }
                
            case let .failure(error):
                print("error = \(error.localizedDescription)")
            }
        }
    }
}
