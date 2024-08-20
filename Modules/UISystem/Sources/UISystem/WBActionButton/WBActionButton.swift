import SwiftUI

/// Используется как кнопка "действия" в приложени : продолжить, сохранить, найти и тд
/// - Parameters:
///   - title: заголовок кнопки
///   - action: экшен по нажатию
///   - font:  шрифт
///   - backgroundColor: цвет кнопки
///   - textColor: цвет текста
///   - radius: радиус кнопки
public struct WBActionButton: View {
    
    let title : String
    var action : () -> Void
    
    let font : Font
    let backgroundColor : Color
    let textColor : Color
    let radius : CGFloat
    
    public init(title: String, 
         action: @escaping () -> Void,
         backgroundColor: Color,
         font: Font = .wb(.subheading1),
         textColor: Color = .white,
         radius: CGFloat = 10)
    {
        self.title = title
        self.action = action
        self.font = font
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.radius = radius
    }
    
    public var body: some View {
        Button { action() }
        label: { buttonBody }
    }
    
    private var buttonBody: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(title)
                .padding()
                .font(font)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .foregroundStyle(textColor)
        .minimumScaleFactor(0.5)
        .clipShape(.rect(cornerRadius: radius))
    }
}
