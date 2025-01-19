//
//  ProductCell.swift
//  FoodDelivery
//
//  Created by yagnik on 19/01/25.
//

import SwiftUI

struct ProductCell: View {
    var didAddCart: (() -> Void)?
    
    var body: some View {
        VStack{
            Image("banana")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 80)
                .padding(.bottom, 20)
            
            Text("Banana")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            Text("7pcs, price")
                .font(.customfont(.medium, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondaryText)
                .padding(.leading)
                .padding(.bottom,10)
            
            
            HStack{
                Text("$2.99")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
//                    .padding(.top)
                
                Button {
                    didAddCart?()
                } label: {
                    Image("add_btn")
//                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
//                        .foregroundColor(.black)
                }
                .frame(width: 40, height: 40)
                .background( Color.primaryApp)
                .cornerRadius(15)
                .padding(.trailing,10)
                
            }
            
        }
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
    }
}

#Preview {
    ProductCell()
}
