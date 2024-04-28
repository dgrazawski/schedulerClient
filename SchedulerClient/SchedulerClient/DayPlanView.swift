//
//  DayPlanView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import SwiftUI

struct DayPlanView: View {
    let hoursInDay = Array(7...20)
    var body: some View {
        
        ScrollView {
            VStack{
                ForEach(hoursInDay, id: \.self) { hour in
                    VStack{
                        Text(String(hour)+":00")
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        Spacer()
                        Divider()
                    }.frame(height: 150)
                }
            }
        }
    }
}

#Preview {
    DayPlanView()
}
