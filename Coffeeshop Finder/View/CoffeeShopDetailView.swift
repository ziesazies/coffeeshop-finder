//
//  CoffeeShopDetail.swift
//  Coffeeshop Finder
//
//  Created by Alief Ahmad Azies on 28/12/22.
//

import SwiftUI

struct CoffeeShopDetail: View {
    let coffeeShopDetails: Coffeeshop
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .brown], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Image("\(coffeeShopDetails.image)")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
                    .clipped()
                Text(coffeeShopDetails.name)
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(coffeeShopDetails.review)
                    .font(.subheadline)
                    .padding(.top, 24)
                Spacer()
                Text(coffeeShopDetails.location)
                    .font(.footnote)
            }.padding()
        }
    }
}

struct CoffeeShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetail(coffeeShopDetails: Coffeeshop(
            image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"
        ))
    }
}
