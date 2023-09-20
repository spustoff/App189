//
//  CurrencyView.swift
//  App189
//
//  Created by IGOR on 11/09/2023.
//

import SwiftUI

struct CurrencyView: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.red.opacity(0.7))
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.red.opacity(0.7))
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()
                        }
                    })
                    
                    Text("Edit limits")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding()
                .padding(.top)
                .background(Color("bg2"))
                
                TradeChart(coin: viewModel.current_cur)
                    .disabled(true)
                
                Menu {
                    
                    ForEach(viewModel.currencies, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_cur = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("\(index)")
                                
                                Spacer()
                                
                                if viewModel.current_cur == index {
                                    
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                }
                            }
                        })
                    }
                    
                } label: {
                    
                    Text("\(viewModel.current_cur)")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 45)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                }
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                        .padding()
                })
                
            }
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
