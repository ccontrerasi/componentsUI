//
//  ContentView.swift
//  SampleApp
//
//  Created by CRISTIAN SAMUEL CONTRERAS on 10/8/24.
//

import SwiftUI
import componentsUI

struct ContentView: View {
    @State var text: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            ButtonUI(title: "asdfasdf",
                     type: .danger,
                     action: {
                print("Hola caracola")
            })
            ButtonUI(title: "asdfasdf",
                     type: .primary,
                     icon: Image(systemName: "star"),
                     iconColor: .white,
                     action: {
                print("Hola caracola")
            })
            TextFieldUI(placeholder: "Primary", text: $text, styleType: .primary)
            TextFieldUI(placeholder: "Secondary", text: $text, styleType: .secondary)
            TextFieldUI(placeholder: "Danger", text: $text, styleType: .danger)
            DatePickerUI(title: "Primary DatePicker", date: $date, styleType: .primary)
            DatePickerUI(title: "Secondary DatePicker", date: $date, styleType: .secondary)
            DatePickerUI(title: "Danger DatePicker", date: $date, styleType: .danger)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
