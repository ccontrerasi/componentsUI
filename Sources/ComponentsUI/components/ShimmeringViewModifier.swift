import SwiftUI

struct ShimmeringViewModifier: ViewModifier {
    @State private var opacity: Double = 0.5
        var cornerRadius: CGFloat

        func body(content: Content) -> some View {
            content
                .background(Color.gray.opacity(0.3))
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                            .opacity(opacity)
                            .onAppear {
                                DispatchQueue.main.async {
                                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                        self.opacity = 1.0
                                    }
                                }
                            }
                    }
                    .mask(content)
                ).cornerRadius(cornerRadius)
        }
}

extension View {
    func shimmering(cornerRadius: CGFloat) -> some View {
        self.modifier(ShimmeringViewModifier(cornerRadius: cornerRadius))
    }
}
