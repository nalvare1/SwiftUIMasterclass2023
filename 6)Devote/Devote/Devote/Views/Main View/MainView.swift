//
//  MainView.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/2/23.
//

import SwiftUI
import CoreData

struct MainView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false

    // MARK: Body:
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: Background:
                backgroundGradient.ignoresSafeArea(.all)
                BackgroundImageView()
                    .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)

                // MARK: App UI:
                VStack {
                    // MARK: Header:
                    HeaderView()

                    Spacer(minLength: 80)

                    // MARK: "New Task" Button:
                    NewTaskButton(showNewTaskItem: $showNewTaskItem)

                    // MARK: Tasks:
                    TaskListView()
                }
                .blur(radius: showNewTaskItem ? 8.0 : 0, opaque: false)
                .transition(.move(edge: .bottom))
                .animation(.easeOut(duration: 0.5))
                .zIndex(1)

                if showNewTaskItem {
                    // MARK: Grey/Semi-Opaque background:
                    BlankView(
                        backgroundColor: isDarkMode ? Color.black : Color.gray,
                        backgroundOpacity: isDarkMode ? 0.3 : 0.5)
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                        .zIndex(2)

                    // MARK: New Task Item View:
                    NewTaskItemView(isShowing: $showNewTaskItem)
                        .zIndex(3)

                }
            }
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor.clear
            }
            .navigationBarTitle("Daily Tasks", displayMode: .large)
            .navigationBarHidden(true)

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
