//
//  Clock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/18/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

class Clock {
    var userDate = Date()
    var now = Date()
    func seconds() -> float {
        return now.timeIntervalSince(userDate)
    }
}
