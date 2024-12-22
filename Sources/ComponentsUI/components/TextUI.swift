import SwiftUI

public struct TextUI: View {
    var text: String
    var type: TextStyleType
    var icon: Image? = nil
    var iconColor: Color? = nil
    
    public init(text: String,
                type: TextStyleType,
                icon: Image? = nil,
                iconColor: Color? = nil) {
        self.text = text
        self.icon = icon
        self.iconColor = iconColor
        self.type = type
    }
    
    public var body: some View {
        let style = type.style
        HStack {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(iconColor)
            }
            Text(text)
                .font(style.font)
                .foregroundColor(style.color)
        }
    }
}

struct TextUI_Previews: PreviewProvider {
    static var previews: some View {
        TextUI(text: "Ey man!",
               type: .body,
               icon: Image(systemName: "star"),
               iconColor: .red)
    }
}
