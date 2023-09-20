//
//  Join.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    let isContacts: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 7, content: {
                    
                    Text("Join our Telegram Channel")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("And trade with our team")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 16, weight: .regular))
                })
                .padding(.top, 30)
                .padding(.horizontal)
                
                Spacer()

                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("b")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        if isContacts == true {
                            
                            Users_4()
                                .navigationBarBackButtonHidden()
                            
                        } else if isContacts == false {
                            
                            Notifications()
                                .navigationBarBackButtonHidden()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(.gray.opacity(0.1)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


struct Join_Previews: PreviewProvider {
    static var previews: some View {
        Join(telegram: URL(string: "h")!, isContacts: false)
    }
}
