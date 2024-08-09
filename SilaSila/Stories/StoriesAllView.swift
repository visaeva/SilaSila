//
//  StoriesAllView.swift
//  SilaSila
//
//  Created by Victoria Isaeva on 29.07.2024.
//

import SwiftUI

import Combine

struct StoriesAllView: View {
    private var selectedStory: StoryStruct
    private var stories: [StoryStruct]
    private var currentStory: StoryStruct { stories[currentStoryIndex] }
    private var currentStoryIndex: Int { Int(progress * CGFloat(stories.count)) }
    
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 5, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    @Environment(\.presentationMode) var presentationMode
    private let configuration: ConfigurationTimer
    @Binding var viewedStories: Set<Int>
    
    init(stories: [StoryStruct], selectedStory: StoryStruct, viewedStories: Binding<Set<Int>>) {
        self.stories = stories
        self.selectedStory = selectedStory
        self._viewedStories = viewedStories
        self._progress = State(initialValue: CGFloat(stories.firstIndex(of: selectedStory)!) / CGFloat(stories.count))
        self.configuration = ConfigurationTimer(storiesCount: stories.count)
        self.timer = Self.createTimer(configuration: self.configuration)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            StoryView(story: currentStory)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -50 {
                                nextStory()
                            } else if value.translation.width > 50 {
                                previousStory()
                            }
                        }
                )
            ProgressBar(numberOfSections: stories.count, progress: progress)
                .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            
            CloseButton(action: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(.top,30)
            .padding(.trailing, -5)
            
        }
        .onAppear {
            timer = Self.createTimer(configuration: configuration)
            cancellable = timer.connect()
            markStoryAsViewed()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            timerTick()
        }
        .onTapGesture {
            nextStory()
            resetTimer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func timerTick() {
        var nextProgress = progress + configuration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        withAnimation {
            progress = nextProgress
            markStoryAsViewed()
        }
    }
    
    private func nextStory() {
        let storiesCount = stories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let nextStoryIndex = currentStoryIndex + 1
        
        if nextStoryIndex >= storiesCount {
            presentationMode.wrappedValue.dismiss()
        } else {
            withAnimation {
                progress = CGFloat(nextStoryIndex) / CGFloat(storiesCount)
                markStoryAsViewed()
            }
        }
    }
    
    private func previousStory() {
        let storiesCount = stories.count
        let currentStoryIndex = Int(progress * CGFloat(storiesCount))
        let previousStoryIndex = currentStoryIndex - 1 >= 0 ? currentStoryIndex - 1 : storiesCount - 1
        withAnimation {
            progress = CGFloat(previousStoryIndex) / CGFloat(storiesCount)
            markStoryAsViewed()
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Self.createTimer(configuration: configuration)
        cancellable = timer.connect()
    }
    
    private func markStoryAsViewed() {
        viewedStories.insert(currentStoryIndex)
    }
    
    private static func createTimer(configuration: ConfigurationTimer) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    StoriesAllView(stories: [StoryStruct.story1], selectedStory: StoryStruct.story1, viewedStories: .constant(Set<Int>()))
}
