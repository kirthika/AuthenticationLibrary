//
//  TokenService.swift
//  iOSAuthLibrary
//
//  Created by Pariveda Solutions.
//
import Foundation
import Alamofire

open class TokenService {
    
    let brand: String
    let refresh: Bool
    required public init(_ branding: String,_ refreshBool: Bool) {
        brand = branding
        refresh = refreshBool
    }
    
    func getTokens(_ auth_code: String, completion: @escaping (_ token: Token) -> Void) {
        let token = Token()
        let azureProps = PListService("azure")
        
        // Get correct policy based on brand
        var policy = ""
        if (brand == "lexus") {
            policy = azureProps.getProperty("policyLexus")
        }
        else {
            policy = azureProps.getProperty("policy")
        }
        
        // Get correct grant type and code var based on if refresh or not
        var grant = ""
        var codeVar = ""
        if (refresh) {
            grant = azureProps.getProperty("grantTypeRefresh")
            codeVar = "refresh_token"
        }
        else {
            grant = azureProps.getProperty("grantType")
            codeVar = "code"
        }
        
        let url = azureProps.getProperty("domain") +
            azureProps.getProperty("tenant") +
            azureProps.getProperty("oauth") +
            azureProps.getProperty("token") + "?p=" + policy
        Alamofire.request(url, method: .post, parameters:
            ["client_id": azureProps.getProperty("clientId"), "redirect_uri": azureProps.getProperty("redirectUri"), codeVar: auth_code, "grant_type": grant]).responseJSON {
            response in
            switch response.result {
            case .success(let JSON as [String: AnyObject]):
                token.id_token = JSON[TokenType.id_token.rawValue] as! String
                token.refresh_token = JSON[TokenType.refresh_token.rawValue] as! String
                token.access_token = JSON[TokenType.access_token.rawValue] as! String
                completion(token)
            case .failure:
                print(response.result.error!)
            default: break
            }
        }
    }
}
