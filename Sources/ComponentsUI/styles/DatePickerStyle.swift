import Swinject
import SwiftUI

public struct DatePickerStyle {
    var backgroundColor: Color
    var shimmerColor: Color
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
        guard let factory = Injector.shared.resolve(DataPickerStyleFactoryContract.self) else {
            return DataPickerStyleFactory().getStyle(self)
        }
        return factory.getStyle(self)
    }
}


public protocol DataPickerStyleFactoryContract {
    func getStyle(_ type: DatePickerStyleType) -> DatePickerStyle
}

final class DataPickerStyleFactory: DataPickerStyleFactoryContract {
    func getStyle(_ type: DatePickerStyleType) -> DatePickerStyle {
        let fontStyle = Injector.shared.resolve(FontStyleContract.self)
        switch type {
        case .primary:
            return DatePickerStyle(
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
            return DatePickerStyle(
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
            return DatePickerStyle(
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
