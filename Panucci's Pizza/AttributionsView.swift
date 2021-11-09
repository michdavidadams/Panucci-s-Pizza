//
//  SwiftUIView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//  Attributions screen

import SwiftUI

struct AttributionsView: View {
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("Created by:")
                        .font(.title)
                        .padding(.top)
                    HStack {
                        Text("Michael Adams")
                        Text("Hunter Dorminey")
                        Text("Christian Guyer")
                        Text("Julian Yankah")
                        Text("Juan Guevara")
                        Text("Cody Lacey")
                    }
                    .padding()
                }
                Divider()
                VStack {
                    Text("Images by:")
                        .font(.title)
                        .padding(.top)
                    VStack(alignment: .center) {
                        Link("Food photo created by KamranAydinov - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/food")!)
                            .padding()
                            .foregroundColor(.red)
                        Link("Food photo created by Racool_studio - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/food")!)
                            .padding()
                            .foregroundColor(.orange)
                        Link("Light photo created by Racool_studio - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/light")!)
                            .padding()
                            .foregroundColor(.yellow)
                        Link("Water photo created by freepik - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/water")!)
                            .padding()
                            .foregroundColor(.green)
                        Link("Food photo created by jcomp - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/food")!)
                            .padding()
                            .foregroundColor(.blue)
                        Link("Food photo created by mrblmoreno - www.freepik.com",
                             destination: URL(string: "https://www.freepik.com/photos/food")!)
                            .padding()
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AttributionsView()
    }
}
