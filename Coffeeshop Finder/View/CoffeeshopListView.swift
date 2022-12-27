//
//  CoffeeshopListView.swift
//  Coffeeshop Finder
//
//  Created by Alief Ahmad Azies on 27/12/22.
//

import SwiftUI

struct CoffeeshopListView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var coffeeshopSearchResults: [Coffeeshop] {
        let results = CoffeeshopProvider.all()
        
        if searchText.isEmpty {
            return results
        } else {
            return results.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    private var suggestedResult: [Coffeeshop] {
        if searchText.isEmpty {
            return []
        } else {
            return coffeeshopSearchResults
        }
    }
    
    var body: some View {
        //        Image("bojaeatery")
        //            .resizable()
        //            .scaledToFill()
        //            .frame(width: 200, height: 200)
        //            .clipped()
        //            .cornerRadius(CGFloat(36))
        NavigationView {
            List(coffeeshopSearchResults.shuffled()) {result in
                NavigationLink(destination: {
                    CoffeeShopDetail(coffeeShopDetails: result)
                }) {
                    HStack {
                        Image("\(result.image)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipped()
                            .cornerRadius(CGFloat(16))
                        VStack(alignment: .leading, spacing: 6){
                            Text("\(result.name)")
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 24, weight: .bold,design: .rounded))
                            Text("\(result.location)")
                                .font(.system(size: 12, weight: .regular, design: .rounded))
                                .foregroundColor(.gray)
                            Text("Rating: 4/5")
                                .font(.system(size: 12, weight: .ultraLight, design: .rounded))
                        }
                    }
                }
                
            }
            .navigationTitle("Coffeeshop")
            .searchable(
                text: $searchText,
                placement:
                        .navigationBarDrawer(displayMode: .always),
                prompt: "Search Coffeeshops"
            ) {
                ForEach(suggestedResult) { result in
                    Text("Looking for \(result.name)?")
                        .searchCompletion(result.name)
                }
            }
        }
    }
}

struct CoffeeshopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopListView()
    }
}
