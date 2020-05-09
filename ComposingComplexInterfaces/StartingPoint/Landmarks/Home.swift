//
//  Home.swift
//  Landmarks
//
//  Created by Gregory Arnal on 07/05/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarkData, by: {$0.category.rawValue}
        )
    }
    
    var featured: [Landmark]{
        landmarkData.filter{$0.isFeatured}
    }
    
    @State var showingProfiles = false
    
    var ProfileButton: some View{
        Button(action: { self.showingProfiles.toggle()}){
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                FeaturedLanmarks(landmarks: featured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted(), id: \.self){ key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
            .listRowInsets(EdgeInsets())
            
                NavigationLink(destination: LandmarkList()){
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: ProfileButton)
            .sheet(isPresented: $showingProfiles){
                Text("User Profile")
            }
        }
    }
}

struct FeaturedLanmarks: View{
    var landmarks: [Landmark]
    var body: some View{
        landmarks[0].image.resizable()
    }
}
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
