//
//  ContentView.swift
//  Day02
//
//  Created by Vinícius Couto on 02/06/21.
//

import SwiftUI

struct PasswordView: View {
    @State private var showPassword: Bool = false
    @State private var password: String = ""

    var passwordField: some View {
        Group {
            if showPassword {
                TextField("Senha", text: $password)
            }
            else {
                SecureField("Senha", text: $password)
            }
        }
        .font(.system(size: 16, weight: .regular, design: .serif))
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .frame(maxWidth: 350, maxHeight: 20, alignment: .center)
        .padding()
    }
    
    var body: some View {
        passwordField
        
        Divider()
        
        Toggle("Ver sua senha", isOn: $showPassword)
            .font(.system(size: 16, weight: .regular, design: .serif))
            .frame(maxWidth: 350, maxHeight: 20, alignment: .center)
            .foregroundColor(.secondary)
            .padding()
    }
}

struct FieldView: View {
    @State private var fieldText: String = ""
    @State var placeholderText: String
    
    var body: some View {
        TextField(placeholderText, text: $fieldText)
            .font(.system(size: 16, weight: .regular, design: .serif))
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .frame(maxWidth: 350, maxHeight: 20, alignment: .center)
            .padding()
    }
}

struct ContentView: View {
    @State var text: String = ""

    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                
                Text("Crie sua conta")
                    .font(.system(size: 66, weight: .bold, design: .serif))
                    .foregroundColor(Color("azulzinho"))
                
                Text("Criar sua conta é rápido, fácil e seguro.")
                    .font(.system(size: 14, weight: .regular, design: .serif))
                    .padding(.bottom, 50)
                
                FieldView(placeholderText: "Nome completo")
                Divider()
                
                FieldView(placeholderText: "Endereço de email")
                Divider()
                
                PasswordView()
                
            }
            .padding(.horizontal, 25)
            
            VStack(alignment: .center) {
                Button(action: {}, label: {
                    Text("Criar conta")
                        .font(.system(size: 16, weight: .regular, design: .serif))
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color("azulzinho"))
                        .cornerRadius(25)
                })
                .padding(.top, 100)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
