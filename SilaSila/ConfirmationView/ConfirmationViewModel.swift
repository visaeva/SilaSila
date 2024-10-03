import SwiftUI

class ConfirmationViewModel: ObservableObject {
    @Published var selectedPay: String = "Выбор способа оплаты"
    @Published var promoCode: String = ""
    let payments = ["Оплатить банковской картой", "Оплатить абонементом", "Оплатить сертификатом"]
    @Published var comment: String = ""
}

