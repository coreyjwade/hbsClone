//
//  NeptuneViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class NeptuneViewController: UIViewController {
var userDate = Date()
    
    @IBOutlet weak var neptuneLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageNeptune = totalSeconds/5166720000
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.minimumFractionDigits = 11
        
        let displayNeptune = numberFormatter.string(from: NSNumber(value:ageNeptune))
        neptuneLabel.text = displayNeptune
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pluto" {
            let segueController = segue.destination as! PlutoViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "uranus"{
            let segueController = segue.destination as! UranusViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! YearsViewController
            segueController.userDate = userDate
        }
    }
}
