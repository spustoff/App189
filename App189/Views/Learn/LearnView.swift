//
//  LearnView.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI

struct LearnView: View {
    
    @StateObject var viewModel = LearnViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Button(action: {
                        
                        viewModel.isFavs.toggle()
                        
                    }, label: {
                        
                        VStack(alignment: .trailing) {
                            
                            Image(systemName: viewModel.isFavs ? "bookmark.fill" : "bookmark")
                                .foregroundColor(viewModel.isFavs ? Color("red") : .white)
                                .frame(width: 50, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                        }
                    })
                    
                    Text("Learn")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                .padding(.top, 40)
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .padding(.bottom)
                
                if viewModel.getItems().isEmpty {
                    
                    VStack(spacing: 7) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.top, 150)
                        
                        Text("No favorites video")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.lessons.isEmpty {
                            
                            VStack(spacing: 5) {
                                
                                Text("No Videos")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("No any video")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.lessons, id: \.self) { index in
                                        
                                        VStack {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedLesson = index
                                                viewModel.isDetail = true
                                                viewModel.video_watched += 1
                                                viewModel.progress += 5
                                                
                                                
                                            }, label: {
                                                
                                                VStack(alignment: .leading, spacing: 10) {
                                                    
                                                    if let image = index.image {
                                                        
                                                        ZStack {
                                                            
                                                            WebPic(urlString: image, width: .infinity, height: 375, cornerRadius: 15, isPlaceholder: true)
                                                            
                                                            Image("play")
                                                            
                                                            VStack {
                                                                
                                                                Spacer()
                                                                
                                                                HStack {
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Button(action: {
                                                                        
                                                                        viewModel.favoritesManager(index)
                                                                        
                                                                    }, label: {
                                                                        
                                                                        VStack(alignment: .trailing) {
                                                                            
                                                                            Image(systemName: viewModel.isFavorited(index) ? "bookmark.fill" : "bookmark")
                                                                                .foregroundColor(viewModel.isFavorited(index) ? Color("red") : .white)
                                                                                .frame(width: 50, height: 50)
                                                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                                                            
                                                                        }
                                                                    })
                                                                    .padding()
                                                                }
                                                            }
                                                        }
                                                    }
                                                    
                                                    Text(index.title ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 17, weight: .bold))
                                                        .multilineTextAlignment(.leading)
                                                        .lineLimit(2)
                                                    
                                                    Text("\(index.duration ?? 0) min")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 16, weight: .regular))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                .padding(4)
                                                .padding(.bottom)
                                            })
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            
            viewModel.getCategories(category_id: "")
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            LearnDetail(index: viewModel.selectedLesson)
        })
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
