import SwiftUI
import Swinject

public struct TextStyle {
    var color: Color
    var font: Font
    var shimmerColor: Color
    var cornerRadiusShimmer: CGFloat
}

public enum TextStyleType {
    case head
    case title
    case subtitle
    case body
    
    case headClear
    case titleClear
    case subtitleClear
    case bodyClear

    public var style: TextStyle {
        guard let factory = Injector.shared.resolve(TextStyleFactoryContract.self) else {
            return TextStyleFactory().getStyle(self)
        }
        return factory.getStyle(self)
    }
}

public protocol TextStyleFactoryContract {
    func getStyle(_ type: TextStyleType) -> TextStyle
}

final class TextStyleFactory: TextStyleFactoryContract {
    func getStyle(_ type: TextStyleType) -> TextStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch type {
        case .head:
            return TextStyle(
                color: .black,
                font: fontStyle?.head ?? .headline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .title:
            return TextStyle(
                color: .black,
                font: fontStyle?.headline ?? .headline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .subtitle:
            return TextStyle(
                color: .black,
                font: fontStyle?.subheadline ?? .subheadline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .body:
            return TextStyle(
                color: .black,
                font: fontStyle?.body ?? .body,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .headClear:
            return TextStyle(
                color: .white,
                font: fontStyle?.head ?? .headline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .titleClear:
            return TextStyle(
                color: .white,
                font: fontStyle?.headline ?? .headline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .subtitleClear:
            return TextStyle(
                color: .white,
                font: fontStyle?.subheadline ?? .subheadline,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        case .bodyClear:
            return TextStyle(
                color: .white,
                font: fontStyle?.body ?? .body,
                shimmerColor: Color.gray.opacity(0.3),
                cornerRadiusShimmer: 5
            )
        }
    }
}
