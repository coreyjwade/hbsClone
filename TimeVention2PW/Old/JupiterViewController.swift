//
//  JupiterViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class JupiterViewController: UIViewController {
var userDate = Date()
    
    @IBOutlet weak var jupiterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageJupiter = totalSeconds/374198400
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 10
        numberFormatter.minimumFractionDigits = 10
        
        let displayJupiter = numberFormatter.string(from: NSNumber(value:ageJupiter))
        jupiterLabel.text = displayJupiter
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saturn" {
            let segueController = segue.destination as! SaturnViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "mars"{
            let segueController = segue.destination as! MarsViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! DaysViewController
            segueController.userDate = userDate
        }
    }
}

