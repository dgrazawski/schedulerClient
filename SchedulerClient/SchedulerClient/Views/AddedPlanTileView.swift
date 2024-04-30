//
//  AddedPlanTileView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import SwiftUI
import SwiftData

struct AddedPlanTileView: View {
    @Bindable var plan: SearchListModel
    var body: some View {
        HStack{
            VStack{
                Text(plan.scheduleName + " \(plan.year)")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title3)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity,/*@END_MENU_TOKEN@*/ alignment: .leading)
                Text(plan.universityName + " " + plan.facultyName)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .leading)
            }
            
        }
        .padding()
        .frame()
    }
}

#Preview {
    AddedPlanTileView(plan: SearchListModel())
        .modelContainer(for: SearchListModel.self)
}
