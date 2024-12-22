import SwiftUI
import Swinject

public struct ButtonStyle {
    var backgroundColor: Color
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
}

public enum ButtonStyleType {
    case primary
    case secondary
    case danger

    public var style: ButtonStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch self {
        case .primary:
            return ButtonStyle(
                backgroundColor: .blue,
                textColor: .white,
                font: fontStyle?.headline ?? .headline,
                cornerRadius: 10
            )
        case .secondary:
            return ButtonStyle(
                backgroundColor: .gray,
                textColor: .white,
                font: fontStyle?.subheadline ?? .subheadline,
                cornerRadius: 10
            )
        case .danger:
            return ButtonStyle(
                backgroundColor: .red,
                textColor: .white,
                font: fontStyle?.headline ?? .headline,
                cornerRadius: 10
            )
        }
    }
}
