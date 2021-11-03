//
//  SwiftUIView.swift
//  Panucci's Pizza
//
//  Created by Michael Adams on 10/31/21.
//

import SwiftUI

struct AttributionsView: View {
    var body: some View {
        Link("Food photo created by KamranAydinov - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/food")!)
        Link("Food photo created by Racool_studio - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/food")!)
        Link("Light photo created by Racool_studio - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/light")!)
        Link("Water photo created by freepik - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/water")!)
        Link("Food photo created by jcomp - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/food")!)
        Link("Food photo created by mrblmoreno - www.freepik.com",
              destination: URL(string: "https://www.freepik.com/photos/food")!)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AttributionsView()
    }
}
