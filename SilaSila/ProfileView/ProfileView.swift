
import SwiftUI

struct ProfileTabView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@ObservedObject var viewModel: ProfileViewModel
	
	var body: some View {
		NavigationStack {
			VStack {
				header
				profileContacts
				Spacer()
			}
			
		}
	}
	
	private var header: some View {
		HStack(spacing: 20) {
			Image(viewModel.profile.image)
				.resizable()
				.frame(width: 80, height: 80)
				.clipShape(Circle())
			
			VStack(alignment: .leading) {
				Text("\(viewModel.profile.name) \(viewModel.profile.lastName)")
					.font(.title)
				Text("\(viewModel.profile.bio)")
					.font(.subheadline)
				
				
			}
			Spacer()
		}
		.padding(.top, 20)
		.padding(.leading, 20)
	}
	
	private var profileContacts: some View {
		VStack(alignment: .leading, spacing: 10) {
			HStack {
				Image(systemName: "phone.fill")
				Text("\(viewModel.profile.phoneNumber)")
					.lineLimit(1)
			}
			HStack {
				Image(systemName: "envelope.fill")
				Text("\(viewModel.profile.email)")
					.lineLimit(1)
			}
		}
		.padding(.top, 15)
		.padding(.trailing, 150)
	}
}

#Preview {
	ProfileTabView(viewModel: ProfileViewModel())
}

