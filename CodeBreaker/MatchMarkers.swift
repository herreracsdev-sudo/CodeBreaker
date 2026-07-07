//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Daniel Herrera on 6/4/26.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match]

    var body: some View {

        HStack {
            // one column of two markers per pair of pegs
            ForEach(0..<(matches.count + 1) / 2, id: \.self) { column in
                VStack {
                    matchMarker(peg: column * 2)
                    matchMarker(peg: column * 2 + 1)
                }
            }
        }
    }

    func matchMarker(peg: Int) -> some View {
        let exactCount: Int  = matches.count( where: { $0 == .exact } )
        let foundCount: Int = matches.count( where: { $0 != .nomatch} )

        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(contentMode: .fit)
            .fixedSize()

    }
}

struct MatchMarkersPreview: View {

    var matches: [Match]

    var body: some View {
        HStack {
            // one large peg per match, followed by the markers
            ForEach(matches.indices, id: \.self) { _ in
                Circle()
                    .aspectRatio(1, contentMode: .fit)
            }
            MatchMarkers(matches: matches)
            Spacer(minLength: 0)
        }
        .padding()

    }
}

#Preview {
    MatchMarkersPreview(matches: [.exact, .inexact, .inexact])
    MatchMarkersPreview(matches: [.exact, .nomatch, .nomatch])
    MatchMarkersPreview(matches: [.exact, .exact, .inexact, .inexact])
    MatchMarkersPreview(matches: [.exact, .exact, .inexact, .nomatch])
    MatchMarkersPreview(matches: [.exact, .inexact, .nomatch, .nomatch])
    MatchMarkersPreview(matches: [.exact, .exact, .exact, .inexact, .nomatch, .nomatch])
    MatchMarkersPreview(matches: [.exact, .exact, .exact, .inexact, .inexact, .nomatch])
    MatchMarkersPreview(matches: [.exact, .exact, .inexact, .inexact, .inexact])
    MatchMarkersPreview(matches: [.exact, .inexact, .inexact, .nomatch, .nomatch])
}
