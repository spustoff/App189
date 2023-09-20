//
//  MainView.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    @AppStorage("balance") var balance: Int = 0
    @AppStorage("specify") var specify = ""
    
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
                    
                    
                    Text("Main")
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
                    
                    LazyVStack {
                        
                        VStack {
                            
                            HStack {
                                
                                ForEach(viewModel.operations, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.current_option = index
                                        
                                    }, label: {
                                        
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .regular))
                                            .padding(4)
                                        
                                    })
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.3)).opacity(viewModel.current_option == index ? 1 : 0))
                                    
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.3)))
                            .padding()
                            
                            Text("Your limit for today")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                            
                            HStack {
                                
                                let del = balance * 100 / (Int(viewModel.limit) ?? 1)
                                
                                Text("\(del)%")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                
                                if viewModel.current_option == "Expenses" {
                                    
                                    Text("$ \(viewModel.expenses) / $ \(String(Int(viewModel.limit) ?? 0))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                } else {
                                   
                                    Text("$ \(viewModel.income) / $ \(String(Int(viewModel.limit) ?? 0))")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 18, weight: .regular))
                                    
                                }
                                
                            }
                            .padding(6)
                            
                            GeometryReader { reader in
                                
                                let result = CGFloat((CGFloat(balance) * reader.size.width)) / CGFloat(Int(viewModel.limit) ?? 1)
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.gray.opacity(0.2))
                                        .frame(width: reader.size.width, height: 7)
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color("red"))
                                        .frame(width: result, height: 7)
                                })
                            }
                            .frame(height: 10)
                            .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Currency")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top)
                            .padding(.horizontal)
                        
                        HStack {
                            
                            Image("EURUSD")
                                .padding()
                            
                            Text("EUR/USD")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .regular))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.isChange = true
                                
                            }, label: {
                                
                                Text("Change")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(6)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                                    .padding(.horizontal)
                            })
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        Text("Your categories")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(viewModel.things) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.current_thing = index
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Circle()
                                                .fill(index.color)
                                                .frame(width: 10, height: 10)
                                                .padding(.horizontal, 7)
                                            
                                            Text(index.title)
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .regular))
                                            
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.1)))
                                        .overlay(
                                                                                    
                                            RoundedRectangle(cornerRadius: 5).stroke(Color("red"))
                                                .opacity(viewModel.current_thing == index ? 1 : 0)
                                        )
                                    })
                                }
                            }
                            .padding(1)
                        }
                        .padding(.leading)
                        
                        Text("Add the amount")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter amount")
                                .foregroundColor(viewModel.amount.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.amount.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.amount)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        .padding(.horizontal)
                        
                        HStack {
                            
                            Text("$\(viewModel.amount)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                            
                            Spacer()
                            
                            
                            Text("Limit: \(viewModel.limit)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                                .opacity(viewModel.limit.isEmpty ? 0 : 1)
                                                        
                                Button(action: {
                                    
                                    viewModel.isLimit = true
                                    
                                }, label: {
                                    
                                    
                                    Text("Set a limit")
                                        .foregroundColor(.red.opacity(0.7))
                                        .font(.system(size: 17, weight: .regular))
                                })

                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                            if viewModel.current_option == "Expenses" {
                                
                                balance += Int(viewModel.amount) ?? 0
                                
                                viewModel.expenses += Int(viewModel.amount) ?? 0
                                
                            } else {
                                
                                balance += Int(viewModel.amount) ?? 0
                                
                                viewModel.income += Int(viewModel.amount) ?? 0
                                
                            }
                            
                            viewModel.addToHistory(completion: {
                                
                                viewModel.current_thing = nil
                                viewModel.amount.removeAll()
    //                            viewModel.limit.removeAll()
                            })
                            
                        }, label: {
                                                    
                            Text("Add ($\(viewModel.amount))")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("red")))
                                .padding(.horizontal)
                                .padding(.top)
                        })
                        .opacity(viewModel.current_thing == nil || viewModel.amount.isEmpty || viewModel.limit.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.current_thing == nil || viewModel.amount.isEmpty || viewModel.limit.isEmpty ? true : false)
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .sheet(isPresented: $viewModel.isLimit, content: {
            
            LimitsView()
        })
        .sheet(isPresented: $viewModel.isChange, content: {
            
            CurrencyView()
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
