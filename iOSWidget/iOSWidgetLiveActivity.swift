//
//  iOSWidgetLiveActivity.swift
//  iOSWidget
//
//  Created by どりー_Hack'z on 2023/07/16.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct iOSWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct iOSWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: iOSWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct iOSWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = iOSWidgetAttributes(name: "Me")
    static let contentState = iOSWidgetAttributes.ContentState(value: 3)

    static var previews: some View {
        if #available(iOSApplicationExtension 16.2, *) {
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.compact))
                .previewDisplayName("Island Compact")
            
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
                .previewDisplayName("Island Expanded")
            
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
                .previewDisplayName("Minimal")
            
            attributes
                .previewContext(contentState, viewKind: .content)
                .previewDisplayName("Notification")
        } else {
            // Fallback on earlier versions
        }
    }
}
