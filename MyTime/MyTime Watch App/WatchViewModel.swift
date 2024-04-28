//
//  WatchViewModel.swift
//  MyTime Watch App
//
//  Created by komainu-ya on 2024/04/28.
//

import WatchConnectivity

final class WatchViewModel: NSObject, ObservableObject {
    
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
        sendImmediately(count: counter)
    }
    
    func countdown() {
        counter -= 1
        sendImmediately(count: counter)
    }
    
    ///
    /// 直ちにカウントを送信
    /// - Parameter count: カウンタの値
    ///
    func sendImmediately(count: Int) {
        guard session.activationState == .activated else {
            print("Sending method can only be called while the session is active.")
            return
        }
        
        Task.detached(priority: .medium) { [self] in
            let message = [
                "count" : count
            ] as [String : Any]
            
            self.session.sendMessage(message, replyHandler: nil) { error in
                print(error)
            }
        }
    }
    
}

extension WatchViewModel: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    // sendMessage用受信
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        Task { @MainActor in
            if let value = userInfo["count"] as? Int {
                counter = value
            }
        }
    }
    
}
