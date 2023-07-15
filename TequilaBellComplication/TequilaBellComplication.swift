//
//  TequilaBellComplication.swift
//  TequilaBellComplication
//
//  Created by どりー_Hack'z on 2023/07/05.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    func recommendations() -> [IntentRecommendation<ConfigurationIntent>] {
        return [
            IntentRecommendation(intent: ConfigurationIntent(), description: "TequilaBell")
        ]
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct TequilaBellComplicationEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
                case .accessoryCorner:
                    CornerComplication()
                case .accessoryCircular:
                    CircularComplication()
                case .accessoryInline:
                    InlineComplication()
                case .accessoryRectangular:
                    RectangularComplication()
                @unknown default:
                    Text("No　Complication")
         }
    }
}

struct InlineComplication : View {
    var body: some View {
        Text("Tequila-Bell")
            .widgetAccentable()
    }
}

struct CircularComplication : View {
    var body: some View {
        //Image(systemName:"apple.logo")
        Image("tequilaSmall")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
        .widgetLabel {
            Text("TequilaBell")
        }
    }
}

struct CornerComplication : View {
    var body: some View {
        Image("tequilaSmall")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct RectangularComplication : View {
    var body: some View {
        Image("tequilaSmall")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

@main
struct TequilaBellComplication: Widget {
    let kind: String = "TequilaBellComplication"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TequilaBellComplicationEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TequilaBellComplication_Previews: PreviewProvider {
    static var previews: some View {
        TequilaBellComplicationEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
}
