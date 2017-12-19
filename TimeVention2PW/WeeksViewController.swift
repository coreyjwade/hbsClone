//
//  WeeksViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class WeeksViewController: UIViewController {
    
    var userDate = Date()

    @IBOutlet weak var weeksDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalWeeks = Calendar.current.dateComponents([.weekOfYear], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let weeks = Double(Int(totalWeeks.weekOfYear!))
        let transferWeeks = totalSeconds - weeks*604800
        let remainderWeeks = transferWeeks/604800
        let decimalWeeks = weeks + remainderWeeks
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 7
        numberFormatter.minimumFractionDigits = 7
        
        let displayWeeks = numberFormatter.string(from: NSNumber(value:decimalWeeks))
        weeksDisplay.text = displayWeeks
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "months" {
            let segueController = segue.destination as! MonthsViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "days" {
            let segueController = segue.destination as! DaysViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! SaturnViewController
            segueController.userDate = userDate
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
