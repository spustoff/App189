//
//  HistoryView.swift
//  App189
//
//  Created by IGOR on 12/09/2023.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = HistoryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Text("History")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 50)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("bg2"))
                
                if viewModel.history.isEmpty {
                    
                    VStack(spacing: 9, content: {
                        
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                        
                        Text("There's no history")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Add your first spending spree")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.history, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, content: {
                                        
                                        Text((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        HStack {
                                            
                                            Text(index.pair ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Circle()
                                                .fill(.green)
                                                .frame(width: 15, height: 15)
                                            
                                            Text(index.category ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                    })
                                    
                                    Spacer()
                                    
                                    Text("$\(index.amount)")
                                        .foregroundColor(.green)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            
            viewModel.fetchHistory()
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
