//
//  MercuryViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class MercuryViewController: UIViewController {
    
    var userDate = Date()

    @IBOutlet weak var mercuryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let ageMercury = totalSeconds/7603200
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 8
        numberFormatter.minimumFractionDigits = 8
        
        let displayMercury = numberFormatter.string(from: NSNumber(value:ageMercury))
        mercuryLabel.text = displayMercury
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "venus" {
            let segueController = segue.destination as! VenusViewController
            segueController.userDate = userDate
        }
        else if segue.identifier == "years" {
            let segueController = segue.destination as! YearsViewController
            segueController.userDate = userDate
        }
        else {
            let segueController = segue.destination as! SecondsViewController
            segueController.userDate = userDate
        }
    }
}
