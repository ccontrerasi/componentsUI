import SwiftUI

public struct DatePickerStyle {
    var backgroundColor: Color
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
    var padding: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
}

// Definir un enum para los diferentes tipos de estilo de DatePicker
public enum DatePickerStyleType {
    case primary
    case secondary
    case danger

    var style: DatePickerStyle {
        switch self {
        case .primary:
            return DatePickerStyle(
                backgroundColor: .white,
                textColor: .black,
                font: .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .blue,
                borderWidth: 1
            )
        case .secondary:
            return DatePickerStyle(
                backgroundColor: .gray.opacity(0.2),
                textColor: .black,
                font: .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .gray,
                borderWidth: 1
            )
        case .danger:
            return DatePickerStyle(
                backgroundColor: .white,
                textColor: .red,
                font: .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .red,
                borderWidth: 1
            )
        }
    }
}
