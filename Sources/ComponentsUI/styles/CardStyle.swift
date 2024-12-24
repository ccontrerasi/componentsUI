import SwiftUI
import Swinject

public struct CardStyle {
    var backgroundColor: Color
    var shimmerColor: Color
    var textColor: Color
    var titleFont: Font
    var subtitleFont: Font
    var cornerRadius: CGFloat
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    var width: CGFloat
    var height: CGFloat
}

public enum CardStyleType {
    case normal
    
    public var style: CardStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch self {
        case .normal:
            return CardStyle(
                backgroundColor: .white,
                shimmerColor: Color.gray.opacity(0.3),
                textColor: .black,
                titleFont: fontStyle?.headline ?? .headline,
                subtitleFont: fontStyle?.headline ?? .headline,
                cornerRadius: 10,
                imageWidth: 75,
                imageHeight: 75,
                width: 200,
                height: 200
            )
        }
    }
}
