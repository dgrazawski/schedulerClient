//
//  PlanTileView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import SwiftUI
import SwiftData

struct PlanTileView: View {
    @Bindable var plan: SearchListModel
    var body: some View {
        HStack{
            VStack{
                Text(plan.scheduleName + " \(plan.year)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title3)
                Text(plan.universityName + " " + plan.facultyName)
            }
            Spacer()
            Button("Add", systemImage: "plus") {
                print("placeholder")
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    PlanTileView(plan: SearchListModel())
        .modelContainer(for: SearchListModel.self)
}
