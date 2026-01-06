//
//  Stopwatch.swift
//  
//
//  Created by tanmaydeep on 28/01/26.
//

import SwiftUI

struct StopwatchView: View {
    var body: some View {
        VStack()
        {
            Spacer()
            Text("00:00:00")
                .font(.system(size: 70))
                .bold()
            HStack()
            {
                Button("Start")
                {}
                Button("Stop")
                {}
            }
            Spacer()
            
            VStack()
            {
               Text("Laps")
                    .font(.title2)
            }
            Spacer()
            
        }
        
        
            .navigationTitle(Text("Stopwatch"))
    }
}

#Preview {
    StopwatchView()
}
