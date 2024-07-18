//
//  ExLabel.swift
//  BaselineSample
//

import UIKit

@IBDesignable
class ExLabel : UILabel {
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
        let text = self.text ?? ""
        var attr: [NSAttributedString.Key : Any]
        if !text.isEmpty, let a = self.attributedText?.attributes(at: 0, effectiveRange: nil) {
            attr = a
        }
        else {
            attr = [:]
        }
        // ヒラギノファミリーのとき、属性を変更
        if self.font.familyName.starts(with: "Hiragino") {
            // ベースラインをdescenderのぶん、上に
            attr[NSAttributedString.Key.baselineOffset] = -self.font.descender
            // 行高さを最大まで補える倍率に設定
            if let p = (attr[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle)?.mutableCopy() as? NSMutableParagraphStyle {
                p.lineHeightMultiple = font.ascender / font.capHeight
                attr[NSAttributedString.Key.paragraphStyle] = p
            }
        }
        self.attributedText = NSAttributedString(string: text, attributes: attr)
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

