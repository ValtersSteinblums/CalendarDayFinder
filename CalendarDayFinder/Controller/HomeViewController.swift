//
//  ViewController.swift
//  CalendarDayFinder
//
//  Created by valters.steinblums on 11/08/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func findWeekDayTapped(_ sender: Any) {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text ?? "0"), let month = Int(monthTextField.text ?? "0"), let year = Int(yearTextField.text ?? "0") else {
            basicAlert(title: "Input Error!", message: "Date, Month or Year text fields can't be empty!")
            return
        }
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text {
        case "Find":
            findButton.setTitle("Clear", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                let capitalizedWeekday = weekday.capitalized
                resultLabel.text = capitalizedWeekday
            } else {
                basicAlert(title: "Wrong Date!", message: "Please enter correct date.")
            }
        default:
            findButton.setTitle("Find", for: .normal)
            clearTextFields()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func clearTextFields() {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLabel.text = "Day of The Week, Inside Your Finder"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedDateID" {
            guard let vc = segue.destination as? DetailedDayViewController else {return}
            vc.newDateFound = "\(resultLabel.text ?? "No data") is the day you were looking for!"
        }
    }
    
    
}

extension UIViewController {
    func basicAlert(title: String?, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

