//
//  MenuDetailView.swift
//  MenuFlow
//
//  Created by Shashank Yadav on 14/06/26.
//

import SwiftUI

struct MenuDetailView: View {
    @ObservedObject var menuViewModel:MenuViewModel
    let menuItem:MenuItem
    var onDismiss:()->Void
    
    var body: some View {
        VStack(spacing: 25) {
            AsyncImage(url: URL(string: menuItem.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            case .failure(let error):
                    let _ = print(error.localizedDescription)
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
//            Image(systemName: "photo")
//                .resizable()
//                .scaledToFill()
//                .frame(maxWidth: .infinity)
//                .frame(height: 200)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(menuItem.appetizerName)
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.primary)
            
            Text(menuItem.foodDescription)
                .font(.headline)
                .foregroundStyle(.primary)
                .lineLimit(3)
                .minimumScaleFactor(0.8)
            
            HStack (alignment: .center){
                Spacer()
                VStack(spacing: 5){
                    Text("Protein")
                        .foregroundStyle(.primary)
                        .font(.headline)
                    Text("\(menuItem.protein)")
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                }
                Spacer()
                VStack(spacing: 5){
                    Text("Calories")
                        .foregroundStyle(.primary)
                        .font(.headline)

                    Text("\(menuItem.calories)")
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                }
                Spacer()
                VStack(spacing: 5){
                    Text("Carbs")
                        .foregroundStyle(.primary)
                        .font(.headline)
                    
                    Text("\(menuItem.carbs)")
                        .foregroundStyle(.primary)
                        .font(.subheadline)
                }
                
                Spacer()
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .overlay(alignment: .topTrailing) {
            Button {
                onDismiss()
                
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 30,height:40)
                        .opacity(0.8)
                    
                    Image(systemName: "xmark")
                        .imageScale(.medium)
                        .frame(width: 40,height: 40)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
#Preview {
    MenuDetailView(menuViewModel: MenuViewModel(), menuItem: MenuItem(id: 1, appetizerName: "Spring Roll", foodDescription: "Crispy Thai-style spring rolls filled with vegetables and served with sweet chili sauce.", price: 2.99, calories: 250, protein: 5, carbs: 31, image: "https://raw.githubusercontent.com/ShashankYadav28/AppetizerData/main/images/thai-fried-spring-rolls.jpg"), onDismiss: {
        print("hello")
    })
}
