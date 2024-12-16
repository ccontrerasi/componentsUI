import SwiftUI

public struct CardUI: View {
    var title: String
    var subtitle: String
    var image: Image?
    var alternativeText: String?
    
    var action: () -> Void
    
    public init(title: String,
                subtitle: String,
                image: Image?,
                alternativeText: String?,
                action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.alternativeText = alternativeText
        self.action = action
    }
    
    public var body: some View {
        VStack {
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else if let alternativeText {
                alternativeTextView(text: alternativeText)
                    .frame(width: 50, height: 50)
                    .padding(.top, 8)
            }
            
            Text(title)
                .font(.headline)
                .padding(.top, 8)
                .lineLimit(2)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)
                .lineLimit(3)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
        .onTapGesture {
            action()
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
        CardUI(title: "Titulito",
               subtitle: "Subtitulito",
               image: Image(systemName: "star"),
               alternativeText: "AC"
        ){
            print("Eooo")
        }.frame(width: 200)
    }
}
