//
//  SecondsViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class SecondsViewController: UIViewController {
    
    var userDate = Date()

    @IBOutlet weak var secondsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumFractionDigits = 1
        
        let displaySeconds = numberFormatter.string(from: NSNumber(value:totalSeconds))
        secondsLabel.text = displaySeconds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "minutes" {
    let segueController = segue.destination as! MinutesViewController
    segueController.userDate = userDate
    }
    else {
        let segueController = segue.destination as! MercuryViewController
        segueController.userDate = userDate
    }
}
}
