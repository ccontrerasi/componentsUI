import SwiftUI
import Swinject

public struct TextFieldStyle {
    var backgroundColor: Color
    var shimmerColor: Color
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
        guard let factory = Injector.shared.resolve(TextFieldStyleFactoryContract.self) else {
            return TextFieldStyleFactory().getStyle(self)
        }
        return factory.getStyle(self)
    }
}

public protocol TextFieldStyleFactoryContract {
    func getStyle(_ type: TextFieldStyleType) -> TextFieldStyle
}

final class TextFieldStyleFactory: TextFieldStyleFactoryContract {
    func getStyle(_ type: TextFieldStyleType) -> TextFieldStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch type {
        case .primary:
            return TextFieldStyle(
                backgroundColor: .white,
                shimmerColor: Color.gray.opacity(0.3),
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
                shimmerColor: Color.gray.opacity(0.3),
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
                shimmerColor: Color.red.opacity(0.3),
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
