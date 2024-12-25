import SwiftUI

public struct LoadingViewUI: View {
    @State private var isAnimating: Bool = false
    var title: String
    var type: LoadingViewStyleType
    
    public var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.8)
                    .stroke(type.style.strokeColor, lineWidth: type.style.strokeWidth)
                    .frame(width: type.style.size, height: type.style.size)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear {
                        DispatchQueue.main.async {
                            self.isAnimating = true
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
