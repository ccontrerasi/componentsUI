import SwiftUI

public struct TextFieldUI: View {
    var placeholder: String
    @Binding var text: String
    var styleType: TextFieldStyleType
    
    public init(placeholder: String,
         text: Binding<String>,
         styleType: TextFieldStyleType) {
        self.placeholder = placeholder
        self._text = text
        self.styleType = styleType
    }

    public var body: some View {
        let style = styleType.style
        return TextField(placeholder, text: $text)
            .padding(style.padding)
            .background(style.backgroundColor)
            .foregroundColor(style.textColor)
            .font(style.font)
            .cornerRadius(style.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .stroke(style.borderColor, lineWidth: style.borderWidth)
            )
    }
}

struct TextFieldUI_Previews: PreviewProvider {
    @State static var text: String = ""

    static var previews: some View {
        VStack {
            TextFieldUI(placeholder: "Primary EditText", text: $text, styleType: .primary)
            TextFieldUI(placeholder: "Secondary EditText", text: $text, styleType: .secondary)
            TextFieldUI(placeholder: "Danger EditText", text: $text, styleType: .danger)
        }
        .padding()
    }
}
