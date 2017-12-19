//
//  ViewController.swift
//  TimeVention2PW
//
//  Created by Corey Wade on 7/27/17.
//  Copyright © 2017 Corey Wade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var birthDate = DateComponents()

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueController = segue.destination as! TimeViewController
        let components = Calendar.current.dateComponents([.year, .month, .day], from: datePicker.date)
       birthDate.year = components.year
       birthDate.month = components.month
       birthDate.day = components.day
       let birthDayDate = Calendar.current.date(from: birthDate)!
       segueController.birthDayDateOnly = birthDayDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

