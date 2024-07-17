//
//  ExLabel.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExLabel : UILabel {
    override func setNeedsLayout() {
        if let text = self.text, !text.isEmpty {
            var attr: [NSAttributedString.Key : Any] = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行高さをフォントサイズのn倍に
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineHeightMultiple = 1.1
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            // ヒラギノファミリーのとき、属性を変更
            if self.font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                attr[NSAttributedString.Key.baselineOffset] = -self.font.descender
            }
            self.attributedText = NSAttributedString(string: text, attributes: attr)
        }
    }
}

//print(self.font.pointSize)  //20.0 17.0
//print(self.font.lineHeight) //20.0 20.287109375
//print(self.font.capHeight)  //15.68 11.97802734375
//print(self.font.ascender)   //17.6 16.1865234375
//print(self.font.descender)  //-2.4 0
//print(self.font.leading)    //10.0 17.0
// 34 + 33.5= 67.5 101
//  34.5 + 34.5 = 69

