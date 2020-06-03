//
//  ViewController.swift
//  Tipsy
//
//  Created by Jonathan Singer on 5/25/20.
//  Copyright © 2020 Jonathan Singer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bill: Double = 0.0
    var tipPercentage: Double = 15.0
    var currentColor: UIColor = UIColor.white
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = currentColor
        // Do any additional setup after loading the view.
    }

    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func darkModeChange(_ sender: UIButton) {
        if(currentColor==UIColor.white){
            self.view.backgroundColor = UIColor.black
            percentage.textColor = UIColor.white
            tipAmount.textColor = UIColor.white
            total.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
            tipPercentageLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            currentColor = UIColor.black
            button.setTitle("Light Mode", for: .normal)
            
            
        }else{
            self.view.backgroundColor = UIColor.white
            percentage.textColor = UIColor.black
            tipAmount.textColor = UIColor.black
            total.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
            tipPercentageLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            tipAmountLabel.textColor = UIColor.black
            currentColor = UIColor.white
            button.setTitle("Dark Mode", for: .normal)
        }
    }
    
    @IBAction func billAmountChange(_ sender: Any) {
        bill = Double(billAmount.text ?? "") ?? 0.0
        calculateTip()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        tipPercentage = Double((sender as! UISlider).value)
        // Remove all but the first decimal place from tipPercentage
        tipPercentage = Double(Int(tipPercentage*10))/10
        percentage.text = String(format: "%.1f", tipPercentage) + "%"
        calculateTip()
    }
    
    func calculateTip(){
        let tip = bill*((tipPercentage)/100)
        let totalBill = tip+bill
        let tipAmt = String(format: "%.2f", tip)
        tipAmount.text = "$" + tipAmt
        let ttl = String(format: "%.2f", totalBill)
        total.text = "$" + ttl
    }
}
