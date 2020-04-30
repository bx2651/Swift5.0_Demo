//
//  TourPatrol.swift
//  helloIOSMobile
//
//  Created by 马腾斌 on 2020/3/9.
//  Copyright © 2020 multisim. All rights reserved.
//

import Foundation

/**
 ----------------------------------------返回值--------------------------------------------
 */
//登陆返回个人巡河总览
struct ResultPatrolStatistics:Codable {
    let data:PatrolStatistics
}
struct ResultEndPatrolBean:Codable {
    let data:RiverPatrolParam
}
struct ResultPatrolHistoryBean:Codable {
    let data:ResultList<PatrolHistoryBean>
}
struct ResultTourHistory:Codable {
    let data : ResultList<TourHistoryInfo>

}
//获取巡河上报问题常量表信息
struct ResultStaticQuestion:Codable {
    let list:ResultList<StaticQuestionBean>
}

/**
----------------------------------------参数--------------------------------------------
*/

//巡河上传参数
struct RiverPatrolParam:Codable {
    let gmCode:String?
    let objCode:String?
    let objType:String?
    let startDate:String?
    let endDate:String?
    let adCode:String?
    let tourLong:Double?//经度
    let tourLat:Double?//纬度
    let timeLen:String?//巡河时长
    let instence:String?//巡河距离
    let reportCount:String?//举报问题数量
    let tourGeo:String?
    let tourState:String? //更新巡河 传 1（可不传）  结束了巡河 传 2
    let id:String?  //巡河的id
    let isValid:String?// 巡河是否有效 1有效 0 无效
}
/**
----------------------------------------实体--------------------------------------------
*/
//登陆返回巡河总览
struct PatrolStatisticsResult : Codable{
    let data : PatrolStatistics
    let flag : Bool
//    let code : Int
//    let msg : String
}

struct PatrolStatistics :Codable{
    let planCount:String?//计划巡河数
    let tourProbability:String?//巡河率
    let isComplete:String?
    let tourCount:String?//巡河次数
}

struct EndPatrolBean:Codable {
    let endDate:String
    let gmCode:String
    let objCode:String
    let objType:String
    let startDate:String
    let tourGeo:String
    let tourState:String //更新巡河 传 1（可不传）  结束了巡河 传 2
    let id:String  //巡河的id
    let tourLong:Double//经度
    let tourLat:Double //纬度
    let timeLen:String//巡河时长
    let instence:String//巡河距离
    let reportCount:String//举报问题数量
    let adCode:String
    let isValid:String// 巡河是否有效 1有效 0 无效
}

struct PatrolHistoryBean:Codable{
    let total:Int
    let pageNum:Int
    let pageSize:Int
    let size:Int
    let startRow:Int
    let endRow:Int
    let pages:Int
    let prePage:Int
    let nextPage:Int
    let isFirstPage:Bool
    let isLastPage:Bool
    let tothasPreviousPageal:Bool
    let hasNextPage:Bool
    let navigatePages:Int
    let navigateFirstPage:Int
    let navigateLastPage:Int
    let list:ListBean
    let navigatepageNums:[Int]
}
struct ListBean:Codable {
    let gmCode:String
    let objType:String
    let objCode:String
    let startDate:String
    let endDate:String
    let note:String
    let effDate:String
    let exprDate:String
    let id:String
    let tourGeo:String
    let attRvBase:AttRvBaseBean
    let tourState:String
    let instence:String
    let adCode:String
    let timeLen:String
    let reportCount:String
}
struct AttRvBaseBean:Codable {
    let rvCode:String
    let rvName:String
    let reaName:String
    let rvSourLong:String
    let rvSourLat:String
    let rvMouLong:String
    let rvMouLat:String
    let crOverType:String
    let flowArea:String
    let rvType:String
    let rvGrad:String
    let bank:String
    let rvLen:String
    let rvBasArea:String
    let lonAverAnnFlow:String
    let averSlop:String
    let note:String
    let effDate:String
    let exprDate:String
    let lastrivercode:String
    let lastrivername:String
}

struct TourHistoryInfo : Codable{
    let startDate : String
    let endDate : String?
    let tourGeo : String?
    let attRvBase : TourHistoryDetail?
    let isValid : String
    let objName : String?
    let timeLen : String?
    let instence : String?
    let reportCount : String?
}

struct TourHistoryDetail : Codable {
    let reaName : String?
}

struct StaticQuestionBean:Codable {
    let id:String
    let name:String
}

//获取河流的空间地理信息
//struct ResultOfRiverCoordinate : Codable {
//    let data:ResultList<Coordinates>
//    let msg : String
//}
//
//struct Coordinates : Codable{
//    let geo : String?
//
//}
struct ResultOfRiverCoordinate : Codable {
    let data:[RiverCoordinate]?
    let msg : String
}

struct RiverCoordinate: Codable {
    let geo : Coordinates?
    let objCode : String?
}
struct Coordinates : Codable{
    let coordinates : Array<Array<Double>>?
}
