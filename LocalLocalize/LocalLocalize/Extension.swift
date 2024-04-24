//
//  Extension.swift
//  LocalLocalize
//
//  Created by komainu-ya on 2024/04/24.
//

import Foundation

extension String {
    init(localized: LocalizationValue, lang: String) {
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        self.init(localized: localized, bundle: Bundle(path: path!))
    }
}

