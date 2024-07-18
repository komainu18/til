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
        
        var attr: [NSAttributedString.Key : Any] = self.defaultTextAttributes
        setup(attr: &attr)
        self.defaultTextAttributes = attr

        // placeholder
        let text = self.placeholder ?? ""
        var pAttr: [NSAttributedString.Key : Any]
        if !text.isEmpty, let a = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) {
            pAttr = a
        }
        else {
            pAttr = [:]
        }
        setup(attr: &pAttr)
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: pAttr)
    }

    private func setup( attr: inout [NSAttributedString.Key : Any]) {
        // 行高さをフォントサイズのn倍に
        if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
            p.lineHeightMultiple = 1.1
            attr[NSAttributedString.Key.paragraphStyle] = p
        }
        if let font = attr[NSAttributedString.Key.font] as? UIFont {
            if font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                let descender = attr[NSAttributedString.Key.baselineOffset] as? CGFloat
                if descender == nil || descender! > -font.descender {
                    attr[NSAttributedString.Key.baselineOffset] = -font.descender
                }
            }
        }
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let b = super.placeholderRect(forBounds: bounds)
        // placeholderの位置をtextと合わせたい時
        return CGRect(x: b.origin.x, y: floor(b.origin.y), width: bounds.width, height: bounds.height)
    }
}
