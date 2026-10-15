//
//  OTP.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//



import SwiftUI

struct OTP: View {

    @State private var otp = ["", "", "", ""]

    @FocusState private var focusedField: Int?
    
    @Environment(\.dismiss) var dismiss

    var body: some View {

        VStack{
            VStack(alignment: .leading) {
                
                // Back Button
                Button {
                    dismiss()
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .frame(width: 24, height: 24)
                        .font(.title3)
                }
                .padding(.top, 10)
                
                Spacer()
                    .frame(height: 40)
                
                // Title
                Text("Verification")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(
                        red: 35/255,
                        green: 35/255,
                        blue: 45/255
                    ))
                
                Spacer()
                    .frame(height: 10)
                
                // Subtitle
                Text("Enter the OTP code we sent you")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
                    .frame(height: 35)
                
                // OTP Fields
                HStack(spacing: 14) {
                    
                    ForEach(0..<4, id: \.self) { index in
                        
                        TextField("", text: $otp[index])
                        
                            .frame(width: 55, height: 55)
                        
                            .background(
                                Color(
                                    red: 245/255,
                                    green: 245/255,
                                    blue: 248/255
                                )
                            )
                        
                            .cornerRadius(12)
                        
                            .multilineTextAlignment(.center)
                        
                            .keyboardType(.numberPad)
                        
                            .font(.title2)
                        
                            .focused($focusedField, equals: index)
                        
                            .onChange(of: otp[index]) { value in
                                
                                if value.count > 1 {
                                    otp[index] = String(value.prefix(1))
                                }
                                
                                if !value.isEmpty {
                                    
                                    if index < 3 {
                                        focusedField = index + 1
                                    }
                                    
                                } else {
                                    
                                    if index > 0 {
                                        focusedField = index - 1
                                    }
                                }
                            }
                    }
                }
                
                Spacer()
                    .frame(height: 30)
                
                // Resend Text
                HStack {
                    
                    Spacer()
                    
                    Text("Resend in 00:30")
                        .font(.subheadline)
                        .foregroundColor(.gray.opacity(0.6))
                    
                    Spacer()
                }
                
                Spacer()
                
                // Next Button
                HStack {
                    
                    Spacer()
                    
                    NavigationLink {
                        StartupScreen()
                            .navigationBarBackButtonHidden()
                        
                    } label: {
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                            .font(.title3)
                            .frame(width: 60, height: 60)
                            .background(
                                Color(
                                    red: 47/255,
                                    green: 72/255,
                                    blue: 89/255
                                )
                            )
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 24)
            .onAppear {
                
                focusedField = 0
            }
        }
    }
}

#Preview {

    OTP()
}
