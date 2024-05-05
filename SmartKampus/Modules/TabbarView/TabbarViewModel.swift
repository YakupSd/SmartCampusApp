//
//  TabbarViewModel.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//


import Foundation

class TabbarViewModel : ObservableObject{

    @Published var tab1Image:String = "homeTabWhite"
    @Published var tab2Image:String = "scanme"
    @Published var tab3Image:String = "profile"
   
    
    init() {
        
        getData()
    }
    
    func sendSms(){
    }
    
    func getData() {
        //api request will be made here
    }
    
    
}
struct TabbarItem:Hashable{
    var title:String
    var icon:String
}
