//
//  SidesView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct SidesView: View {
    var body: some View {
        LazyVStack {
            ForEach(allSides) { side in
                HStack {
                    Image(side.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    VStack {
                        Text(side.name)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .frame(width: 100.0)
                            .dynamicTypeSize(.large)
                            .multilineTextAlignment(.center)
                        
                        Text("$\(side.price) per side")
                            .fontWeight(.semibold)
                            .dynamicTypeSize(.medium)
                    }
                    .padding(.horizontal)
                    
                    Text(side.description)
                        .fontWeight(.ultraLight)
                        .dynamicTypeSize(.small)
                        .multilineTextAlignment(.leading)
                        .frame(width: 180.0)
                    
                    Button(action: {
                        print("\(side.name) added to order. ")
                        updateSides(addedSide: side)
                    }) {
                        Text("Add to order")
                    }
                    .padding()
                    
                }
                Divider()
            }
        }
    }
}

struct SidesView_Previews: PreviewProvider {
    static var previews: some View {
        SidesView()
    }
}
