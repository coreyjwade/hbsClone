
//
//  VenusViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class VenusViewController: UIViewController {
var userDate = Date()
    
    @IBOutlet weak var venusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageVenus = totalSeconds/19414080
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 9
        numberFormatter.minimumFractionDigits = 9
        
        let displayVenus = numberFormatter.string(from: NSNumber(value:ageVenus))
        venusLabel.text = displayVenus
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mars" {
            let segueController = segue.destination as! MarsViewController
            segueController.userDate = userDate
        }
            else if segue.identifier == "mercury"{
            let segueController = segue.destination as! MercuryViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! MinutesViewController
            segueController.userDate = userDate
        }
    }
}
