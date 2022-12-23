//
//  ContentView.swift
//  FutureProfession
//
//  Created by Danil Bochkarev on 22.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State var contentStatus = false
    
    var body: some View {
        
        if contentStatus {
            TakePhotoWithCamera()
        } else {
            ZStack {
                backgroundFone()
                
                VStack(spacing: 40) {
                    Text("Hi! I can use your \n picture to guess \n your future \n profession").font(Font.custom("Bahiana-Regular", size: 60))
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 5) {
                        Text("Interested?").font(Font.custom("Bahiana-Regular", size: 60))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                            .multilineTextAlignment(.center)
                        
                        Button {
                            contentStatus.toggle()
                        } label: {
                            Text("Let's get started!").font(Font.custom("Bahiana-Regular", size: 60))
                                .foregroundColor(Color("Color4"))
                                .shadow(color: Color.black.opacity(0.3), radius: 1, x: 2)
                                .multilineTextAlignment(.center)
                                .frame(width: 330, height: 65)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                    }
                }
                
                circleTwo()
                    .offset(x:-200, y: -400)
                
                circleThree()
                    .offset(x:200, y: 400)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct circleTwo: View {
    @State var isAnimation = false
    @State private var value = true
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white.opacity(0.25))
                .frame(width: 330)
                .ignoresSafeArea()
                .offset(x: 1, y: 1)
                .scaleEffect(isAnimation ? 0.95 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
            
            Circle()
                .foregroundColor(Color.white.opacity(0.5))
                .frame(width: 230)
                .ignoresSafeArea()
                .offset(x: 1, y: 1)
                .scaleEffect(isAnimation ? 0.95 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
        }
        .onAppear {
            withAnimation(.linear(duration: 0.5)) {
                self.isAnimation = true
                value = false
            }
        }
    }
}

struct circleThree: View {
    @State var isAnimation = false
    @State private var value = true
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("Color1").opacity(0.25))
                .frame(width: 330)
                .ignoresSafeArea()
                .offset(x: 1, y: 1)
                .scaleEffect(isAnimation ? 0.95 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
            
            Circle()
                .foregroundColor(Color("Color1").opacity(0.5))
                .frame(width: 230)
                .ignoresSafeArea()
                .offset(x: 1, y: 1)
                .scaleEffect(isAnimation ? 0.95 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
        }
        .onAppear {
            withAnimation(.linear(duration: 0.5)) {
                self.isAnimation = true
                value = false
            }
        }
    }
}
