//
//  UserInfo+CoreDataProperties.swift
//  Swift_CoreData
//
//  Created by baixue on 2020/4/24.
//  Copyright © 2020 白雪. All rights reserved.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userID: String?

}
