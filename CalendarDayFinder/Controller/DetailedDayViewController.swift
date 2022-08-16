//
//  DetailedDayViewController.swift
//  CalendarDayFinder
//
//  Created by valters.steinblums on 16/08/2022.
//

import UIKit

class DetailedDayViewController: UIViewController {
    
    var newDateFound = ""

    @IBOutlet weak var dateFound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFound.text = newDateFound
    }

}
