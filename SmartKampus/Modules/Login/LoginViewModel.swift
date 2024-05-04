//
//  LoginViewModel.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 18.04.2024.
//


import Foundation


class LoginViewModel : ObservableObject{
    
    @Published var smsCode:String = ""
    @Published var isLogged:Bool = false
    
    //MARK: Login userName && Pass
    
    @Published var loginUserName:String = ""
    @Published var loginPassword:String = ""
    
    
    @Published var savedEmail:String = "irem.polat@ogr.edu.dpu.tr"
    @Published var savedUserName:String = "iremnurpolat"
    @Published var savedPassword:String = "12345678"
    
    //MARK: SingIn page code
    
    @Published var singUserName:String = ""
    @Published var singEmail:String = ""
    @Published var singPassword:String = ""
    
    //MARK: forgotPass page code
    
    @Published var forgotEmail:String = ""
    @Published var approvalForgotEmail:String = "irem.polat@ogr.edu.dpu.tr"
    
    //MARK: ResetPass page code
    
    @Published var resetPassword:String = ""
    @Published var resetPasswordAgain:String = ""
    
    func isValid()->Bool{
        if loginUserName.count >= 8 && loginPassword.count >= 7 && loginUserName.first != "0"{
            return true
        }
        return false
    }
    
    func singInIsValid()->Bool{
        if singUserName.count >= 8 && singPassword.count >= 7 && singUserName.first != "0" && singEmail.count >= 8{
            return true
        }
        return false
    }
    
    func forgotIsValid()->Bool{
        if singEmail.count >= 8{
            return true
        }
        return false
    }
    func resetPassIsValid()->Bool{
        if resetPassword.count >= 8 && resetPasswordAgain.count >= 8{
            return true
        }
        return false
    }

    init() {
        
        getData()
    }
    
    func sendSms(){
    }
    
    func getData() {
        //api request will be made here
    }
    
    func saveUserDetail() {
        // Kullanıcı verilerini kaydetme işlemi
        // Örneğin: UserDefaults kullanarak
        UserDefaults.standard.set(savedUserName, forKey: "SavedUserName")
        UserDefaults.standard.set(savedPassword, forKey: "SavedPassword")
        UserDefaults.standard.set(savedEmail, forKey: "SavedEmail")
    }
    func loadUserDetail() {
        // Kullanıcı verilerini yükleme işlemi
        // Örneğin: UserDefaults kullanarak
        if let userName = UserDefaults.standard.string(forKey: "SavedUserName") {
            self.savedUserName = userName
        }
        if let password = UserDefaults.standard.string(forKey: "SavedPassword") {
            self.savedPassword = password
        }
        if let email = UserDefaults.standard.string(forKey: "SavedEmail") {
            self.savedEmail = email
        }
    }
    func resetUserDetail() {
        // Kullanıcı verilerini sıfırlama işlemi
        self.savedUserName = ""
        self.savedPassword = ""
        self.savedEmail = ""
        
        // Örneğin: UserDefaults üzerindeki verileri sıfırlama
        UserDefaults.standard.removeObject(forKey: "SavedUserName")
        UserDefaults.standard.removeObject(forKey: "SavedPassword")
        UserDefaults.standard.removeObject(forKey: "SavedEmail")
    }
    
    
}

