
//
//  HoursViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController {
    
    var userDate = Date()

    @IBOutlet weak var hoursDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalHours = Calendar.current.dateComponents([.hour], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let hours = Double(Int(totalHours.hour!))
        let transferSeconds = totalSeconds - hours*3600
        let remainderHours = transferSeconds/3600
        
//        let remainder = totalSeconds.truncatingRemainder(dividingBy: 3600)
//        let decimal = Double(remainder)
//        let remainderHours = decimal/3600
        let decimalHours = hours + remainderHours
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.minimumFractionDigits = 5
        
        let displayHours = numberFormatter.string(from: NSNumber(value:decimalHours))
        hoursDisplay.text = displayHours
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "days" {
            let segueController = segue.destination as! DaysViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "minutes" {
            let segueController = segue.destination as! MinutesViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! MarsViewController
            segueController.userDate = userDate
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
