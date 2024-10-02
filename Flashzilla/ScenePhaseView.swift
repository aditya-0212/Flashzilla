//
//  ScenePhaseView.swift
//  Flashzilla
//
//  Created by APPLE on 13/09/24.
//

import SwiftUI

struct ScenePhaseView: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
       Text("Hello Aditya")
            .onChange(of:scenePhase){ oldPhase, newPhase in
                if newPhase == .active{
                    print("Active")
                }else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background{
                    print("Background")
                }
            }
    }
}

#Preview {
    ScenePhaseView()
}
