//
//  ViewController.swift
//  BaselineSample
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBAction func tapButton(_ sender: Any) {
        let l = label.text ?? ""
        label.text = l + " poke"
        let f = textField.text ?? ""
        textField.text = f + " pe"
    }
}
