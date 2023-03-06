//
//  ContentView.swift
//  Bonus Challenge
//
//  Created by imac on 03/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image1 = "image1"
    @State private var image2 = "image2"
    @State private var image3 = "image3"
    @State private var credits = 1000
    
    var body: some View {
        VStack() {
            Spacer()
            Text("Try to match them")
                .font(.title)
                .fontWeight(.heavy)
            Spacer()
            Text("Credits: \(credits)")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            HStack() {
                Image(image1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(image2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image(image3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            Button(action: {
                let image1Rand = Int.random(in: 1...3)
                let image2Rand = Int.random(in: 1...3)
                let image3Rand = Int.random(in: 1...3)
                
                //update cards
                image1 = "image" + String(image1Rand)
                image2 = "image" + String(image2Rand)
                image3 = "image" + String(image3Rand)
                
                //update score
                if image1Rand == image2Rand && image2Rand == image3Rand {
                    credits += 200
                }
                else {
                    credits -= 25
                }
            }, label: {
                Text("Spin")
                    .padding()
                    // Then adjust the left and right padding to be bigger
                    .padding([.leading, .trailing], 40)
                    .foregroundColor(.white)
                    .background(Color(.systemPink))
                    .cornerRadius(25)
                    .font(.system(size: 18, weight: .bold, design: .default))
            })
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
