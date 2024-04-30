//
//  MainView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    var body: some View {
        TabView{
            PlansListView()
                .tabItem { Label("Plans", systemImage: "books.vertical.fill") }
            SearchPlansView()
                .tabItem { Label("Search plans", systemImage: "magnifyingglass") }
        }
        
            
    }
}

#Preview {
    MainView()
        .modelContainer(for: [SearchListModel.self, MeetingModel.self])
}
