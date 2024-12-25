import SwiftUI

public struct LoadingViewUI: View {
    @State private var isAnimating: Bool = false
    var title: String
    var type: LoadingViewStyleType
    
    public init(isAnimating: Bool = false,
                title: String = "Loading",
                type: LoadingViewStyleType = .primary) {
        self.isAnimating = isAnimating
        self.title = title
        self.type = type
    }
    
    public var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.8)
                    .stroke(type.style.strokeColor, lineWidth: type.style.strokeWidth)
                    .frame(width: type.style.size, height: type.style.size)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                                self.isAnimating = true
                            }
                        }
                    }.padding(8)
                Text(title)
                    .font(type.style.font)
                    .foregroundColor(type.style.textColor)
            }
        }.background(type.style.colorBackground)
            .cornerRadius(8)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewUI(title: "Loading",
                      type: .primary)
    }
}
