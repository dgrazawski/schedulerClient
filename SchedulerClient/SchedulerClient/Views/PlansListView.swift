//
//  PlansListView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData

struct PlansListView: View {
    @ObservedObject private var network: NetworkManager = NetworkManager()
    @Environment(\.modelContext) var context
    @Query private var listOfUnis: [SearchListModel]
    var body: some View {
        NavigationStack{
            
                List{
                    ForEach(listOfUnis, id: \.self){uni in
                        NavigationLink(destination: PlanDisplayView(plan: uni)) {
                            AddedPlanTileView(plan: uni)
                        }
                        .swipeActions(content: {
                            Button(role: .destructive) {
                                withAnimation {
                                    context.delete(uni)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        })
                        
                    }
                }
                .task {
                    for plan in listOfUnis {
                        if !plan.isCyclic {
                            print("placeholder")
                            let url = URLRequestBuilder().createURL(route: .client, endpoint: .clientGetMeetings,parameter: plan.id.uuidString)
                            print(url!)
                            let request = URLRequestBuilder().createRequest(method: .get, url: url!)
                            network.loadMeetings(request: request!)
                           // listOfUnis = network.searchList
                        }
                    }
                    
                }
                .overlay{
                    if listOfUnis.isEmpty {
                        ContentUnavailableView("No plans added", systemImage: "bookmark.slash")
                    }
                }
                .navigationTitle("Plans")
            
        }
        
    }
}

#Preview {
    PlansListView()
        .modelContainer(for: [SearchListModel.self, MeetingModel.self])
}
