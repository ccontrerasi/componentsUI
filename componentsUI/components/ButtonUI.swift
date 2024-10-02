import SwiftUI

public struct ButtonUI: View {
    var title: String
    var action: () -> Void
    var type: ButtonStyleType
    var icon: Image? = nil
    var iconColor: Color? = nil
    
    public init(title: String,
                type: ButtonStyleType,
                icon: Image? = nil,
                iconColor: Color? = nil,
                action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.icon = icon
        self.iconColor = iconColor
        self.type = type
    }
    
    public var body: some View {
        let style = type.style
        return Button(action: action) {
            HStack {
                if let icon = icon {
                    icon
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(iconColor)
                }
                Text(title)
                    .font(style.font)
                    .foregroundColor(style.textColor)
            }
            .padding()
            .background(style.backgroundColor)
            .cornerRadius(style.cornerRadius)
        }
    }
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUI(title: "Press Me",
                 type: .primary,
                 icon: Image(systemName: "star"),
                 iconColor: .red,
                 action: {
            print("Button pressed!")
        })
    }
}
