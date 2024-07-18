//
//  ExButton.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExButton : UIButton {
    // コードから初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    // Storyboard/xib から初期化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }

    private func setup() {
        if let label = self.titleLabel, let text = label.text, !text.isEmpty  {
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
