//
//  Binding.swift
//  MDI1-103-data-structures
//
//  Created by Christian Bonilla on 8/28/25.
//

import SwiftUI

// MARK: - Two Ways Binding - $variableName

struct NameView: View {
    
    @State private var name: String = ""
    
    var body: some View {
        Form {
            Text("What is your name?")
            
            TextField("Write your name", text: $name)
            
            Text("Your name is \(name)")
        }
    }
}

// MARK: - Binding Wrapper -> @Binding
/// It is used when you want to have multiple views
/// The child view will access (read and write) the parent variable

// Parent View
struct SwitchView: View {
    
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            // Ternary Operator
            Text(isOn ? "Switch is ON" : "Switch is OFF")
            
            // Toggle View -> Child View
            ToggleView(isOn: $isOn)
        }
    }
}

// Child View
struct ToggleView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Switch", isOn: $isOn)
            .padding()
    }
}

#Preview {
//    NameView()
    SwitchView()
}
