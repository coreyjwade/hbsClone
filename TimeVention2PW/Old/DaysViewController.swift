//
//  DaysViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController {
    var userDate = Date()
    
    @IBOutlet weak var daysDisplay: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalDays = Calendar.current.dateComponents([.day], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let days = Double(Int(totalDays.day!))
        let transferDays = totalSeconds - days*86400
        let remainderDays = transferDays/86400
        let decimalDays = days + remainderDays
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 6
        numberFormatter.minimumFractionDigits = 6
        
        let displayDays = numberFormatter.string(from: NSNumber(value:decimalDays))
        daysDisplay.text = displayDays
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "weeks" {
                let segueController = segue.destination as! WeeksViewController
                segueController.userDate = userDate
            }
            else if segue.identifier == "hours" {
                let segueController = segue.destination as! HoursViewController
                segueController.userDate = userDate
            }
            else {
                let segueController = segue.destination as! JupiterViewController
                segueController.userDate = userDate
            }

        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
