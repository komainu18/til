//
//  ExLabel.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExLabel : UILabel {
    override func setNeedsLayout() {
        if let text = self.text, self.font.familyName.starts(with: "Hiragino") {
            /// ヒラギノファミリーの属性を変更する
            var attr: [NSAttributedString.Key : Any] = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行間をフォントサイズの半分に
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineSpacing = self.font.pointSize / 2
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            // ベースラインをdescenderのぶん、上に
            attr[NSAttributedString.Key.baselineOffset] = NSNumber(value: -self.font.descender)

            self.attributedText = NSAttributedString(string: text, attributes: attr)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
