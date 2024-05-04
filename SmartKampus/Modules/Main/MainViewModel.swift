//
//  MainViewModel.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//

import Foundation


 class MainViewModel : ObservableObject{

    @Published var smsCode:String = ""
    
    
    init() {
       
        getData()
    }
    
    func sendSms(){
        
    }
    
    func getData() {
      //api request will be made here
    }
}


