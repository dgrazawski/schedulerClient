//
//  PlansListView.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 17/04/2024.
//

import SwiftUI
import SwiftData

struct PlansListView: View {
    @State private var listOfUnis = [SearchListModel(), SearchListModel(), SearchListModel(), SearchListModel()]
    var body: some View {
        NavigationStack{
            
                List{
                    ForEach(listOfUnis, id: \.self){uni in
                        NavigationLink(destination: PlanDisplayView(plan: uni)) {
                            AddedPlanTileView(plan: uni)
                        }
                        
                    }
                }
                .navigationTitle("Plans")
            
        }
    }
}

#Preview {
    PlansListView()
        .modelContainer(for: SearchListModel.self)
}
