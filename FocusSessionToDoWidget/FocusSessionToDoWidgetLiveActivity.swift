//
//  FocusSessionToDoWidgetLiveActivity.swift
//  FocusSessionToDoWidget
//
//  Created by shafique dassu on 18/06/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FocusSessionToDoWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FocusSessionToDoWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FocusSessionToDoWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
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
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FocusSessionToDoWidgetAttributes {
    fileprivate static var preview: FocusSessionToDoWidgetAttributes {
        FocusSessionToDoWidgetAttributes(name: "World")
    }
}

extension FocusSessionToDoWidgetAttributes.ContentState {
    fileprivate static var smiley: FocusSessionToDoWidgetAttributes.ContentState {
        FocusSessionToDoWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FocusSessionToDoWidgetAttributes.ContentState {
         FocusSessionToDoWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FocusSessionToDoWidgetAttributes.preview) {
   FocusSessionToDoWidgetLiveActivity()
} contentStates: {
    FocusSessionToDoWidgetAttributes.ContentState.smiley
    FocusSessionToDoWidgetAttributes.ContentState.starEyes
}
