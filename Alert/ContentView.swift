//
//  ContentView.swift
//  Alert
//
//  Created by Phu Bao on 20/04/2023.
//

import SwiftUI

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}
struct ContentView: View {
    @State private var selectedShow: TVShow?

    @State private var showAlert = false

    var alert2: Alert {
        Alert(title: Text("SwiftUI"),
              message: Text("This is tutorial for SwiftUI Alert"), dismissButton: .default(Text("OK")))
    }
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Text("What is your favorite TV show?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Button("Select HTV7") {
                    selectedShow = TVShow(name: "HTV7")
                }

                Button("Select HTV9") {
                    selectedShow = TVShow(name: "HTV9")
                }

                Button("Select VTV3") {
                    selectedShow = TVShow(name: "VTV3")
                }
            }
            .alert(item: $selectedShow) { show in
                Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .cancel(Text("Got it")))
            }


                Button("Select other program") {
                    self.showAlert = true
                }.padding().alert(isPresented: $showAlert, content: {
                    self.alert2
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
