//
//  ContentView.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 13/06/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menuViewModel = MenuViewModel()
    @State var selectedItem:MenuItem?
    var body: some View {
        NavigationStack {
            ZStack {
                if selectedItem != nil {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea(.all)
                }
                ScrollView {
              
                    LazyVStack(alignment: .leading,spacing: 12){
                        ForEach(menuViewModel.menuItems) { item in
                            HStack(spacing: 15){
                                AsyncImage(url: URL(string: item.image)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 130,height:140)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                    case .failure(let error):
                                        let _ = print(error.localizedDescription)
                                        Image(systemName: "photo")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
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
                            .onTapGesture {
                                withAnimation {
                                    selectedItem = item
                                }
    //                            MenuDetailView(menuViewModel: menuViewModel, menuItem: item)
                            }
    //                        Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
                .disabled(selectedItem != nil)
                if let item  = selectedItem {
                    MenuDetailView(menuViewModel: menuViewModel, menuItem: item, onDismiss: {
                        withAnimation(.easeOut) {
                            selectedItem = nil
                        }
                        
                    })
                        .frame(maxWidth: 350)
                        .transition(.scale)
                }
                
            }
        }
//        .sheet(item: $selectedItem) { item in
//            MenuDetailView(menuViewModel: menuViewModel, menuItem: item)
//                .presentationDetents([.height(700)])
//        }
    }
}

#Preview {
    ContentView()
}
