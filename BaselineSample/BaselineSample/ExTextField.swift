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

    func setup() {
        self.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        setupText()

        // placeholder
        if let text = self.placeholder, !text.isEmpty {
            var attr: [NSAttributedString.Key : Any] = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行高さをフォントサイズのn倍に
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineHeightMultiple = 1.1
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            if let font = attr[NSAttributedString.Key.font] as? UIFont, font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                let descender = attr[NSAttributedString.Key.baselineOffset] as? CGFloat
                if descender == nil || descender! > -font.descender {
                    attr[NSAttributedString.Key.baselineOffset] = -font.descender
                    self.attributedPlaceholder = NSAttributedString(string: text, attributes: attr)
                }
            }
        }
    }

    // テキストが変更された
    @objc func textFieldDidChange(textField: UITextField) {
        setupText()
    }

    func setupText() {
        if let text = self.text, !text.isEmpty {
            var attr: [NSAttributedString.Key : Any] = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
            // 行高さをフォントサイズのn倍に
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineHeightMultiple = 1.1
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
            // ヒラギノファミリーのとき、属性を変更
            if let font = self.font, font.familyName.starts(with: "Hiragino") {
                // ベースラインをdescenderのぶん、上に
                attr[NSAttributedString.Key.baselineOffset] = NSNumber(value: -font.descender)
            }
            self.attributedText = NSAttributedString(string: text, attributes: attr)
        }
    }

}
