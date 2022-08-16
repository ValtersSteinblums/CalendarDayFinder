//
//  AlertViewController.swift
//  CalendarDayFinder
//
//  Created by valters.steinblums on 16/08/2022.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        basicAlert(title: "This is My Homework", message: "Home work 10")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToFinderPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
