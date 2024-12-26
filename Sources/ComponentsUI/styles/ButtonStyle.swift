import SwiftUI
import Swinject

public struct ButtonStyle {
    var backgroundColor: Color
    var shimmerColor: Color
    var textColor: Color
    var font: Font
    var cornerRadius: CGFloat
}

public enum ButtonStyleType {
    case primary
    case secondary
    case danger
    
    var style: ButtonStyle {
        guard let factory = Injector.shared.resolve(ButtonStyleFactoryContract.self) else {
            return ButtonStyleFactory().getStyle(self)
        }
        return factory.getStyle(self)
    }
}

public protocol ButtonStyleFactoryContract {
    func getStyle(_ type: ButtonStyleType) -> ButtonStyle
}

final class ButtonStyleFactory: ButtonStyleFactoryContract {
    func getStyle(_ type: ButtonStyleType) -> ButtonStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch type {
        case .primary:
            return ButtonStyle(
                backgroundColor: .blue,
                shimmerColor: Color.gray.opacity(0.3),
                textColor: .white,
                font: fontStyle?.headline ?? .headline,
                cornerRadius: 10
            )
        case .secondary:
            return ButtonStyle(
                backgroundColor: .gray,
                shimmerColor: Color.gray.opacity(0.3),
                textColor: .white,
                font: fontStyle?.subheadline ?? .subheadline,
                cornerRadius: 10
            )
        case .danger:
            return ButtonStyle(
                backgroundColor: .red,
                shimmerColor: Color.red.opacity(0.3),
                textColor: .white,
                font: fontStyle?.headline ?? .headline,
                cornerRadius: 10
            )
        }
    }
}
