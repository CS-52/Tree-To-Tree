//
//  Filter.swift
//  TreeToTree
//
//  Created by Austin Chow on 4/22/18.
//  Copyright © 2018 CS+Social Good. All rights reserved.
//

import UIKit

class Filter: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var applyFiltersButton: UIButton!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker?
    @IBOutlet var timePicker: UIDatePicker?
    @IBOutlet var durationPicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyFiltersButton.layer.cornerRadius = 5
        applyFiltersButton.clipsToBounds = true
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(Filter.dateChanged(datePicker:)), for: .valueChanged)
        dateTextField.inputView = datePicker
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timePicker?.minuteInterval = 5
        timePicker?.addTarget(self, action: #selector(Filter.timeChanged(timePicker:)), for: .valueChanged)
        startTimeTextField.inputView = timePicker
        
        durationPicker = UIDatePicker()
        durationPicker?.datePickerMode = .countDownTimer
        durationPicker?.minuteInterval = 10
        durationPicker?.addTarget(self, action: #selector(Filter.durationChanged(durationPicker:)), for: .valueChanged)
        durationTextField.inputView = durationPicker
 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(Filter.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateTextField.text = dateFormatter.string(from:datePicker.date)
    }
    
    func timeChanged(timePicker: UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        startTimeTextField.text = timeFormatter.string(from:timePicker.date)
    }
    
    func durationChanged(durationPicker: UIDatePicker){
        let durationFormatter = DateFormatter()
        durationFormatter.dateFormat = "h' hr 'mm' min'"
        durationTextField.text = durationFormatter.string(from: durationPicker.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
