//
//  MoreView.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI
import StoreKit

struct MoreView: View {
    
    @State var isReset: Bool = false

    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Image("settingss")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .opacity(0)
                    
                    
                    Text("More")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("red"))
                                    .frame(width: 30, height: 30)
                                
                                Text("Rate app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                        
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/7ddc6660-b016-4741-bf0e-725cd22ada27") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "bubble.right.fill")
                                    .foregroundColor(Color("red"))
                                    .frame(width: 30, height: 30)

                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundColor(Color("red"))
                                    .frame(width: 30, height: 30)
                                
                                Text("Reset progress")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.3)))
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .overlay (
            
            ZStack {
                
                Color.black.opacity(isReset ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                isReset = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Reset progress?")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to reset your progress? It will be permanently deleted")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            isReset = false
                        }
                        
                    }, label: {
                        
                        Text("Reset")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                .padding()
                .offset(y: isReset ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
