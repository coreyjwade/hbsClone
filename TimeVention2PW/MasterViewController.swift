//
//  MasterViewContoller.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 12/19/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

var userDate = Date()
var userClock = StandardClock(date: userDate)

class MasterViewController: UIViewController {

    var userDate = Date()
    var unit = Calendar.Component.second
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(MasterViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        let display = userClock.numberFormatter(date: userDate, unit: unit)
        label.text = display
    }
}
