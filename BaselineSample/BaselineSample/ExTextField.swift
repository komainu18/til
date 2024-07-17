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
        let text = self.placeholder ?? ""
        var attr: [NSAttributedString.Key : Any] = [:]
        if !text.isEmpty {
            attr = self.attributedPlaceholder?.attributes(at: 0, effectiveRange: nil) ?? [:]
        }
        // 行高さをフォントサイズのn倍に
        if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
            p.lineHeightMultiple = 1.5
            attr[NSAttributedString.Key.paragraphStyle] = p
        }
        if let font = attr[NSAttributedString.Key.font] as? UIFont, font.familyName.starts(with: "Hiragino") {
            // ベースラインをdescenderのぶん、上に
            let descender = attr[NSAttributedString.Key.baselineOffset] as? CGFloat
            if descender == nil || descender! > -font.descender {
                attr[NSAttributedString.Key.baselineOffset] = -font.descender
            }
        }
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attr)
    }

    // テキストが変更された
    @objc func textFieldDidChange(textField: UITextField) {
        setupText()
    }

    func setupText() {
        let text = self.text ?? ""
        var attr: [NSAttributedString.Key : Any] = [:]
        if !text.isEmpty {
            attr = self.attributedText?.attributes(at: 0, effectiveRange: nil) ?? [:]
        }
        // 行高さをフォントサイズのn倍に
        if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
            p.lineHeightMultiple = 1.5
            attr[NSAttributedString.Key.paragraphStyle] = p
        }
        // ヒラギノファミリーのとき、属性を変更
        if let font = self.font, font.familyName.starts(with: "Hiragino") {
            // ベースラインをdescenderのぶん、上に
            attr[NSAttributedString.Key.baselineOffset] = -font.descender
        }
        self.attributedText = NSAttributedString(string: text, attributes: attr)
    }

}
