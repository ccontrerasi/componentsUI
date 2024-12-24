import SwiftUI

public struct CardUI: View {
    var title: String
    var subtitle: String
    var image: Image?
    var alternativeText: String?
    var cardStyle: CardStyleType
    var shimmering: Bool
    var action: () -> Void
    
    public init(title: String,
                subtitle: String,
                image: Image?,
                alternativeText: String?,
                cardStyle: CardStyleType = .normal,
                shimmering: Bool = false,
                action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.alternativeText = alternativeText
        self.cardStyle = cardStyle
        self.shimmering = shimmering
        self.action = action
    }
    
    public var body: some View {
        if shimmering {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(width: cardStyle.style.width,
                       height: cardStyle.style.height)
                .shimmering(cornerRadius: 10)
                .padding()
            
        } else {
            VStack {
                if let image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: cardStyle.style.imageWidth,
                               height: cardStyle.style.imageHeight)
                        .padding(.top, 8)
                } else if let alternativeText {
                    alternativeTextView(text: alternativeText)
                        .frame(width: cardStyle.style.imageWidth,
                               height: cardStyle.style.imageHeight)
                        .padding(.top, 8)
                }
                
                Text(title)
                    .font(.headline)
                    .padding(.top, 5)
                    .padding(.horizontal, 5)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .padding(.horizontal, 5)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(width: cardStyle.style.width,
                   height: cardStyle.style.height)
            .background(cardStyle.style.backgroundColor)
            .cornerRadius(cardStyle.style.cornerRadius)
            .shadow(radius: 5)
            .padding()
            .onTapGesture {
                action()
            }
        }
        
    }
    
    struct alternativeTextView: View {
        let text: String
        
        var body: some View {
            let backgroundColor = Color(
                red: Double.random(in: 0...1),
                green: Double.random(in: 0...1),
                blue: Double.random(in: 0...1)
            )
            
            return ZStack {
                Circle()
                    .fill(backgroundColor)
                Text(text.prefix(2))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }
}

struct CardUI_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CardUI(title: "Titulo",
                   subtitle: "Subtitulo lkdjsñalj alñskjdfalñs alskjdfñlasfkj ",
                   image: Image(systemName: "star"),
                   alternativeText: "AC"
            ){
                print("Eooo")
            }
            CardUI(title: "Titulo",
                   subtitle: "Subtitulo lkdjsñalj alñskjdfalñs alskjdfñlasfkj ",
                   image: Image(systemName: "star"),
                   alternativeText: "AC",
                   shimmering: true
            ){
                print("Eooo")
            }
        }
    }
}
