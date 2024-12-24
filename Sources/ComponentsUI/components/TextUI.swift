import SwiftUI

public struct TextUI: View {
    var text: String
    var type: TextStyleType
    var icon: Image? = nil
    var iconColor: Color? = nil
    var shimmering: Bool
    
    public init(text: String,
                type: TextStyleType,
                icon: Image? = nil,
                iconColor: Color? = nil,
                shimmering: Bool = false) {
        self.text = text
        self.icon = icon
        self.iconColor = iconColor
        self.type = type
        self.shimmering = shimmering
    }
    
    public var body: some View {
        let style = type.style
        if shimmering {
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
            }.hidden().background(style.shimmerColor)
                .cornerRadius(style.cornerRadiusShimmer)
                .shimmering(cornerRadius: 0)
        } else {
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
}

struct TextUI_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TextUI(text: "Ey man!",
                   type: .body,
                   icon: Image(systemName: "star"),
                   iconColor: .red)
            TextUI(text: "Ey man!",
                   type: .body,
                   icon: Image(systemName: "star"),
                   iconColor: .red,
                   shimmering: true)
        }
    }
}
