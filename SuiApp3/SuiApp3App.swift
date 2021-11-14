//
//  SuiApp3App.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 18.09.2021.
//

import SwiftUI

@main
struct SuiApp3App: App {
    @State var selectedTab = 0
    var body: some Scene {
        WindowGroup {
            MainScreen(apiChoice: self.$selectedTab).onOpenURL { url in
                if url.host == "link1" {
                    self.selectedTab = 1
                } else if url.host == "link2" {
                    selectedTab = 0
                }
            }
        }
    }
}
