//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by CRISTIAN SAMUEL CONTRERAS on 10/8/24.
//

import SwiftUI
import ComponentsUI

@main
struct SampleAppApp: App {
    init() {
        logger.setOutputLevel(.debug)
        Injector.shared.register(FontStyleContract.self, CustomFontStyle())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class CustomFontStyle: FontStyle {
    override init() {
        super.init()
        self.headline = Font.custom("RockSalt-Regular", size: 16)
        self.body = Font.custom("RockSalt-Regular", size: 8)
    }
}
