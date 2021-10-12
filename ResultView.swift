//
//  ResultView.swift
//  imc
//
//  Created by jose juan alcantara rincon on 11/10/21.
//

import SwiftUI

struct ResultView: View {
    @Binding var rootActive: Bool
    @Binding var resultado: Float
    @State var img:String = ""
    var body: some View {
        VStack{
            Spacer()
            if(resultado<18.5 || resultado>24.9){
                Image(systemName: "hand.thumbsdown")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .onTapGesture {
                        rootActive = false
                    }
            }else{
                Image(systemName: "hand.thumbsup")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .onTapGesture {
                        rootActive = false
                    }
            }
            Spacer()
            Text("Tu IMC es de \(String(format: "%.2f", resultado))")
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(rootActive: .constant(false), resultado: .constant(0.0))
    }
}
