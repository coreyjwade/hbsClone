//
//  TimeViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    var birthDate = DateComponents()
    var birthDayDateOnly = Date()
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueController = segue.destination as! SecondsViewController
        let tComponents = Calendar.current.dateComponents([.hour, .minute], from: timePicker.date)
        var birthDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: birthDayDateOnly)
        birthDate.year = birthDateComponents.year
        birthDate.month = birthDateComponents.month
        birthDate.day = birthDateComponents.day
        birthDate.hour = tComponents.hour
        birthDate.minute = tComponents.minute
        let birthDay = Calendar.current.date(from: birthDate)!
        segueController.userDate = birthDay
}
}
