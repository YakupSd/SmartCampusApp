//
//  HomeViewModel.swift
//  SmartKampus
//
//  Created by Yakup Suda on 4.05.2024.
//

import Foundation


class HomeViewModel : ObservableObject{

    @Published var ıtemsNameImageList = [TabBarItemImage(name: "Biz Kimiz ?", image: "tab1"), TabBarItemImage(name: "Nasıl Kullanılır ?", image: "tab2"),TabBarItemImage(name: "Smart Kampüs Nedir ?", image: "tab3") ]
    
    init() {
        getData()
    }

    func getData() {
        
    }
}

struct TabBarItemImage:Hashable {
    var name: String
    var image: String
}
