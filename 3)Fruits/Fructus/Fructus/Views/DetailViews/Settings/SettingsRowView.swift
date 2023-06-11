//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String
    var contentLink: String? = nil

    var body: some View {
        Divider().padding(.vertical, 4)

        HStack {
            Text(name).foregroundColor(Color.gray)
            Spacer()
            if (contentLink != nil) {
                Link(content, destination: URL(string: "https://\(contentLink!)")!)
                Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
            } else {
                Text(content)
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Natalie")
            .previewLayout(.fixed(width: 375, height: 60))
        SettingsRowView(name: "Website", content: "SwiftUI Masterclass", contentLink: "swiftuimasterclass.com")
            .previewLayout(.fixed(width: 375, height: 60))
    }
}
