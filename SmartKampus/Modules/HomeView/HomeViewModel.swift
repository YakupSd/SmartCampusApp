//
//  HomeViewModel.swift
//  SmartKampus
//
//  Created by Yakup Suda on 5.05.2024.
//

import Foundation

class HomeViewModel : ObservableObject{
    
    @Published var homeButtonList = [HomeViewButton(title: "Koşu", subTitle: "Hareket edin, sağlıklı kalın", icon: "man",type: .running),
                                     HomeViewButton(title: "Yürüyüş", subTitle: "Yürümeyi unutmayın, sağlıklı kalın", icon: "adam",type: .walking),
                                     HomeViewButton(title: "Bisiklet", subTitle: " Bisiklet ile, sağlıklı bacaklar", icon: "bike",type: .cycling),
                                     HomeViewButton(title: "Scotter", subTitle: "Scotter ile, aktif kalın", icon: "scotter",type: .scooter) ]
    
    init() {
        
        getData()
    }
    
    func sendSms(){
    }
    
    func getData() {
        //api request will be made here
    }
    
    
}
struct HomeViewButton:Hashable{
    var title:String
    var subTitle:String
    var icon:String
    var type:IconType
}

enum IconType {
    case running
    case walking
    case cycling
    case scooter
}
