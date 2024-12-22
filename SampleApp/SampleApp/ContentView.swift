//
//  ContentView.swift
//  SampleApp
//
//  Created by CRISTIAN SAMUEL CONTRERAS on 10/8/24.
//

import SwiftUI
import ComponentsUI

struct ContentView: View {
    @State var text: String = ""
    @State var date: Date = Date()
    
    var body: some View {
        VStack {
            HStack {
                TextUI(text: "Ey man!", type: .title)
                TextUI(text: "Ey man!", type: .subtitle)
                TextUI(text: "Ey man!", type: .body)
            }.frame(width: .infinity)
                .padding(.top, 25)
            HStack {
                Spacer()
                TextUI(text: "Ey man!", type: .titleClear)
                TextUI(text: "Ey man!", type: .subtitleClear)
                TextUI(text: "Ey man!", type: .bodyClear)
                Spacer()
            }
            .frame(width: .infinity)
            .background(.red)
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
            ScrollView(.horizontal) {
                HStack {
                    CardUI(title: "Tiki",
                           subtitle: "Tururu",
                           image: nil,
                           alternativeText: nil,
                           cardStyle: .normal)
                    CardUI(title: "Tiki",
                           subtitle: "Tururu",
                           image: nil,
                           alternativeText: nil,
                           cardStyle: .normal)
                    CardUI(title: "Tiki",
                           subtitle: "Tururu",
                           image: nil,
                           alternativeText: nil,
                           cardStyle: .normal)
                }
            }
            .padding(.horizontal, .zero)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
