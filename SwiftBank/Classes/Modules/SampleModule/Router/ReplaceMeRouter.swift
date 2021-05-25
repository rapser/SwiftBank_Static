

import TPCSDKSwift

class Pedro: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let card = FundingCard(scheme: .Visa, encryptedPayload: "")
        TPCSDK.getTokens(card: card) { (tokens) in
            
            print(tokens?.count ?? 0)
        }
    }
}
