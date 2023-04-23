//
//  ChannelView.swift
//  Alert
//
//  Created by Phu Bao on 22/04/2023.
//

import SwiftUI

struct ChannelView: View {
    @Binding var channelName: String
    @Binding var viewTransition: Bool

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
            VStack {
                Text("Welcome to \(channelName)")
                    .padding()
                Button("Close", action: {
                    viewTransition = false
                })
            }
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView(channelName: .constant(""), viewTransition: .constant(false))
    }
}
