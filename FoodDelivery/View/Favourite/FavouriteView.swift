//
//  ExploreView.swift
//  FoodDelivery
//
//  Created by yagnik on 15/01/25.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("This is favourite view page")
                    .font(.customfont(.semibold, fontSize: 20))
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        FavouriteView()
    }
}
