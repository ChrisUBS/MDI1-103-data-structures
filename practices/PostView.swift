//
//  PostView.swift
//  MDI1-103-data-structures
//
//  Created by Christian Bonilla on 8/28/25.
//

import SwiftUI

class PostModel: ObservableObject {
    // Attributes that can be modified
    @Published var username: String
    @Published var likeCount: Int
    @Published var caption: String
    
    // Attributes that should not be modified
    let imageName: String
    let postDate: String

    init(username: String, caption: String, imageName: String, postDate: String, likeCount: Int = 0) {
        self.username = username
        self.caption = caption
        self.imageName = imageName
        self.postDate = postDate
        self.likeCount = likeCount
    }
}

struct PostView: View {
    @ObservedObject var post: PostModel = PostModel(
        username: "christian.bonilla",
        caption: "⛱️🎶 having fun vacations!",
        imageName: "vacation",
        postDate: "May 31"
    )
    @State private var isLiked: Bool = false

    var body: some View {
        VStack {
            // Username row
            HStack {
                Image(systemName: "person.circle")
                Text(post.username)
                Spacer()
            }

            // Main post image
            Image(post.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 500)

            // Like button and counter
            LikeButton(isLiked: $isLiked, likeCount: $post.likeCount)

            // Caption row
            HStack {
                Text(post.caption)
                Spacer()
            }

            // Date row
            HStack {
                Text(post.postDate)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.vertical)
        }
        .padding()
        // Update like count whenever "isLiked" changes
        .onChange(of: isLiked) {
            if isLiked {
                post.likeCount += 1
            } else {
                post.likeCount = max(0, post.likeCount - 1)
            }
        }
    }
}

struct LikeButton: View {
    @Binding var isLiked: Bool
    @Binding var likeCount: Int

    var body: some View {
        HStack {
            Button {
                isLiked.toggle()
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .gray)
            }

            // Display like counter
            Text("\(likeCount)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding(.vertical)
    }
}

#Preview {
    PostView()
}
