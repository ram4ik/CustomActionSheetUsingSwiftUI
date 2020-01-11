//
//  ContentView.swift
//  CustomActionSheetUsingSwiftUI
//
//  Created by Ramill Ibragimov on 09.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            Button(action: {
                self.show.toggle()
            }) {
                Text("Action Sheet")
            }
            
            VStack {
                Spacer()
                CustomActionSheet()
                    .offset(y: self.show ? 0 : UIScreen.main.bounds.height)
            }
            .background((self.show ? Color.black.opacity(0.3) : Color.clear)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.show.toggle()
            })
            .edgesIgnoringSafeArea(.bottom)
        }.animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.dark, .light], id: \.self) { schema in
            ContentView().edgesIgnoringSafeArea(.all)
                .previewDevice("iPhone X")
                .previewLayout(.fixed(width: 400, height: 700))
            .colorScheme(schema)
        }
        
    }
}

struct CustomActionSheet: View {
    @State var show1 = false
    @State var show2 = false
    @State var show3 = false
    @State var show4 = false
    @State var count = 0
    
    var body: some View {
        VStack(spacing: 15) {
            Toggle(isOn: self.$show1) {
                Text("Notifications")
            }
            Toggle(isOn: self.$show2) {
                Text("Likes")
            }
            Toggle(isOn: self.$show3) {
                Text("Comments")
            }
            Toggle(isOn: self.$show4) {
                Text("Subscribers Count")
            }
            Stepper(onIncrement: {
                self.count += 1
            }, onDecrement: {
                if self.count != 0 {
                    self.count -= 1
                }
            }) {
                Text("Notification Limit = \(self.count)")
            }
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(Color.white)
        .cornerRadius(25)
    }
}
