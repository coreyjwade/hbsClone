//
//  MarsViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class MarsViewController: UIViewController {
var userDate = Date()
    
    @IBOutlet weak var marsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageMars = totalSeconds/59356800
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 9
        numberFormatter.minimumFractionDigits = 9
        
        let displayMars = numberFormatter.string(from: NSNumber(value:ageMars))
        marsLabel.text = displayMars
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "jupiter" {
            let segueController = segue.destination as! JupiterViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "venus"{
            let segueController = segue.destination as! VenusViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! HoursViewController
            segueController.userDate = userDate
        }
    }
}
