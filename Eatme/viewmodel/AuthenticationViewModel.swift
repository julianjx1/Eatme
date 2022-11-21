//
//  AuthenticationViewModel.swift
//  Eatme
//
//  Created by Mahir Shahriar Lipeng on 20/11/22.
//

import Foundation

enum VerificationStatus {
    case incorrect, correct, loading, notDefiend, exist
}

enum ButtonStatus{
    case notSubmit, loading, onSubmit
}
class AuthenticationViewModel: ObservableObject{
    
    @Published var user:User = User()
    @Published var emailVerificationStatus: VerificationStatus = .notDefiend
    @Published var usernameVerificationStatus: VerificationStatus = .notDefiend
    @Published var buttonStatus: ButtonStatus = .notSubmit
    @Published var isSaveMe:Bool = false
    
    fileprivate let isLogin: Bool
    
    init(isLogin:Bool){
        self.isLogin = isLogin
    }
    
    fileprivate var emailWorkItem: DispatchWorkItem?
    fileprivate var usernameWorkItem: DispatchWorkItem?
    fileprivate var formSubmitWorkItem: DispatchWorkItem?
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    fileprivate func isEmailAvailable(){
        emailVerificationStatus = .correct
    }
    
    func isEmailVerified(){
        emailVerificationStatus = .loading
        emailWorkItem?.cancel()
        emailWorkItem = DispatchWorkItem { [self] in
            if user.email.isEmpty {
                emailVerificationStatus =  .notDefiend
                return
            }
            let validate = isValidEmail(user.email)
            if validate{
                if isLogin{
                    emailVerificationStatus = .correct
                }
                else{
                    isEmailAvailable()
                }
            }
            else{
                emailVerificationStatus = .incorrect
            }
        }
        guard let emailWorkItem = self.emailWorkItem else {return}
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + .seconds(2), execute: emailWorkItem)
    }
    
    fileprivate func isUsernameAvailable(){
        usernameVerificationStatus =  .correct
    }
    
    func isUserNameVerified(){
        usernameVerificationStatus = .loading
        usernameWorkItem?.cancel()
        usernameWorkItem = DispatchWorkItem { [self] in
            if user.userName.isEmpty {
                usernameVerificationStatus =  .notDefiend
            }else{
                isUsernameAvailable()
            }
            
        }
        guard let usernameWorkItem = self.usernameWorkItem else {return}
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + .seconds(2), execute: usernameWorkItem)
    }
    
    func submitForLogin(){
        buttonStatus = .loading
        formSubmitWorkItem?.cancel()
        formSubmitWorkItem = DispatchWorkItem{ [self] in
            buttonStatus = .onSubmit
        }
        guard let formSubmitWorkItem = self.formSubmitWorkItem else {return}
        DispatchQueue.global(qos: .utility).asyncAfter(deadline: .now() + .seconds(2), execute: formSubmitWorkItem)
    }
    
    
    
}
