//
//  MainResult.swift
//  FutureProfession
//
//  Created by Danil Bochkarev on 23.12.2022.
//

import SwiftUI

struct MainResult: View {
    @State var loadingStatus1 = true //true!
    
    var body: some View {
        Text("123")
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}

func Profession() -> String {
    let result = ["TAXIST 🚕", "POLICE 🚓", "MEDIC 🚑", "FIREFIGHTER 🚒", "TRACTORIST 🚜"]
    
    return result[Int.random(in: 0...4)]
}

struct MainResult_Previews: PreviewProvider {
    static var previews: some View {
        MainResult()
    }
}
