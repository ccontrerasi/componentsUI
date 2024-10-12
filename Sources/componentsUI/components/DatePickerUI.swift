import SwiftUI

public struct DatePickerUI: View {
    var title: String
    @Binding var date: Date
    var styleType: DatePickerStyleType

    public init(title: String,
                date: Binding<Date>,
                styleType: DatePickerStyleType) {
        self.title = title
        self._date = date
        self.styleType = styleType
    }

    public var body: some View {
        let style = styleType.style
        return DatePicker(title, selection: $date)
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

struct DatePickerUI_Previews: PreviewProvider {
    @State static var date: Date = Date()

    static var previews: some View {
        VStack {
            DatePickerUI(title: "Primary DatePicker", date: $date, styleType: .primary)
            DatePickerUI(title: "Secondary DatePicker", date: $date, styleType: .secondary)
            DatePickerUI(title: "Danger DatePicker", date: $date, styleType: .danger)
        }
        .padding()
    }
}
