
import SwiftUI
import PhotosUI

struct ProfileTabView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@ObservedObject var viewModel: ProfileViewModel
	@State private var pickerItem: PhotosPickerItem?
	@State private var selectedImage: Image?
	
	var body: some View {
		NavigationStack {
			VStack {
				header
				profileContacts
				Spacer()
			}
			.onChange(of: pickerItem) {
				loadImage()
			}
		}
	}
	
	private var header: some View {
		HStack(spacing: 20) {
			PhotosPicker(
				selection: $pickerItem,
				matching: .images,
				photoLibrary: .shared()) {
					if let selectedImage = viewModel.selectedImage {
						selectedImage
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
					} else {
						Image(viewModel.profile.image)
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
					}
				}
			
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
	
	private func loadImage() {
		guard let item = pickerItem else { return }
		
		Task {
			if let data = try? await item.loadTransferable(type: Data.self),
			   let uiImage = UIImage(data: data) {
				let image = Image(uiImage: uiImage)
				await MainActor.run {
					viewModel.selectedImage = image
				}
			}
		}
	}
}

#Preview {
	ProfileTabView(viewModel: ProfileViewModel())
}

