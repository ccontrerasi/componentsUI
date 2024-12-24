import SwiftUI

public struct ButtonUI: View {
    var title: String
    var action: () -> Void
    var type: ButtonStyleType
    var icon: Image? = nil
    var iconColor: Color? = nil
    var shimmering: Bool
    
    public init(title: String,
                type: ButtonStyleType,
                icon: Image? = nil,
                iconColor: Color? = nil,
                shimmering: Bool = false,
                action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.icon = icon
        self.iconColor = iconColor
        self.type = type
        self.shimmering = shimmering
    }
    
    public var body: some View {
        let style = type.style
        if shimmering {
            Button(action: action){
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
                }.hidden()
            }.padding()
                .background(style.shimmerColor)
                .disabled(true)
                .shimmering(cornerRadius: style.cornerRadius)
        } else {
            Button(action: action) {
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
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonUI(title: "Press Me",
                     type: .primary,
                     icon: Image(systemName: "star"),
                     iconColor: .red,
                     action: {
                print("Button pressed!")
            })
            ButtonUI(title: "Press Me",
                     type: .primary,
                     icon: Image(systemName: "star"),
                     iconColor: .red,
                     shimmering: true,
                     action: {
                print("Button pressed!")
            })
            ButtonUI(title: "Press Me",
                     type: .danger,
                     icon: Image(systemName: "star"),
                     iconColor: .red,
                     shimmering: true,
                     action: {
                print("Button pressed!")
            })
        }
    }
}
