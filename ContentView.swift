//
//  ContentView.swift
//  imc
//
//  Created by jose juan alcantara rincon on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive:Bool = false
    @State var peso:Float = 0.0
    @State var altura:Float = 0.0
    @State var isEditingPeso:Bool = false
    @State var isEditingAltura:Bool = false
    @State var resultado:Float = 0.0
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Text("Peso")
                        .fontWeight(.medium)
                    Slider(value: $peso,
                           in: 10...150,
                           step: 0.5,
                           onEditingChanged: {(editing) in
                            isEditingPeso = editing
                           },
                           minimumValueLabel: Text("min"),
                           maximumValueLabel: Text("max")){
                        Text("Selecciona tu peso")
                    }
                    Text("\(String(format: "%.1f", peso)) kg")
                        .foregroundColor(isEditingPeso ? .green : .black)
                    Text("Altura")
                        .fontWeight(.medium)
                    Slider(value: $altura,
                           in: 30...220,
                           step: 0.5,
                           onEditingChanged: {(editing) in
                            isEditingAltura = editing
                           },
                           minimumValueLabel: Text("min"),
                           maximumValueLabel: Text("max")){
                        Text("Selecciona tu peso")
                    }
                    Text("\(String(format: "%.1f", altura)) cm")
                        .foregroundColor(isEditingAltura ? .green : .black)
                    NavigationLink(
                        destination: ResultView(rootActive: $isActive, resultado: $resultado),
                        isActive: $isActive,
                        label: {
                            Text("Calcular")
                                .padding()
                                .background(Color.black)
                                .cornerRadius(3)
                                .foregroundColor(.white)
                                .onTapGesture {
                                    resultado = (peso/((altura/100)*(altura/100)))
                                    isActive = true
                                    print(resultado)
                                }
                        }
                    )
                    .frame(maxWidth: 150)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationTitle("IMC")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
