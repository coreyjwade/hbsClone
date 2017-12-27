//
//  StandardClock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/21/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

//StandardClock contains built-in Apple Methods for standard units of time
class StandardClock : DecimalClock {
    
    override init(date: Date) {
        super.init(date: date)
    }
    
    //returns total units in time interval as Date Component (reads like an Int)
    func totalUnits (date: Date, unit: Calendar.Component) -> DateComponents {
        let now = Date()
        let totalUnits = Calendar.current.dateComponents([unit], from: date, to: now)
        return totalUnits
    }
    
    //determines number of decimal places so clock visually updates every tenth of a second
    func decimalPlaces (unit: Calendar.Component) -> Int {
        var decimalPlaces: Int
        switch unit {
        case .second: decimalPlaces = 1
        case .minute: decimalPlaces = 3
        case .hour: decimalPlaces = 5
        case .day: decimalPlaces = 6
        case .weekOfYear: decimalPlaces = 7
        case .month: decimalPlaces = 8
        case .year: decimalPlaces = 9
        default: decimalPlaces = 0
        }
        return decimalPlaces
    }
    
    //determines remainder for decimal conversion
    func divisor (unit: Calendar.Component) -> Double {
        var divisor: Double
        switch unit {
        case .minute: divisor = 60
        case .hour: divisor = 3600
        case .day: divisor = 86400
        case .weekOfYear: divisor = 604800
        case .month: divisor = 2592000 //must be fixed
        case .year: divisor = 31536000 //must be fixed
        default: divisor = 1
        }
        return divisor
    }
    
    //converts units from components into double
    func units (date: Date, unit: Calendar.Component) -> Double {
        var totalUnits = self.totalUnits(date: date, unit: unit)
        var units: Double
        switch unit {
        case .minute: units = Double(totalUnits.minute!)
        case .hour: units = Double(totalUnits.hour!)
        case .day: units = Double(totalUnits.day!)
        case .weekOfYear: units = Double(totalUnits.weekOfYear!)
        case .month: units = Double(totalUnits.month!)
        case .year: units = Double(totalUnits.year!)
        default: units = 0
        }
        return units
    }
    
    //converts units into decimal representation for display
    func decimalValue(date: Date, unit: Calendar.Component) -> Double {
        let units = self.units(date: date, unit: unit)
        let totalSeconds = self.totalSeconds(date: date)
        let divisor = self.divisor(unit: unit)
        let transferSeconds = totalSeconds - units * divisor
        let remainderUnits = transferSeconds / divisor
        let decimalValue = units + remainderUnits
        return decimalValue
    }
    
    //Provides Clock Label
    func label(unit: Calendar.Component) -> String {
        var label: String
        switch unit {
        case .second: label = "Earth Seconds"
        case .minute: label = "Earth Minutes"
        case .hour: label = "Earth Hours"
        case .day: label = "Earth Days"
        case .weekOfYear: label = "Earth Weeks"
        case .month: label = "Earth Months"
        case .year: label = "Earth Years"
        default: label = ""
        }
        return label
    }
    
    func numberFormatter (date: Date, unit: Calendar.Component) -> String {
        numberFormatter.maximumFractionDigits = self.decimalPlaces(unit: unit)
        numberFormatter.minimumFractionDigits = self.decimalPlaces(unit: unit)
        let decimalValue = self.decimalValue(date: date, unit: unit)
        let display = numberFormatter.string(from: NSNumber(value: decimalValue))
        return display!
    }
}

