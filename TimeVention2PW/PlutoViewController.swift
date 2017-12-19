//
//  PlutoViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 8/2/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class PlutoViewController: UIViewController {
var userDate = Date()
    
    
    @IBOutlet weak var plutoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(SecondsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        let now = Date()
        let totalSeconds = now.timeIntervalSince(userDate)
        let agePluto = totalSeconds/7824384000
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.maximumFractionDigits = 11
        numberFormatter.minimumFractionDigits = 11
        
        let displayPluto = numberFormatter.string(from: NSNumber(value:agePluto))
        plutoLabel.text = displayPluto
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "neptune" {
            let segueController = segue.destination as! NeptuneViewController
            segueController.userDate = userDate
        }
    }
}
