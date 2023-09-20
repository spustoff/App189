//
//  Reviews.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 7, content: {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("It will help us make it even better")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 16, weight: .regular))
                })
                .padding(.top, 30)
                .padding(.horizontal)
                
                Spacer()

                HStack {

                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                }
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram, isContacts: isContacts)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        if isContacts == true {
                            
                            Users_4()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Notifications()
                                .navigationBarBackButtonHidden()
                        }
                    }
                    
                }, label: {
                    
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                        .padding()
                })
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

struct Reviews_Previews: PreviewProvider {
    static var previews: some View {
        Reviews(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
