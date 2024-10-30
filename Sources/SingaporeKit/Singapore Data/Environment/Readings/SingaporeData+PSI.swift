//
//  SingaporeData+PSI.swift
//  SingaporeKit
//
//  Created by Jia Chen Yee on 10/29/24.
//

import Foundation

extension SingaporeData {
    func fetchPSI() async {
        psi = .loading
        psi = await fetchEnvironmentData(dataset: "psi")
    }
}
