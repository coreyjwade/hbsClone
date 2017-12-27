//
//  PlanetClock.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/21/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import Foundation

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto
}

class PlanetClock: DecimalClock {
    
    override init(date: Date) {
        super.init(date: date)
    }
    
    //Planet Orbits in Number of Seconds
    private func planetOrbitSeconds (date: Date, planet: Planet) -> Double {
        var orbit: Double
        switch planet {
        case .mercury: orbit = 7603200
        case .venus: orbit = 19414080
        case .mars: orbit = 59356800
        case .jupiter: orbit = 374198400
        case .saturn: orbit = 928540800
        case .uranus: orbit = 2642889600
        case .neptune: orbit = 5166720000
        case .pluto: orbit = 7824384000
        case .earth: orbit = 31536000
        }
        return orbit
    }
    
    // Converts to Age (in Years) on Planet
    func ageOnPlanet (date: Date, planet: Planet) -> Double {
        let earthSeconds = self.totalSeconds(date: date)
        let planetOrbit = planetOrbitSeconds(date: date, planet: planet)
        return earthSeconds / planetOrbit
    }
    
    // determines number of decimal places so clock visually updates every tenth of a second
    func decimalPlacesAge (planet: Planet) -> Int {
        var decimalPlaces: Int
        switch planet {
        case .mercury: decimalPlaces = 8
        case .venus: decimalPlaces = 9
        case .mars: decimalPlaces = 9
        case .jupiter: decimalPlaces = 10
        case .saturn: decimalPlaces = 10
        case .uranus: decimalPlaces = 11
        case .neptune: decimalPlaces = 11
        case .pluto: decimalPlaces = 11
        case .earth: decimalPlaces = 9
        }
        return decimalPlaces
    }
    
    // Planet Rotations in Seconds
    func planetRotations (date: Date, planet: Planet) -> Double {
        var rotation: Double
        switch planet {
        case .mercury: rotation = 5068800
        case .venus: rotation = 20995200
        case .mars: rotation = 90000
        case .jupiter: rotation = 36000
        case .saturn: rotation = 39600
        case .uranus: rotation = 61200
        case .neptune: rotation = 57600
        case .pluto: rotation = 550800
        case .earth: rotation = 31536000
        }
        return rotation
    }
    
    func daysOnPlanet (date: Date, planet: Planet) -> Double {
        let earthSeconds = self.totalSeconds(date: date)
        let planetRotations = self.planetRotations(date: date, planet: planet)
        return earthSeconds/planetRotations
    }
    
    // determines number of decimal places so clock visually updates every tenth of a second
    func decimalPlacesDays (planet: Planet) -> Int {
        var decimalPlaces: Int
        switch planet {
        case .mercury: decimalPlaces = 8
        case .venus: decimalPlaces = 9
        case .mars: decimalPlaces = 9
        case .jupiter: decimalPlaces = 10
        case .saturn: decimalPlaces = 10
        case .uranus: decimalPlaces = 11
        case .neptune: decimalPlaces = 11
        case .pluto: decimalPlaces = 11
        case .earth: decimalPlaces = 9
        }
        return decimalPlaces
    }
    
    func planetLabels(planet: Planet) -> String {
        var label: String
        switch planet {
        case .mercury: label = "Age on Mercury"
        case .venus: label = "Age on Venus"
        case .mars: label = "Age on Mars"
        case .jupiter: label = "Age on Jupiter"
        case .saturn: label = "Age on Saturn"
        case .uranus: label = "Age on Uranus"
        case .neptune: label = "Age on Neptune"
        case .pluto: label = "Age on Pluto"
        case .earth: label = "Age on Earth"
        }
        return label
    }
    
    func numberFormatterYears (date: Date, planet: Planet) -> String {
        numberFormatter.maximumFractionDigits = self.decimalPlacesAge(planet: planet)
        numberFormatter.minimumFractionDigits = self.decimalPlacesAge(planet: planet)
        let display = numberFormatter.string(from: NSNumber(value: ageOnPlanet(date: date, planet: planet)))
        return display!
    }
    
    func numberFormatterDays (date: Date, planet: Planet) -> String {
        numberFormatter.maximumFractionDigits = self.decimalPlacesAge(planet: planet)
        numberFormatter.minimumFractionDigits = self.decimalPlacesAge(planet: planet)
        let display = numberFormatter.string(from: NSNumber(value: daysOnPlanet(date: date, planet: planet)))
        return display!
    }
}
