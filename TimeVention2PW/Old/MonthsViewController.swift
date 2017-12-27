//
//  MonthsViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class MonthsViewController: UIViewController {
    
    var userDate = Date()

    @IBOutlet weak var monthsDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MinutesViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalMonths = Calendar.current.dateComponents([.month], from: userDate, to: now)
        let totalSeconds = now.timeIntervalSince(userDate)
        let months = Double(Int(totalMonths.month!))
        
        //create new date, 1 month from current date, calculate days between
        ////FIX THIS!!!///
        let transferMonths = totalSeconds - months*86400*30
        let remainderMonths = transferMonths/(86400*30)
        let decimalMonths = months + remainderMonths
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 8
        numberFormatter.minimumFractionDigits = 8
        
        let displayMonths = numberFormatter.string(from: NSNumber(value:decimalMonths))
        monthsDisplay.text = displayMonths
        
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "years" {
            let segueController = segue.destination as! YearsViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "weeks" {
            let segueController = segue.destination as! WeeksViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! UranusViewController
            segueController.userDate = userDate
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
