//
//  PickerViewSelected.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 25.04.2024.
//

import SwiftUI

struct PickerViewSelected: View {
    @Binding var selectedItem: String
    @Binding var selectedItemCode: String
    @Binding var pickerItem: [PickerViewItem] // Ekledik
    var mainTitle:String
    @EnvironmentObject var router: MainViewsRouter
    var action: () -> Void = {}

    var body: some View {
        GeometryReader { geo in
            VStack {
//                MainTitleView(screenSize: geo.size, mainTitle: mainTitle)
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(pickerItem, id: \.self) { notification in
                            PickerRowView(pickerDetail: PickerViewItem(id: notification.id ,name: notification.name)) {
                                selectedItem = notification.name
                                selectedItemCode = notification.id
                                print("selectedItem ID : \(notification.id)")
                                router.nav?.popViewController(animated: true)
                            }
                            Divider()
                        }
                    }
                }
                .padding(.top, 10)
            }
        }
    }
}

struct PickerPlateCodeSelected_Previews: PreviewProvider {
    static var previews: some View {
        let pickerItems: [PickerViewItem] = [
            PickerViewItem(id: "0", name: "Item 1"),
            PickerViewItem(id: "1", name: "Item 2"),
            PickerViewItem(id: "2", name: "Item 3")
           
        ]

        return PickerViewSelected(selectedItem: .constant(""), selectedItemCode: .constant(""), pickerItem: .constant(pickerItems), mainTitle: "Model")
            .environmentObject(MainViewsRouter())
    }
}
struct PickerViewItem: Identifiable,Hashable {
    var id : String
    var name: String
}
