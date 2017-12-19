//
//  YearsViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class YearsViewController: UIViewController {

    var userDate = Date()
    
    @IBOutlet weak var yearsDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalYears = Calendar.current.dateComponents([.year], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let years = Double(Int(totalYears.year!))
        
        //create new date, 1 year from current year, calculate days between
        
        let transferYears = totalSeconds - years*86400*365
        let remainderYears = transferYears/(86400*365)
        let decimalYears = years + remainderYears
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 9
        numberFormatter.minimumFractionDigits = 9
        
        let displayYears = numberFormatter.string(from: NSNumber(value:decimalYears))
        yearsDisplay.text = displayYears
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "neptune" {
            let segueController = segue.destination as! NeptuneViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "months" {
            let segueController = segue.destination as! MonthsViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! MercuryViewController
            segueController.userDate = userDate
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

