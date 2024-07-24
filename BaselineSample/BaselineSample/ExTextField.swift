//
//  ExTextField.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExTextField : UITextField {
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
        // placeholder
        let text = self.placeholder ?? ""
        var pAttr: [NSAttributedString.Key : Any]
        if !text.isEmpty, let a = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) {
            pAttr = a
        }
        else {
            pAttr = [:]
        }
        if let font = pAttr[NSAttributedString.Key.font] as? UIFont {
            if font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                pAttr[NSAttributedString.Key.baselineOffset] = -font.descender
                // 行高さを最大まで補える倍率に設定
                if let p = (pAttr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                    p.lineHeightMultiple = font.ascender / font.capHeight
                    pAttr[NSAttributedString.Key.paragraphStyle] = p
                }
            }
        }
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: pAttr)
    }
}
