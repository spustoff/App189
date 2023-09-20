//
//  RSplash.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct RSplash: View {
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("RSplash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                
                VStack(spacing: 7, content: {
                    
                    Text("Financial accounting in your pocket")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Add it all at once")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 16, weight: .regular))
                })
                .padding(.top, 30)
                
                Spacer()

                HStack {
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    RSplash2()
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

#Preview {
    RSplash()
}
