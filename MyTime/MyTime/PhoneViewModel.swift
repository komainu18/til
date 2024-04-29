//
//  PhoneViewModel.swift
//  MyTime
//
//  Created by komainu-ya on 2024/04/28.
//

import WatchConnectivity

final class PhoneViewModel: NSObject, ObservableObject {
    
    private let session: WCSession
    @Published var counter = 0
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
    
    func countup() {
        counter += 1
        send(count: counter)
    }
    
    func countdown() {
        counter -= 1
        send(count: counter)
    }
    
    ///
    /// カウントを送信
    /// - Parameter count: カウンタの値
    /// - Warning: シミュレータでの実行は不可
    ///
    func send(count: Int) {
        guard session.activationState == .activated else {
            print("Sending method can only be called while the session is active.")
            return
        }
        
        Task.detached(priority: .medium) { [self] in
            let userInfo = [
                "count" : count
            ] as [String : Any]
            
            session.transferUserInfo(userInfo)
        }
    }
    
}

extension PhoneViewModel: WCSessionDelegate {
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
    }

    // transferUserInfoからの受信
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        Task { @MainActor in
            if let value = message["count"] as? Int {
                counter = value
            }
        }
    }
}
