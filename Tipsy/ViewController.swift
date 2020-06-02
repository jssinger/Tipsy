//
//  ViewController.swift
//  Tipsy
//
//  Created by Jonathan Singer on 5/25/20.
//  Copyright © 2020 Jonathan Singer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentColor:UIColor = UIColor.white
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
        }
    }
    
    @IBAction func billAmountChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        let perc = Int((sender as! UISlider).value)
        (sender as! UISlider).value = Float(perc)
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

