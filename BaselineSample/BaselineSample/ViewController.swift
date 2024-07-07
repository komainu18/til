//
//  ViewController.swift
//  BaselineSample
//
//  Created by komainu-ya on 2024/07/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: ExLabel!
    @IBOutlet weak var button: UIButton!
}

@IBDesignable
class ExLabel : UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        if let text = self.text, self.font.familyName.starts(with: "Hiragino") {
            //ヒラギノファミリーの属性を変更する
            var attr: [NSAttributedString.Key : Any] = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行間をフォントサイズの半分にする。
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineSpacing = self.font.pointSize / 2
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            // ベースラインをdescenderのぶん、上に
            attr[NSAttributedString.Key.baselineOffset] = NSNumber(value: -self.font.descender)

            self.attributedText = NSAttributedString(string: text, attributes: attr)
        }
    }
}
