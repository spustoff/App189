//
//  StatisticsView.swift
//  App189
//
//  Created by IGOR on 12/09/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("balance") var balance: Int = 0
    @AppStorage("specify") var specify = ""
    @AppStorage("income") var income: Int = 0
    @AppStorage("expenses") var expenses: Int = 0
    @AppStorage("limit") var limit = ""
    
    @State var isSavings: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Button(action: {
                        
                        isSavings = true
                        
                    }, label: {
                        
                        
                        Image("settingss")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                        
                    })
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                .padding(.top, 40)
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack {
                            
                            Text("$\(balance)")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .padding(.top)
                            
                            HStack {
                                
                                Text("Your balance")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                                
                            }
                            .padding(.bottom)
                        }
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        
                        
                        VStack {
                            
                            HStack {
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.3)))
                            .padding()
                            
                            Text("There's still time to save up this month")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            HStack {
                                
                                let del = balance * 100 / (Int(specify) ?? 1)
                                
                                Text("\(del)%")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("$ \(balance) / $ \(String(Int(specify) ?? 0))")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .regular))
                                
                            }
                            .padding(6)
                            
                            GeometryReader { reader in
                                
                                let result = CGFloat((CGFloat(balance) * reader.size.width)) / CGFloat(Int(specify) ?? 1)
                                
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
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            VStack(spacing: 8) {
                                
                                Text("$ \(expenses)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.top)
                                
                                Text("Total spent for the month")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            
                            VStack(spacing: 8) {
                                
                                Text("$ \(income)")
                                    .foregroundColor(.green)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.top)
                                
                                Text("Total earings for the month")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            
                            VStack(spacing: 8) {
                                
                                Text("$ \(income)")
                                    .foregroundColor(.green)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.top)
                                
                                Text("Average income")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            
                            VStack(spacing: 8) {
                                
                                Text("$ \(expenses)")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding(.top)
                                
                                Text("Average expenses")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                                
                            }
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                        })
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .sheet(isPresented: $isSavings, content: {
            
            SpecifyView()
        })
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
