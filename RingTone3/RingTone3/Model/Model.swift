//
//  Model.swift
//  RingTone3
//
//  Created by Cuong on 7/26/19.
//  Copyright © 2019 Cuong. All rights reserved.
//

import UIKit

struct RingToneModel : Codable {
    var id: Int
    var title: String
    var genre: String
    var artist: String
    var duration: TimeInterval
    var rate: Double
    var filename: String
}
