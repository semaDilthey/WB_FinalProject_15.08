import SwiftUI

public extension View {
    
    ///  Отменяет активное состояние клавиатуры.
    ///  Применять к главному по иерархии контейнеру вью
    /// - Parameter completion: На случай если надо что-то делать по тапу за пределы
    func resignFirstResponder(onResign completion: @escaping () -> Void = {} ) -> some View {
        self.modifier(ResignFirstResponder(completion: completion))
    }
}

struct ResignFirstResponder : ViewModifier {

    var completion: () -> Void

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                completion()
            }
    }
}
