//
//  ProfileViewModel.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import Foundation

class ProfileViewModel : ObservableObject{
   
    @Published var healtyItemList = [ HealtyItem(name: "başarımlar", icon:"madalya1"),HealtyItem(name: "verilerim", icon:"veri"),HealtyItem(name: "planlarım", icon:"defter"),HealtyItem(name: "Profil", icon:"profil")]
    
    @Published var otherItemList = [ OtherItem(name: "Ayarlar", icon: "ayarlar"), OtherItem(name: "Yardım", icon: "belge"), OtherItem(name: "Hakkında", icon: "infoprofile") ]
    
    init() {
        
        getData()
    }
    
    func sendSms(){
    }
    
    func getData() {
        //api request will be made here
    }
    
    
}
struct HealtyItem:Hashable {
    var name:String
    var icon:String
}

struct OtherItem :Hashable{
    var name:String
    var icon:String
}
