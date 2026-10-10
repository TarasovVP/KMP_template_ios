//
//  ContentView.swift
//  KMP_template_ios
//
//  Created by Volodymyr Tarasov on 01.08.2025.
//

import SwiftUI
import shared

struct ContentView: View {
    private let systemInfo = SystemInfo()
    var body: some View {
        VStack {
            Text(systemInfo.getInfo())
                .padding()
            Text("Device: \(systemInfo.getDeviceModel())")
        }
    }
}

#Preview {
    ContentView()
}
