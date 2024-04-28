//
//  PlanDisplayView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import SwiftUI
import SwiftData


struct PlanDisplayView: View {
    @Bindable var plan: SearchListModel
    @Environment(\.modelContext) var context
    @State private var choosedDay: String = "Mon"
    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    let hoursInDay = Array(7...20)
    var body: some View {
        VStack{
            HStack{
                ForEach(daysOfWeek, id: \.self) { day in
                    Button(action: {
                        choosedDay = day
                    }, label: {
                        ZStack{
                            if day == choosedDay {
                                Circle().fill(.black)
                            } else {
                                Circle().fill(.gray)
                            }
                            
                            Text(day)
                                .foregroundStyle(.white)
                                
                        }.frame(width: 70)
                    })
                    
                }
            }
            .padding()
            Text(choosedDay)
            DayPlanView()
        }
        .navigationTitle(plan.scheduleName)
    }
}

#Preview {
    NavigationStack {
        PlanDisplayView(plan: SearchListModel())
            .modelContainer(for: SearchListModel.self)
    }
}
