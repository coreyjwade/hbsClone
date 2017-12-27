//
//  Clock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/18/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

class Clock {
    //date is generated from user via date and time pickers
    var date: Date
    init(date: Date) {
        self.date = date
    }
    
    //totalSeconds is the standard unit of clock conversion
    func totalSeconds (date:Date) -> Double {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(date)
        return totalSeconds
    }
}

