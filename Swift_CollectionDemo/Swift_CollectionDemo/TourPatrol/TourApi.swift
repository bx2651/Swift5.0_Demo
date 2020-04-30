//
//  TourApi.swift
//  helloIOSMobile
//
//  Created by 马腾斌 on 2020/3/9.
//  Copyright © 2020 multisim. All rights reserved.
//

import Foundation
import Moya

enum TourApi {
    case getTourPatrolByLogin(adCode:String,userID:String)
    case startPatrol(RiverPatrolParam:RiverPatrolParam)//开始巡河
    case endPatrol(RiverPatrolParam: RiverPatrolParam)//结束巡河
    case getTourHistory(gmCode:String)//历史巡河记录
    case getValidTourHistory(gmCode:String)//有效巡河记录
    case getStaticQuestion
    case getRiverCoordinate(objCode:String)
    
    
    
}

extension TourApi: TargetType {
    var baseURL: URL {
        switch self {
        case .getRiverCoordinate(_):
            return URL(string: "http://hzz.mwr.gov.cn/")!
        default:
            return URL(string: "http://120.79.68.120:8888/")!
        }
        
    }
    
    var path: String {
        switch self {
        case let .getTourPatrolByLogin(adCode,userID):
            return "api/gm/tour/getInfoByLoginEnd"
//            return "api/gm/tour/getInfoByLoginend/"+userID+"/"+adCode
        case .startPatrol(_):
            return "api/gm/tour/add"
        case .endPatrol(_):
            return "api/gm/tour/update"
        case .getTourHistory(_):
            return "api/tour/statis/getTourHistory"
        case .getValidTourHistory(_):
            return "api/tour/statis/getValidTourHistory"
        case .getStaticQuestion:
            return "api/tour/statis/getQuestionInfo"
        case let .getRiverCoordinate(_):
            return "gmr/hh/rv/rea/queryGeo"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .getTourPatrolByLogin,
             .getTourHistory,
             .getValidTourHistory,
             .getRiverCoordinate,
             .getStaticQuestion:
            return .get
        case .startPatrol,.endPatrol:
            return .post
            
        }
        
    }
    
    var headers: [String: String]? {
        //        RequestBody
        return ["Content-Type": "application/json"]
    }
    
    
    var parameters:[String:Any]?{
        switch self {
        case .getTourPatrolByLogin(let adCode,let userID):
            return ["adCode":adCode,
                    "userId":userID]
        case .getTourHistory(let gmCode),
             .getValidTourHistory(let gmCode):
            return ["gmCode":gmCode]
        case .startPatrol(let RiverPatrolParam):
            return ["gmCode": RiverPatrolParam.gmCode,
                  "objCode": RiverPatrolParam.objCode,
                  "objType": RiverPatrolParam.objType,
                  "startDate": RiverPatrolParam.startDate,
                  "adCode": RiverPatrolParam.adCode,
                  "tourLong": RiverPatrolParam.tourLong,
                  "tourLat": RiverPatrolParam.tourLat]
        case .endPatrol(let RiverPatrolParam):
            return ["gmCode": RiverPatrolParam.gmCode,
                    "objCode":RiverPatrolParam.objCode,
                "objType": RiverPatrolParam.objType,
                "startDate": RiverPatrolParam.startDate,
                "adCode": RiverPatrolParam.adCode,
                "tourLong": RiverPatrolParam.tourLong,
                "tourLat": RiverPatrolParam.tourLat,
                "endDate":RiverPatrolParam.endDate,
                "instence":RiverPatrolParam.instence,
                "timeLen":RiverPatrolParam.timeLen,
                "reportCount":RiverPatrolParam.reportCount,
                "id":RiverPatrolParam.id,
                "tourGeo":RiverPatrolParam.tourGeo,
                "tourState":RiverPatrolParam.tourState,
                "isValid":RiverPatrolParam.isValid]
        case let .getRiverCoordinate(objCode):
            return ["k":"98508982973AAAAFE053BD00010AE866",
                "area":"450100000000",
                "objCode":objCode]
        default :
            return [:]
            
        }
    }
    
    
    
    var task: Task {
        
        switch self {
        case let .getTourPatrolByLogin(adCode,userID):
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        case .startPatrol,.endPatrol:
            return .requestParameters(parameters: parameters ?? [:], encoding: JSONEncoding.default)
        case .getTourHistory,
        .getValidTourHistory,
        .getStaticQuestion:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.queryString)
        case .getRiverCoordinate:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
