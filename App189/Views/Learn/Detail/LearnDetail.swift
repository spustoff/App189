//
//  LearnDetail.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI
import AVKit

struct LearnDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: VideoItem
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Video")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            if let url = URL(string: index.video ?? "") {
                                
                                VideoPlayer(player: AVPlayer(url: url))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 210)
                                    .cornerRadius(7)
                            }
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text(index.title ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(2)
                                
                                Text("Category ID: \(index.categoryId ?? 0)")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        }
                        .background(RoundedRectangle(cornerRadius: 7).fill(.gray.opacity(0.1)))
                        
                        VStack(spacing: 5) {
                            
                            Text("No Comments")
                                .foregroundColor(.gray)
                                .font(.system(size: 17, weight: .semibold))
                            
                            Text("No any comment on the post")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding(.vertical, 100)
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct LearnDetail_Previews: PreviewProvider {
    static var previews: some View {
        LearnDetail(index: VideoItem(id: 0, categoryId: 0, title: "dsam", image: "dp", video: "", duration: 0))
    }
}

