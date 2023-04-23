//
//  ContentView.swift
//  Alert
//
//  Created by Phu Bao on 20/04/2023.
//

import SwiftUI
import Combine

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}
struct ContentView: View {
    @State private var selectedShow: TVShow?
    @State private var showAlert = false
    @State private var selectingChannel = "None"
    @State private var searchKey = ""
    @State private var viewTransition = false

    let prefixSelect = "Selecting Channel: "
    var prefixedSelectingChannel: Binding<String> {
        Binding<String>(
            get: {
                return prefixSelect + selectingChannel
            },
            set: {
                let value = $0.replacingOccurrences(of: prefixSelect, with: "")
                selectingChannel = value
            }
        )
    }
    var alert2: Alert {
        Alert(title: Text("SwiftUI"),
              message: Text("This is tutorial for SwiftUI Alert"),
              primaryButton: .destructive(Text("OK")
        ) {
            viewTransition = true
        }, secondaryButton: .cancel(Text("Cancel")))
    }
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 20) {
                Text("What is your favorite TV show?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                Text("\(prefixSelect + selectingChannel)")
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                Button("Select HTV3") {
                    handleSelectChannel(text: "HTV3")
                }
                .buttonStyle(CustomButtonChannelStyle())
                Button("Select HTV7") {
                    handleSelectChannel(text: "HTV7")
                }
                .buttonStyle(CustomButtonChannelStyle())
                Button("Select HTV9") {
                    handleSelectChannel(text: "HTV9")
                }
                .buttonStyle(CustomButtonChannelStyle())
                Spacer().frame(height: 20)
                Button("Select VTV3") {
                    handleSelectChannel(text: "VTV3")
                }
                .buttonStyle(CustomButtonChannelStyle())
            }.alert(item: $selectedShow) { show in
                Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .cancel(Text("Got it")))
                }

            VStack(spacing: 20) {
                Button("Select other program") {
                    self.showAlert = true
                    selectingChannel = "Other Program"
                }.padding().alert(isPresented: $showAlert, content: {
                    self.alert2
                }).sheet(isPresented: $viewTransition, content: {
                    ChannelView(channelName: $selectingChannel, viewTransition: $viewTransition)
                })
                Text("Programming Search key: \(searchKey)")
                TextField("Search Program By Text", text: $searchKey)
                    .padding(20.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.red)
            }
        }
    }

    func handleSelectChannel(text: String) {
        selectedShow = TVShow(name: text)
        selectingChannel = text
        viewTransition = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
