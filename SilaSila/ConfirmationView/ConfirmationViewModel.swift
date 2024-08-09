import SwiftUI

class ConfirmationViewModel: ObservableObject {
    @Published var selectedPay: String = "Выбор способа оплаты"
    
    let payments = ["Оплатить банковской картой", "Оплатить абонементом", "Оплатить сертификатом"]
}

