//
//  ContentView.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menuViewModel = MenuViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading,spacing: 12){
                    ForEach(menuViewModel.menuItems) { item in
                        HStack(spacing: 15){
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130,height:140)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            VStack(alignment: .leading){
                                Text(item.appetizerName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primary)
                                
                                Text(menuViewModel.currencyFormatter(number: item.price))
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
       
    }
}

#Preview {
    ContentView()
}
