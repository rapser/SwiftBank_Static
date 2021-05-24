//
//  ViewController.swift
//  SwiftBank
//
//  Created by matomairo@gmail.com on 05/07/2021.
//  Copyright (c) 2021 matomairo@gmail.com. All rights reserved.
//


import TPCSDKSwift
import PassKit

class ViewController: UIViewController, TPCSDKProvisionDelegate {
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    configureWithVariant()
    
  }
  
  // MARK: TPCSDK Configuration

  func configureWithVariant() {
    let tpcVariant = SdkVariant.PROD
    let tpcIssuerId = "TPCSANDBOX"
    let result = TPCSDK.configure(variant: tpcVariant,
                                  issuerId: tpcIssuerId)
    
    switch result {
    case .OK:
      print("TPCSDK Configure OK")
      label.text = "TPCSDK \(TPCSDK.tpcsdkVersion) Configure OK"
      
    case .Fail:
      print("TPCSDK Configure Fail")
      label.text = "TPCSDK \(TPCSDK.tpcsdkVersion) Configure Fail"

    case .Error:
      print("TPCSDK Configure Error")
      label.text = "TPCSDK \(TPCSDK.tpcsdkVersion) Configure Fail"
    }
  }
  
  func configureWithUrl() {
    let tpcServerUrl = "https://hapi.dbp.thalescloud.io/mg/tpc"
    let tpcIssuerId  = "TPC_ISSUER"
    let result = TPCSDK.configure(url: tpcServerUrl,
                                  issuerId: tpcIssuerId)
    
    switch result {
    case .OK:
      print("TPCSDK Configure OK")
      
    case .Fail:
      print("TPCSDK Configure Fail")
      
    case .Error:
      print("TPCSDK Configure Error")
    }
  }
  
  // MARK: Push Provisioning

  func isCardDigitizedWithFundingCardWithSchemeAndPayload() {
    let scheme = CardScheme.Visa
    let payload = "3080xxx"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    TPCSDK.isCardDigitized(card: card) {
      (primaryAccountIdentifier, digitizeResult) in
      switch(digitizeResult) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        print("Returned as CardNotDigitized")
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        print("Other than CardNotDigitized")
        break
      }
    }
  }
  
  func isCardDigitizedWithFundingCardWithPrimaryAccountIdentifier() {
    let cardIdentifier = "identifier"
    
    let card = FundingCard(primaryAccountIdentifier: cardIdentifier)
    
    TPCSDK.isCardDigitized(card: card) {
      (primaryAccountIdentifier, digitizeResult) in
      switch(digitizeResult) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        break
      }
    }
  }
  
  func isCardDigitizedWithPrimaryAccountIdentifier() {
    let cardIdentifier = "identifier"

    TPCSDK.isCardDigitized(primaryAccountIdentifier: cardIdentifier) {
      (primaryAccountIdentifier, digitizeResult) in
      switch(digitizeResult) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        break
      }
    }
  }
  
  func getCardDigitizationResultWithFundingCardWithSchemeAndPayload() {
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    TPCSDK.getCardDigitizationResult(card: card) {
      (primaryAccountIdentifier, digitizeDetails) in
      switch(digitizeDetails.result) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        break
      }
    }
  }
  
  func getCardDigitizationResultWithFundingCardWithPrimaryAccountIdentifier() {
    let cardIdentifier = "identifier"
    
    let card = FundingCard(primaryAccountIdentifier: cardIdentifier)
    
    TPCSDK.getCardDigitizationResult(card: card) {
      (primaryAccountIdentifier, digitizeDetails) in
      switch(digitizeDetails.result) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        break
      }
    }
  }
  
  func getCardDigitizationResultWithPrimaryAccountIdentifier() {
    let cardIdentifier = "identifier"

    TPCSDK.getCardDigitizationResult(primaryAccountIdentifier: cardIdentifier) {
      (primaryAccountIdentifier, digitizeDetails) in
      switch(digitizeDetails.result) {
      case .CardNotDigitized:
        // TODO: Display Add to Apple Wallet button
        break
        
      default:
        // TODO: Hide Add to Apple Wallet button
        break
      }
    }
  }
  
  func onProvisionCompletion(pass: PKPaymentPass?, error: Error?) {
    if let error = error {
      // TODO: Problem with Provision
      return
    }
  }
  
  func provision() {
    let suffix = "1234"
    let cardholderName = "John Doe"
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    let code = "code"
    
    TPCSDK.provision(fromController: self,
                     primaryAccountSuffix: suffix,
                     cardholderName: cardholderName,
                     scheme: scheme,
                     encryptedPayload: payload,
                     authorizationCode: code,
                     provisionDelegate: self)
  }
  
  // MARK: In-App Activation

  func getPendingActivationPassWithFundingCardWithSchemeAndPayload() {
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    TPCSDK.getPendingActivationPass(card: card) {
      (pendingActivationPass) in
    }
  }
  
  func activatePass(pass: PKPass) {
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    let code = "code"
    let nonce = "nonce"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    TPCSDK.activatePass(pass: pass,
                        card: card,
                        authorizationCode: code,
                        nonce: nonce) {
      (success, error) in
      if let error = error {
        // TODO: Problem with activate
        return
      }
    }
  }
  
  // MARK: Token Management

  func getTokens() {
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    TPCSDK.getTokens(card: card) {
      (tokenList) in
    }
  }
  
  func getTokenRequestorWithAssetId(id: String) {
    TPCSDK.getTokenRequestorAsset(assetId: id) {
      (tokenRequestorAsset) in
    }
  }
  
    func updateTokenState(tokenId: String, tokenRequestorId: String, scheme: CardScheme, state: TokenState) {
    let code = "code"
    
//    TPCSDK.updateTokenState(tokenId: tokenId,
//                            tokenRequestorId: tokenRequestorId,
//                            scheme: scheme,
//                            authorizationCode: code,
//                            action: state) {
//      (success) in
//    }
  }
  
  // MARK: Issuer Linkage

  func getCards() {
    let userId = "id"
    let code = "code"
    let kyc = "kyc"
    
    TPCSDK.getCards(userId: userId,
                    authorizationCode: code,
                    kyc: kyc) {
      (cardList) in
    }
  }
  
  func getCardAsset() {
    let cardId = "id"
    let kyc = "kyc"
    let size = CardAssetSize.M
    
    TPCSDK.getCardAsset(cardId: cardId,
                        kyc: kyc,
                        size: size) {
      (cardAsset) in
    }
  }
  
  func getPayload() {
    let code = "code"
    let cardId = "id"
    let kyc = "kyc"
    
    TPCSDK.getPayload(authorizationCode: code,
                      cardId: cardId,
                      kyc: kyc) {
      (encryptedPayload) in
    }
  }
  
  // MARK: Scheme Push Provisioning

  func getEligibleTokenRequestor() {
    let scheme = CardScheme.Mastercard
    let payload = "PKCS7 encrypted PAN"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    let publicKeyId = "id"
    
//    TPCSDK.getEligibleTokenRequestor(card: card,
//                                     publicKeyIdentifier: publicKeyId) {
//      (TokenRequestorList) in
//    }
  }
  
  func schemePushProvision() {
    let scheme = CardScheme.Visa
    let payload = "3080xxx"
    
    let card = FundingCard(scheme: scheme,
                           encryptedPayload: payload)
    
    let publicKeyId = "id"
    let code = "code"
    let callbackUrl = "https://www.thalesgroup.com"
    let callbackType = "WEB"
    let pushHandler = "handler"
    
//    TPCSDK.schemePushProvision(card: card,
//                               publicKeyIdentifier: publicKeyId,
//                               authorizationCode: code,
//                               termsAndConditionsAccepted: true,
//                               callbackUrl: callbackUrl,
//                               callbackType: callbackType,
//                               pushHandler: pushHandler) {
//      (pushUrl) in
//    }
  }
}
