import SwiftUI

public struct WBLoaderView: View {
    
    let color: Color
    var gradient : LinearGradient?
    @State private var animate = false
    
    public init(color: Color) {
        self.color = color
        setGradient()
    }
    
    public var body: some View {
        Circle()
            .stroke(gradient ?? defaultGrad, lineWidth: 4)
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
    }
    
    
    private var defaultGrad = LinearGradient(
        stops: [
            Gradient.Stop(color: .primary, location: 0.1),
            Gradient.Stop(color: .primary.opacity(0.8), location: 0.4),
            Gradient.Stop(color: .primary.opacity(0.4), location: 0.8)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
}

private extension WBLoaderView {
    
    mutating func setGradient() {
        self.gradient = LinearGradient(
            stops: [
                Gradient.Stop(color: color, location: 0.1),
                Gradient.Stop(color: color.opacity(0.8), location: 0.4),
                Gradient.Stop(color: color.opacity(0.4), location: 0.8)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
}
