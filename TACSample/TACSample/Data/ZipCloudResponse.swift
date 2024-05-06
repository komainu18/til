//
//  ZipCloudResponse.swift
//  TACSample
//
//  Created by komainu-ya on 2024/05/06.
//

import Foundation

// 郵便番号検索API「zipcloud」のレスポンスデータ
// https://zipcloud.ibsnet.co.jp/doc/api

struct ZipCloudResponse: Codable {
    let status: Int
    let message: String?    //エラー時メッセージ
    let results: [SearchRes]?
}
struct SearchRes: Codable {
    let zipcode: String
    let prefcode: String
    let address1: String
    let address2: String
    let address3: String
    let kana1: String
    let kana2: String
    let kana3: String
}
