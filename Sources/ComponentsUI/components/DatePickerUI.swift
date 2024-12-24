import SwiftUI

public struct DatePickerUI: View {
    var title: String
    @Binding var date: Date
    var styleType: DatePickerStyleType
    var shimmering: Bool

    public init(title: String,
                date: Binding<Date>,
                styleType: DatePickerStyleType,
                shimmering: Bool = false) {
        self.title = title
        self._date = date
        self.styleType = styleType
        self.shimmering = shimmering
    }

    public var body: some View {
        let style = styleType.style
        if shimmering {
            DatePicker("", selection: $date)
                .hidden()
                .disabled(true)
                .padding(style.padding)
                .background(style.shimmerColor)
                .foregroundColor(style.textColor)
                .shimmering(cornerRadius: style.cornerRadius)
                .cornerRadius(style.cornerRadius)
        } else {
            DatePicker(title, selection: $date)
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
}

struct DatePickerUI_Previews: PreviewProvider {
    @State static var date: Date = Date()

    static var previews: some View {
        VStack {
            DatePickerUI(title: "Primary DatePicker", date: $date, styleType: .primary)
            DatePickerUI(title: "Secondary DatePicker", date: $date, styleType: .secondary)
            DatePickerUI(title: "Danger DatePicker", date: $date, styleType: .danger)
            DatePickerUI(title: "Primary DatePicker", date: $date, styleType: .primary, shimmering: true)
            DatePickerUI(title: "Danger DatePicker", date: $date, styleType: .danger, shimmering: true)
        }
        .padding()
    }
}
