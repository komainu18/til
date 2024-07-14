//
//  ViewController.swift
//  BaselineSample
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: ExButton!
    @IBOutlet weak var label: ExLabel!
    @IBOutlet weak var textField: ExTextField!

    @IBAction func tapButton(_ sender: Any) {
        let l = label.text ?? ""
        label.text = l + " poke"
        let f = textField.text ?? ""
        textField.text = f + " pe"
    }
}
