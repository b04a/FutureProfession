//
//  LoadingScreen.swift
//  FutureProfession
//
//  Created by Danil Bochkarev on 22.12.2022.
//

import SwiftUI

struct LoadingScreen: View {
    @State var loadingStatus = false

    var body: some View {
        if loadingStatus {
            ContentView()
        } else {
            ZStack {
                backgroundFone()
                
                ZStack {
                    circleOne()
                }
                
                mainString()
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.loadingStatus = true
                }
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}

struct backgroundFone: View {
    var body: some View {
        LinearGradient(colors: [Color("Color3"), Color("Color2"), Color("Color1")], startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea(.all)
    }
}

struct mainString: View {
    var body: some View {
        ZStack {
            Text("future").font(Font.custom("Bahiana-Regular", size: 140))
            Text("profession").font(Font.custom("Bahiana-Regular", size: 100))
                .padding(.top, 190)
        }
        .foregroundColor(Color.white)
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5)
        .padding(.bottom, 70)
        
    }
}

struct circleOne: View {
    @State var isAnimation = false
    @State private var value = true
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("Color3").opacity(0.3))
                .frame(width: 700)
                .scaleEffect(isAnimation ? 0.95 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
            
            Circle()
                .foregroundColor(Color("Color2").opacity(0.3))
                .frame(width: 600)
                .scaleEffect(isAnimation ? 0.85 : 1)
                .animation(Animation.easeInOut.repeatForever(), value: value)
            
            Circle()
                .foregroundColor(Color("Color1").opacity(0.3))
                .frame(width: 500)
                .scaleEffect(isAnimation ? 0.7 : 1)
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
