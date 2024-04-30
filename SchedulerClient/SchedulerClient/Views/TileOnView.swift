//
//  TileOnView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import SwiftUI

struct TileOnView: View {
    var subjectName: String
    var lecturerName: String
    var groupName: String
    var roomNumber: String
    var groupType: String
    var tileColor: Color {
        switch(groupType) {
        case "Lecture":
            return .blue
        case "Exercise":
            return .red
        case "Laboratories":
            return .cyan
        case "Seminary":
            return .green
        case "Special":
            return .mint
        default:
            return .yellow
        }
    }
    var body: some View {
        ZStack {
            Rectangle().fill(tileColor.gradient)
            VStack(alignment: .leading, spacing: 5){
                Text(subjectName)
                    .font(.callout)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Text(lecturerName)
                    .font(.callout)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                HStack(alignment: .center, spacing: 5) {
                    Text(groupName)
                    Spacer()
                    Text(roomNumber)
                }
                .padding(.horizontal)
                       
            }
            
        }
        .frame(height: 140)
        .cornerRadius(15)
    }
}

#Preview {
    TileOnView(subjectName: "Matematyka 1", lecturerName: "Dr. Nowak", groupName: "Group 1", roomNumber: "13D", groupType: "Lecture")
}
