//
//  SettingsDeveloperView.swift
//  Fructus
//
//  Created by Natalie Alvarez on 5/20/23.
//

import SwiftUI

struct SettingsDeveloperView: View {
    let developerData: [String: [String]] = [
        "Developer": ["Natalie Alvarez"],
        "Designer": ["Natalie Alvarez"],
        "Compatibility": ["iOS 14"],
        "Website": ["SwiftUI Masterclass", "swiftuimasterclass.com"],
        "SwiftUI": ["2.0"],
        "Version": ["1.1.0"]
    ]
    
    var body: some View {
        GroupBox(
            label:
                SettingsLabelView(labelText: "Application", labelImageName: "apps.iphone")
        ) {
            ForEach(Array(developerData.keys.sorted(by:<)), id: \.self) { key in
                let values = developerData[key]!

                SettingsRowView(name: key, content: values[0], contentLink: (values.count > 1 ? values[1] : nil))
            }

        }
    }
}

struct SettingsDeveloperView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsDeveloperView()
    }
}
