//
//  SchedulerClientApp.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData

@main
struct SchedulerClientApp: App {
    let modelContainer: ModelContainer
      init() {
        do {
            
            modelContainer = try ModelContainer(for: SearchListModel.self)
        } catch {
          fatalError("Could not initialize ModelContainer")
        }
         
        
      }
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(modelContainer)
        }
    }
}
