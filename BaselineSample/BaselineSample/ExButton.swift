//
//  ExButton.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExButton : UIButton {
    override func setNeedsLayout() {
        if let label = self.titleLabel, let text = label.text {
            var attr: [NSAttributedString.Key : Any] = label.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行高さをフォントサイズのn倍に
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineHeightMultiple = 1.1
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            // ヒラギノファミリーのとき、属性を変更
            if label.font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                attr[NSAttributedString.Key.baselineOffset] = -label.font.descender
            }
            label.attributedText = NSAttributedString(string: text, attributes: attr)
        }
    }

}
