//
//  ContentView.swift
//  QuoteZ
//
//  Created by Ibrahim Lokman on 13/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("BBV")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            Text("BCSV")
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("Better Call Saul", systemImage: "briefcase")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
