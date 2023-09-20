//
//  USplash.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct USplash: View {
    
    let telegram: URL
    let isTelegram: Bool
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("USplash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 7, content: {
                    
                    Text("It's all in your pocket")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Easily achieve your successes")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 16, weight: .regular))
                })
                .padding(.top, 30)
                .padding(.horizontal)
                
                Spacer()

                HStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)

                }
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram, isContacts: isContacts)
                        .navigationBarBackButtonHidden()
                    
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
    }
}

struct USplash_Previews: PreviewProvider {
    static var previews: some View {
        USplash(telegram: URL(string: "h")!, isTelegram: false, isContacts: false)
    }
}
