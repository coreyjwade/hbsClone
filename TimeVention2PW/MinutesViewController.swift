//
//  MinutesViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class MinutesViewController: UIViewController {
    
    var userDate = Date()
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let now = Date()
        let totalMinutes = Calendar.current.dateComponents([.minute], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let minutes = Double(Int(totalMinutes.minute!))
        let remainder = totalSeconds.truncatingRemainder(dividingBy: 60)
        let decimal = Double(remainder)
        let remainderMinutes = decimal/60
        let decimalMinutes = minutes + remainderMinutes
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 3
        numberFormatter.minimumFractionDigits = 3
        
            let displayMinutes = numberFormatter.string(from: NSNumber(value:decimalMinutes))
            minutesLabel.text = displayMinutes
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hours" {
            let segueController = segue.destination as! HoursViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "seconds" {
            let segueController = segue.destination as! SecondsViewController
            segueController.userDate = userDate
        }
        else {
                let segueController = segue.destination as! VenusViewController
                segueController.userDate = userDate
            }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
