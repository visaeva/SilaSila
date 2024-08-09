import SwiftUI

struct StoriesCellView: View {
    let imageHeight: CGFloat = 100
    let imageWidth: CGFloat = 100
    let images = ["story1", "story2", "story3", "story4"]
    @State private var viewedStories: Set<Int> = []
    let stories: [StoryStruct] = [.story1, .story2, .story3, .story4]
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<images.count) { index in
                        let story = stories[index]
                        NavigationLink(destination: StoriesAllView(stories: stories, selectedStory: story, viewedStories: $viewedStories)) {
                            ZStack(alignment: .bottomLeading) {
                                if index < images.count {
                                    Image(images[index])
                                        .resizable()
                                        .frame(width: imageWidth, height: imageHeight)
                                        .clipShape(Circle())
                                } else {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: imageWidth, height: imageHeight)
                                        .cornerRadius(16)
                                }
                                
                                Text("Text Text\nText Text\nText Text Text")
                                    .font(.system(size: 12, weight: .regular))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                    .lineLimit(3)
                                    .padding(8)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color(.blue), lineWidth:  5))
                            .clipShape(Circle())
                        }
                    }
                }
                .padding(.vertical, 12)
            }
            .background(Color.black)
        }
    }
}



#Preview {
    StoriesCellView()
}
