//
//  Clock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/18/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

//now is the current date
var now = Date()

class Clock {
    //date is generated from user via date and time pickers
    var date: Date
    init(date: Date) {
        self.date = date
    }
    
    //totalSeconds is the standard unit of clock conversion
    func totalSeconds (date:Date) -> Double {
        let totalSeconds = now.timeIntervalSince(date)
        return totalSeconds
    }
}

//StandardClock included built-in Apple Methods for the standard units of time
class StandardClock : Clock {
        
    //returns total units in time interval as Date Component (reads like an Int)
    func totalUnits (date: Date, unit: Calendar.Component) -> DateComponents {
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
        case .month: divisor = 2592000
        case .year: divisor = 31536000
        default: divisor = 1
        }
        return divisor
        }
    
    //converts units from components into double
    func units (date: Date, unit: Calendar.Component) -> Double {
        var totalUnits = self.totalUnits(date: date, unit: unit)
        var units: Double
        switch unit {
        case .minute: units = Double(Int(totalUnits.minute!))
        case .hour: units = Double(Int(totalUnits.hour!))
        case .day: units = Double(Int(totalUnits.day!))
        case .weekOfYear: units = Double(Int(totalUnits.weekOfYear!))
        case .month: units = Double(Int(totalUnits.month!))
        case .year: units = Double(Int(totalUnits.year!))
        default: units = 0
        }
        return units
    }
    
    //converts units into decimal representation for display
    func decimalValue (date: Date, unit: Calendar.Component) -> Double {
        let units = self.units(date: date, unit: unit)
        let totalSeconds = self.totalSeconds(date: date)
        let divisor = self.divisor(unit: unit)
        let transferSeconds = totalSeconds - units*divisor
        let remainderUnits = transferSeconds/divisor
        let decimalValue = units + remainderUnits
        return decimalValue
    }
    
    //Provides Clock Label
    func label (unit: Calendar.Component) -> String {
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
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = self.decimalPlaces(unit: unit)
        numberFormatter.minimumFractionDigits = self.decimalPlaces(unit: unit)
        let decimalValue = self.decimalValue(date: date, unit: unit)
        let display = numberFormatter.string(from: NSNumber(value: decimalValue))
        return display!
    }
    
}

class PlanetaryClock: Clock {
    
    //Planet Orbits in Number of Seconds
    func planetOrbitSeconds (date: Date, planet: String) -> Double {
        var orbit: Double
            switch planet {
            case "Mercury": orbit = 7603200
            case "Venus": orbit = 19414080
            case "Mars": orbit = 59356800
            case "Jupiter": orbit = 374198400
            case "Saturn": orbit = 928540800
            case "Uranus": orbit = 2642889600
            case "Neptune": orbit = 5166720000
            case "Pluto": orbit = 7824384000
            default: orbit = 31536000 //This is Earth
            }
            return orbit
        }
    
    // Converts to Age (in Years) on Planet
    func ageOnPlanet (date: Date, planet: String) -> Double {
        let earthSeconds = self.totalSeconds(date: date)
        let planetOrbit = planetOrbitSeconds(date: date, planet: planet)
        return earthSeconds/planetOrbit
    }
    
    // determines number of decimal places so clock visually updates every tenth of a second
    func decimalPlacesAge (planet: String) -> Int {
        var decimalPlaces: Int
        switch planet {
        case "Mercury": decimalPlaces = 8
        case "Venus": decimalPlaces = 9
        case "Mars": decimalPlaces = 9
        case "Jupiter": decimalPlaces = 10
        case "Saturn": decimalPlaces = 10
        case "Uranus": decimalPlaces = 11
        case "Neptune": decimalPlaces = 11
        case "Pluto": decimalPlaces = 11
        default: decimalPlaces = 9 //This is Earth
        }
        return decimalPlaces
    }
    
    // Planet Rotations in Seconds
    func planetRotations (date: Date, planet: String) -> Double {
        var rotation: Double
        switch planet {
        case "Mercury": rotation = 5068800
        case "Venus": rotation = 20995200
        case "Mars": rotation = 90000
        case "Jupiter": rotation = 36000
        case "Saturn": rotation = 39600
        case "Uranus": rotation = 61200
        case "Neptune": rotation = 57600
        case "Pluto": rotation = 550800
        default: rotation = 31536000 //This is Earth
        }
        return rotation
    }
    
    func daysOnPlanet (date: Date, planet: String) -> Double {
        let earthSeconds = self.totalSeconds(date: date)
        let planetRotations = self.planetRotations(date: date, planet: planet)
        return earthSeconds/planetRotations
    }
}

