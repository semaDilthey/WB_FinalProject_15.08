import SwiftUI

/// Используется как кастомный серч бар
/// - Parameters:
///   - searchText: биндинг на текстовое поле
///   - placeholder: плейсхолдер
///   - tintColor: цвет всего: бордер, текст, картинка лупы
///   - backgroundColor: цвет бэкграунда
///   - radius: радиус
public struct WBSearchField: View {
    
    @Binding var searchText: String
    private let placeholder: String
    
    private let backgroundColor: Color
    private let tintColor: Color
    
    private let radius: CGFloat

    public init(searchText: Binding<String>,
                placeholder: String,
                tintColor: Color,
                backgroundColor: Color = .white,
                radius: CGFloat = 10)
    {
        self._searchText = searchText
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.radius = radius
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius)
                .stroke(tintColor, lineWidth: 3)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: radius))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("WBSearchField", text: $searchText, prompt: Text(placeholder))
                    .tint(tintColor)
                    .font(.wb(.body1))
                Spacer()
                Button { searchText = "" }
                label: { Image(systemName: "xmark.circle")}
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(tintColor)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .clipped()
    }
}
