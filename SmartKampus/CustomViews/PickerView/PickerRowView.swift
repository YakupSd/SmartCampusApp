//
//  PickerRowView.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 25.04.2024.
//

import SwiftUI

struct PickerRowView: View {
    var pickerDetail: PickerViewItem
    var action: () -> (Void) = {}
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(pickerDetail.name)
                    .font(.setCustomFont(name: .PoppinsBold, size: 15))
                    .foregroundColor(ThemeColors.theme1.black)
            }
            Spacer()
           
        }
        .background(Color.white)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, minHeight: 50)
        .onTapGesture{
            action()
        }
    }
}

#Preview {
    PickerRowView(pickerDetail: PickerViewItem(id: "0", name: "deneme"))
}
