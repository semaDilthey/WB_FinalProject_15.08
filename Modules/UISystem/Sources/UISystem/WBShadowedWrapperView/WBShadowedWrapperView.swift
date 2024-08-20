import SwiftUI

/// Используется как бокс для вьюх, которые должны иметь вокруг себя тень
/// - Parameters:
///   - radius: Внешний радиус вью
///   - shadowColor: Цвет тени
///   - shadowRadius: Радиус тени (радиус ее `распыленности`)
///   - shadowOpacity: Прозрачность тени
///   - content: Контент внутри бокса
public struct WBShadowedWrapperView<Content: View>: View {
    let content: Content
    let radius: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowOpacity: Double
    
    public init(
        radius: CGFloat = 10,
        shadowColor: Color = .black,
        shadowRadius: CGFloat = 2,
        shadowOpacity: Double = 0.3,
        @ViewBuilder content: () -> Content
    ) {
        self.radius = radius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
        self.content = content()
    }

    public var body: some View {
        content
            .background(Color.white)
            .cornerRadius(radius)
            .shadow(color: shadowColor.opacity(shadowOpacity),
                    radius: shadowRadius)
    }
}
