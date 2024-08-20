//
//  WB_FinalProjectApp.swift
//  WB_FinalProject
//
//  Created by Семен Гайдамакин on 08.08.2024.
//

import SwiftUI

@main
struct WB_FinalProjectApp: App {
    
    @StateObject private var router : Router = .shared
    
    var body: some Scene {
        WindowGroup {
            RootView(content: TabsView().environmentObject(router))
        }
    }
}
