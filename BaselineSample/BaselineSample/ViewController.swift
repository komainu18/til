//
//  ViewController.swift
//  BaselineSample
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: ExLabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: ExTextField!

    @IBAction func tapButton(_ sender: Any) {
        let l = label.text ?? ""
        label.text = l + " poke"
        let b = button.titleLabel?.text ?? ""
        button.setTitle(b + "p", for: .normal)
        let f = textField.text ?? ""
        textField.text = f + " poke"
    }
    
}
