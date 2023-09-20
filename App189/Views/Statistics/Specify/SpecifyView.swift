//
//  SpecifyView.swift
//  App189
//
//  Created by IGOR on 12/09/2023.
//

import SwiftUI

struct SpecifyView: View {
    
    @State var spec = ""
    
    @AppStorage("specify") var specify = ""
    
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
                    
                    Text("Desired savings")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                }
                .padding(.top)
                .padding()
                .background(Color("bg2"))
                
                Text("Specify per month")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Enter amount")
                        .foregroundColor(spec.isEmpty ? .gray : .white)
                        .font(.system(size: 13, weight: .medium))
                        .opacity(spec.isEmpty ? 1 : 0)
                    
                    TextField("", text: $spec)
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .medium))
                        .keyboardType(.decimalPad)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    specify = spec
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("red")))
                        .padding(.horizontal)
                })
                .opacity(spec.isEmpty ? 0.5 : 1)
                .disabled(spec.isEmpty ? true : false)
            }
        }
    }
}

struct SpecifyView_Previews: PreviewProvider {
    static var previews: some View {
        SpecifyView()
    }
}
