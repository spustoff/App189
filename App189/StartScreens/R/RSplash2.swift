//
//  RSplash2.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct RSplash2: View {
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("RSplash2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                                
                VStack(spacing: 7, content: {
                    
                    Text("Detailed statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Median rates, standard deviation and other")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 16, weight: .regular))
                })
                .padding(.top, 30)
                
                Spacer()

                HStack {
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
                
                NavigationLink(destination: {
                    
                    RSplash3()
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

struct RSplash2_Previews: PreviewProvider {
    static var previews: some View {
        RSplash2()
    }
}
