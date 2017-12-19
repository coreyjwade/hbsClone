//
//  UranusViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class UranusViewController: UIViewController {
    
    
@IBOutlet weak var uranusLabel: UILabel!
    
var userDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageUranus = totalSeconds/2642889600
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.minimumFractionDigits = 11
        
        let displayUranus = numberFormatter.string(from: NSNumber(value:ageUranus))
        uranusLabel.text = displayUranus
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "neptune" {
            let segueController = segue.destination as! NeptuneViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "saturn" {
            let segueController = segue.destination as! SaturnViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! MonthsViewController
            segueController.userDate = userDate
        }
    }
}
