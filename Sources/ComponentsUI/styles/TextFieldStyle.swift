import SwiftUI
import Swinject

struct TextFieldStyle {
    var backgroundColor: Color
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
    var padding: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
}

public enum TextFieldStyleType {
    case primary
    case secondary
    case danger

    var style: TextFieldStyle {
        let fontStyle = Container().resolve(FontStyleContract.self)
        switch self {
        case .primary:
            return TextFieldStyle(
                backgroundColor: .white,
                textColor: .black,
                font: fontStyle?.body ?? .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .blue,
                borderWidth: 1
            )
        case .secondary:
            return TextFieldStyle(
                backgroundColor: .gray.opacity(0.2),
                textColor: .black,
                font: fontStyle?.body ?? .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .gray,
                borderWidth: 1
            )
        case .danger:
            return TextFieldStyle(
                backgroundColor: .white,
                textColor: .red,
                font: fontStyle?.body ?? .body,
                cornerRadius: 10,
                padding: 10,
                borderColor: .red,
                borderWidth: 1
            )
        }
    }
}
