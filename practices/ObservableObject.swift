//
//  ObservableObject.swift
//  MDI1-103-data-structures
//
//  Created by Christian Bonilla on 8/28/25.
//

import SwiftUI

// Model -> ObservableObject
class UserModel: ObservableObject {
    @Published var name: String = "Christian Bonilla"
    @Published var age: Int = 21
}

// Parent View -> ProfileView
struct MainView: View {
    
    @StateObject private var userModel = UserModel()
    
    var body: some View {
        // Call the views...
        ProfileView(user: userModel)
        EditProfileView(user: userModel)
    }
}

// ProfileView
struct ProfileView: View {
    
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack{
            Text("User Profile")
                .font(.headline)
            
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
        }
        .padding()
        .background(Color.blue.opacity(0.5))
    }
}

// EditProfileView
struct EditProfileView: View {
    
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack{
            Text("Edit Profile")
                .font(.headline)
            
            TextField("Enter your name", text: $user.name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Stepper("Age: \(user.age)", value: $user.age, in: 0...100)
                .padding()
        }
        .padding()
    }
}

// Child View -> EditProfileView


#Preview {
    MainView()
}
