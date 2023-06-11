//
//  DevoteWidget.swift
//  DevoteWidget
//
//  Created by Natalie Alvarez on 6/8/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider { // tells the widget when to update the widget's display

    // 1) placeholder(): is a placeholder-version of the Widget:
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    // 2) getSnapshot(): provides a timeline entry that represents the current time and state of the Widget:
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    // 3) getTimeline(): provides an array of timeline entries for the current time (and optionally, any futures times to update the Widget):
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date:
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// SimpleEntry: a simple struct with only one property (a date) so that WidgetKit can render a Widget with it:
struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

// DevoteWidgetEntryView: this is where we create the actual layout and design for the Widget:
struct DevoteWidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var widgetFamily // here, we can get the Widget's size
    var fontStyle: Font {
        if widgetFamily == .systemSmall {
            return .system(.footnote, design: .rounded)
        } else {
            return .system(.headline, design: .rounded)
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("rocket-small")
                    .resizable()
                    .scaledToFit()

                Image("logo")
                    .resizable()
                    .frame(
                        width: widgetFamily == .systemSmall ? 36 : 56,
                        height: widgetFamily == .systemSmall ? 36 : 56
                    )
                    .offset(
                        x: (geometry.size.width / 2) - 20,
                        y: (geometry.size.height / -2) + 20
                    )
                    .padding(.top, widgetFamily == .systemSmall ? 12 : 32)
                    .padding(.trailing, widgetFamily == .systemSmall ? 12 : 32)

                HStack {
                    Text("Just Do It")
                        .foregroundColor(.white)
                        .font(fontStyle)
                        .fontWeight(.bold)
                        .padding(.vertical, 4)
                        .background(
                            Color(red: 0, green: 0, blue: 0, opacity: 0.5)
                                .blendMode(.overlay)
                        )
                    .clipShape(Capsule())

                    if widgetFamily != .systemSmall {
                        Spacer() // moves "Just Do It" text to bottom left corner
                    }
                }
                .padding()
                .offset(y: (geometry.size.height / 2) - 24)
            }
        }
        .containerBackground(for: .widget) { // Remove the white border:
            backgroundGradient
        }
    }
}

/* DevoteWidget: this struct is the most crucial part of the Widget!! Here is the entry point of the Widget:
   The only requirement of the "Widget" protocol is to provide a "body" property (that should return an instance of the WidgetConfiguration)
   SwiftUI provides two options:
   - StaticConfiguration: allows us to register a Widget configured by the developer (that from time to time allows us to update its data)
                          - needs 3 parameters: kind, provider?, and view builder closure?
   - IntentConfiguration: provides user-configurable options (ex: iOS Weather widget, where we can select the current weather conditions and forecast for a location)
*/
struct DevoteWidget: Widget {
    let kind: String = "DevoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DevoteWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is an example widget for the personal task manager app.")
    }
}

// Widgets can come in 3 sizes: small, medium, and large:
#Preview(as: .systemSmall) {
    DevoteWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

#Preview(as: .systemMedium) {
    DevoteWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

#Preview(as: .systemLarge) {
    DevoteWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
