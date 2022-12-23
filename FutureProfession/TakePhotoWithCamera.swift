//
//  TakePhotoWithCamera.swift
//  FutureProfession
//
//  Created by Danil Bochkarev on 22.12.2022.
//

import SwiftUI
import UIKit

struct TakePhotoWithCamera: View {
    @State private var isShown: Bool = false
    @State var image: Image = Image(systemName: "")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State var loadingStatus1 = true
    @State var mainResult = false
    
    var body: some View {
        
        if image != Image(systemName: "") {
            ZStack {
                backgroundFone()
                
                circleTwo()
                    .offset(x:-200, y: -400)
                
                circleThree()
                    .offset(x:200, y: 400)
                

                VStack {
                    if loadingStatus1 {
                        Text("WAIT, we are analyzing")
                            .font(Font.custom("Bahiana-Regular", size: 50))
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                            .multilineTextAlignment(.center)
                        
                        ActivityIndicatorView()
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                            .multilineTextAlignment(.center)
                    } else {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 220, height: 220)
                                    .cornerRadius(65)
                                    .foregroundColor(Color("Color1"))

                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(60)
                            }
                            
                            Text("YOU FUTURE PRODESSION")
                                .font(Font.custom("Bahiana-Regular", size: 50))
                                .foregroundColor(Color.white)
                                .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                                .multilineTextAlignment(.center)
                            
                            Text("\(Profession())")
                                .font(Font.custom("Bahiana-Regular", size: 50))
                                .foregroundColor(Color.white)
                                .frame(width: 250)
                                .background(Color("Color1"))
                                .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                                .multilineTextAlignment(.center)
                                .cornerRadius(20)
                            
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.loadingStatus1 = false
                    }
                }
            }
        } else {
            ZStack() {
                backgroundFone()
                
                VStack(spacing: 25) {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color.white)
                        .font(.system(size: 150))
                    
                    Text("WE NEED A PICTURE OF YOU TO GUESS YOUR PROFESSION").font(Font.custom("Bahiana-Regular", size: 60))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                        
                    Text("PICK YOUR OPTION").font(Font.custom("Bahiana-Regular", size: 60))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black.opacity(0.7), radius: 1, x: 2)
                }
                .padding(.bottom, 100)
                
                
                VStack {
                    HStack(spacing: 30) {
                        Button {
                            self.isShown.toggle()
                            self.sourceType = .camera
                        } label: {
                            Image(systemName: "camera")
                                .font(.system(size: 40))
                                .foregroundColor(Color("Color4"))
                                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 2)
                                .frame(width: 70, height: 70)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 3)
                        }
                        
                        Button {
                            self.isShown.toggle()
                            self.sourceType = .photoLibrary
                        } label: {
                            Image(systemName: "photo")
                                .font(.system(size: 40))
                                .foregroundColor(Color("Color4"))
                                .shadow(color: Color.black.opacity(0.5), radius: 1, x: 2)
                                .frame(width: 70, height: 70)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 3)
                        }
                    }
                }
                .sheet(isPresented: $isShown) {
                    A(isShown: self.$isShown,
                      myimage: self.$image,
                      mysourceType: self.$sourceType)
                }
                .padding(.top, 480)
                
                circleTwo()
                    .offset(x:200, y: -400)
                
                circleThree()
                    .offset(x:-200, y: 400)
            }
        }
        

    }
}

struct A: UIViewControllerRepresentable {
    @Binding var isShown: Bool
    @Binding var myimage: Image
    @Binding var mysourceType: UIImagePickerController.SourceType
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<A>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<A>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mysourceType
        obj.delegate = context.coordinator
        return obj
    }
    
    func makeCoordinator() -> C {
        return C(isShown: $isShown, myimage: $myimage)
    }
}

class C: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isShown: Bool
    @Binding var myimage: Image
    
    init(isShown: Binding<Bool>, myimage: Binding<Image>) {
        _isShown = isShown
        _myimage = myimage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print(image)
            myimage = Image.init(uiImage: image)
        }
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct TakePhotoWithCamera_Previews: PreviewProvider {
    static var previews: some View {
        TakePhotoWithCamera()
    }
}


