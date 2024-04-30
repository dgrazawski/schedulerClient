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
                    
                        Text(String(hour)+":00")
                        .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    Divider().padding(.horizontal)
                        HStack{
                            if hour == 7 {
                                TileOnView(subjectName: "Matematyka 1", lecturerName: "Dr. Nowak", groupName: "Group 1", roomNumber: "13D", groupType: "Lecture")
                                    
                            }
                            if hour == 8 {
                                TileOnView(subjectName: "Matematyka 2", lecturerName: "Dr. Kowalski", groupName: "Group 3", roomNumber: "15", groupType: "Exercise")
                                    
                                TileOnView(subjectName: "Programowanie 3", lecturerName: "Prof. Jankowski", groupName: "Group 1", roomNumber: "13D", groupType: "Laboratories")
                                    
                            }
                        }.padding()
                        .frame(height: 155, alignment: .center)
                        
                        
                    
                }
            }
        }
    }
}

#Preview {
    DayPlanView()
}
