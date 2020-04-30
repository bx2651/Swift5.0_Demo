//
//  ResultList.swift
//  helloIOSMobile
//
//  Created by baixue on 2020/3/8.
//  Copyright © 2020 multisim. All rights reserved.
//

import Foundation
struct ResultList<T:Codable> :Codable {
    let list:[T]
}
