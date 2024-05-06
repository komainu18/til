//
//  Feature.swift
//  TACSample
//
//  Created by komainu-ya on 2024/05/05.
//

import Foundation
import ComposableArchitecture

enum LoadState<V, E: Error> {
    case idle   //要求待ち
    case loading    //ロード中
    case success(V) //成功。値を持つ
    case failure(E) //失敗。エラーを持つ
}
extension LoadState {
    // ロード中ならtrue
    var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }

}

enum ApiError: LocalizedError {
    case searchFailed(message: String)
    
    var errorDescription: String? {
        switch self {
        case .searchFailed(let message):
            return message
        }
    }
}
// Reducer(継手)

@Reducer
struct Feature {
    @ObservableState
    struct State {
        var api: LoadState<String, any Error> = .idle
        var address: String?
    }

    // APIへ要求、結果の変換など、処理の種類をここにあげる
    enum Action {
        // 郵便番号文字列からAPIへ住所を要求
        case requestAddressFromZip(String)
        // APIからのJSON応答からデータ変換後、内容を解析する
        case zipSearchResponse(ZipCloudResponse)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .requestAddressFromZip(zip):
                //すでにロード中ならなにもしない
                if state.api.isLoading {
                    return .none
                }
                state.api = .loading
                return .run { send in
                    let (data, _) = try await URLSession.shared.data(
                        from: URL(string: "https://zipcloud.ibsnet.co.jp/api/search?zipcode=\(zip)")!
                    )
                    // JSONデータをデコードして返す
                    let res: ZipCloudResponse = try JSONDecoder().decode(ZipCloudResponse.self, from: data)
                    await send(
                        .zipSearchResponse(res)
                    )
                }

            case let .zipSearchResponse(res):
                if let result = res.results?.first {
                    //結果を持って「成功」にする
                    let address = result.address1 + result.address2 + result.address3
                    state.api = .success(address)
                }
                else {
                    state.api = .failure(ApiError.searchFailed(message: res.message ?? "失敗しました"))
                }
                return .none
            }

        }
    }
    
}
