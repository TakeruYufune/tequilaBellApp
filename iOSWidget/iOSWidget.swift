//
//  iOSWidget.swift
//  iOSWidget
//
//  Created by どりー_Hack'z on 2023/07/16.
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
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct iOSWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            case .systemSmall:
                SmallWidget()
            case .systemMedium:
                MediumWidget()
            case .systemLarge:
                LargeWidget()
            case .systemExtraLarge:
                ExtraLargeWidget()
            case .accessoryInline:
                InlineWidget()
            case .accessoryCircular:
                CircularWidget()
            case .accessoryRectangular:
                RectangularWidget()
            @unknown default:
                Text("No　Complication")
                
         }
    }
}

struct SmallWidget : View {
    var body: some View {
        Image("tequilaSVG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct MediumWidget : View {
    var body: some View {
        Image("tequilaSVG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct LargeWidget : View {
    var body: some View {
        Image("tequilaSVG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct ExtraLargeWidget : View {
    var body: some View {
        Image("tequilaSVG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct InlineWidget : View {
    var body: some View {
        Text("Tequila-Bell")
            .widgetAccentable()
    }
}

struct CircularWidget : View {
    var body: some View {
        Image("tequilaSVG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .widgetAccentable()
    }
}

struct RectangularWidget : View {
    var body: some View {
        Text("Tequila-Bell")
            .widgetAccentable()
    }
}

struct iOSWidget: Widget {
    let kind: String = "iOSWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            iOSWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies(supportedFamilies)
    }
    
    private var supportedFamilies: [WidgetFamily] {
            if #available(iOSApplicationExtension 16.0, *) {
                return [
                    .systemSmall,
                    .systemMedium,
                    .systemLarge,
                    .systemExtraLarge,
                    .accessoryInline,
                    .accessoryCircular,
                    .accessoryRectangular
                ]
            } else {
                return [
                    .systemSmall,
                    .systemMedium,
                    .systemLarge
                ]
            }
        }
}

struct iOSWidget_Previews: PreviewProvider {
    static var previews: some View {
        iOSWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
