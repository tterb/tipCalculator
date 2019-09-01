//
//  ViewController.swift
//  tipCalculator
//
//  Created by Brett Stevenson on 8/26/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create gradient background
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.cyan.cgColor, UIColor.purple.cgColor]
        layer.startPoint = CGPoint(x: 0.25,y: -0.5)
        layer.endPoint = CGPoint(x: 0.75,y: 1.5)
        layer.zPosition = -1
        view.layer.addSublayer(layer)
        // Set input keyboard
        self.inputField.keyboardType = UIKeyboardType.decimalPad
        // Modify percentControl text-size
        let font = UIFont.systemFont(ofSize:20)
        percentControl.setTitleTextAttributes( [NSAttributedString.Key.font: font],
            for: UIControl.State.normal
        )
        // Modify selected percentControl style
        let selectedSegment = [NSAttributedString.Key.foregroundColor: UIColor(hex: 0x45A6BA), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .semibold)]
        UISegmentedControl.appearance().setTitleTextAttributes(selectedSegment, for: .selected)
        // Set focus to input field
        inputField.becomeFirstResponder()
    }

    @IBAction func percentChange(_ sender: Any) {
        calculateTip(self)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercent = [0.05, 0.10, 0.15]
        let bill = Double(inputField.text!) ?? 0
        let tip = (bill * tipPercent[percentControl.selectedSegmentIndex])
        let total = tip + bill
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex >> 16) & 0xff) / 255
        let g = CGFloat((hex >> 08) & 0xff) / 255
        let b = CGFloat((hex >> 00) & 0xff) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
