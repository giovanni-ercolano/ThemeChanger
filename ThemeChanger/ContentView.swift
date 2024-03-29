//
//  ContentView.swift
//  ThemeChanger
//
//  Created by Giovanni Ercolano on 08/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var changeTheme : Bool = false
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    
    var body: some View {
        NavigationStack{
            List{
                Section("Apparance"){
                    Button("Change Theme"){
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangerView(scheme: scheme)
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ContentView()
}
