//
//  ViewController.swift
//  Tipsy
//
//  Created by Jonathan Singer on 5/25/20.
//  Copyright © 2020 Jonathan Singer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var total: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func billAmountChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        let perc = (sender as! UISlider).value
        percentage.text = String(perc)
        calculateTip()
    }
    
    func calculateTip(){
        let bill = Double(billAmount.text!)!
        let perc = Double(percentage.text!)!
        let tip = bill*(perc/100)
        let totalBill = tip+bill
        tipAmount.text = String(format: "%.2f", tip)
        total.text = String(format: "%.2f", totalBill)
    }
}

