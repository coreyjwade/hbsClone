//
//  SaturnViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class SaturnViewController: UIViewController {
    
    @IBOutlet weak var saturnLabel: UILabel!
    
var userDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageSaturn = totalSeconds/928540800
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 10
        numberFormatter.minimumFractionDigits = 10
        
        let displaySaturn = numberFormatter.string(from: NSNumber(value:ageSaturn))
        saturnLabel.text = displaySaturn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "uranus" {
            let segueController = segue.destination as! UranusViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "jupiter"{
            let segueController = segue.destination as! JupiterViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! WeeksViewController
            segueController.userDate = userDate
        }
    }
}

