//
//  HistoryFilter.swift
//  App189
//
//  Created by IGOR on 12/09/2023.
//

import SwiftUI

struct HistoryFilter: View {
    
    @StateObject var viewModel: HistoryViewModel
    @StateObject var mainModel = MainViewModel()
    
    @Environment(\.presentationMode) var router
    
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
                    
                    Text("Filters")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(.top)
                .padding()
                .background(Color("bg2"))
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 30) {
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Category")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: true) {
                                
                                HStack {
                                    
                                    ForEach(mainModel.things) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.filter_category = index.title
                                            
                                        }, label: {
                                            
                                            HStack {
                                                
                                                Circle()
                                                    .fill(index.color)
                                                    .frame(width: 10, height: 10)
                                                    .padding(.horizontal, 7)
                                                
                                                Text(index.title)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                                            .overlay(
                                                                                        
                                                RoundedRectangle(cornerRadius: 15).stroke(Color("red"))
                                                    .opacity(viewModel.filter_category == index.title ? 1 : 0)
                                            )
                                        })
                                    }
                                }
                                .padding(1)
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Currency")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ScrollView(.horizontal, showsIndicators: true) {
                                
                                HStack {
                                    
                                    ForEach(["EURUSD", "EURTRY", "EURKZT", "EURJPY", "USDTRY", "USDKZT", "USDJPY"], id: \.self) { index in
                                        
                                        Button(action: {
                                            
                                            viewModel.currency = index
                                            
                                        }, label: {
                                            
                                            HStack {
                                                
                                                Text(index)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 14, weight: .regular))
                                                
                                            }
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.1)))
                                            .overlay(
                                                                                        
                                                RoundedRectangle(cornerRadius: 15).stroke(Color("red"))
                                                    .opacity(viewModel.currency == index ? 1 : 0)
                                            )
                                        })
                                    }
                                }
                                .padding(1)
                            }
                        })
                        
                        VStack(alignment: .leading, content: {
                            
                            Text("Amount")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.amount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.amount)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        })
                    }
                    .padding()
                }
            }
        }
    }
}

struct HistoryFilter_Previews: PreviewProvider {
    static var previews: some View {
        HistoryFilter(viewModel: HistoryViewModel())
    }
}
