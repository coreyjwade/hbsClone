//
//  DecimalClock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/21/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

//For clocks with decimal representation
//Provides decimal-style number formatter
class DecimalClock: Clock {
    
    //number formatter gets the clocks in the right decimal formation
    let numberFormatter = NumberFormatter()
    
    override init(date: Date) {
        super.init(date: date)
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
    }
}
