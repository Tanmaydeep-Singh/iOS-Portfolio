//
//  HomeView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 24/01/26.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("profilePic")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(
                    Circle().stroke(Color.blue, lineWidth: 3)
                )
                .padding()

            
            VStack(alignment: .center) {
                Text("Tanmaydeep Singh")
                    .font(.title)
                    .fontWeight(.bold)
                Text("iOS | Unity | Full Stack")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text("Hi I'm a software engineer. I like to build things.")
                    .padding(10)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button("View Projects"){
                path.append(Route.projectGallery)
            }
                .padding()
                .background(Color.primary)
                            .clipShape(Capsule())

        }
        .navigationTitle("Home")
        .padding()
    }
}

#Preview {
    HomeView(path: .constant(NavigationPath()))
}
