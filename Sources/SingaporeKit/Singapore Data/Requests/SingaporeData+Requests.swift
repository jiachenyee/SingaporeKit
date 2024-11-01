//
//  SingaporeData+Requests.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 11/2/24.
//

import Foundation

extension SingaporeData {
    func performRequest<Value>(for dateOption: DateOption?,
                               refreshDuration: TimeInterval,
                               request: (() async -> SingaporeDataResult<Value>), set: (SingaporeDataResult<Value>) -> Void) async {
        set(.loading)
        
        set(await request())
        
        switch dateOption {
        case .realTime(let interval):
            while true {
                do {
                    try await Task.sleep(for: .seconds(interval ?? refreshDuration))
                } catch {
                    return
                }
                let tempValue = await request()
                
                if tempValue.isSuccess {
                    set(tempValue)
                }
            }
        default: break
        }
    }
    
    func performRequest<Value>(for momentOption: MomentOption?,
                               refreshDuration: TimeInterval,
                               request: (() async -> SingaporeDataResult<Value>), set: (SingaporeDataResult<Value>) -> Void) async {
        set(.loading)
        
        set(await request())
        
        switch momentOption {
        case .realTime(let interval):
            while true {
                do {
                    try await Task.sleep(for: .seconds(interval ?? refreshDuration))
                } catch {
                    return
                }
                let tempValue = await request()
                
                if tempValue.isSuccess {
                    set(tempValue)
                }
            }
        default: break
        }
    }
}
