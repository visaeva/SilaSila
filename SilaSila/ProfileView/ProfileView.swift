
import SwiftUI
import PhotosUI

struct ProfileTabView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	@ObservedObject var viewModel: ProfileViewModel
	@State private var pickerItem: PhotosPickerItem?
	//@State private var selectedImage: Image?
	
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
			.animation(.easeInOut(duration: 0.3), value: viewModel.selectedImage)
		}
	}
	
	private var header: some View {
		HStack(alignment: .top, spacing: 20) {
			VStack(spacing: 8) {
				PhotosPicker(
					selection: $pickerItem,
					matching: .images,
					photoLibrary: .shared()
				) {
					if let selectedImage = viewModel.selectedImage {
						selectedImage
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
							.transition(.opacity.combined(with: .scale))
					} else if let base64String = viewModel.profile.image,
							  let data = Data(base64Encoded: base64String),
							  let uiImage = UIImage(data: data) {
						Image(uiImage: uiImage)
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
							.transition(.opacity.combined(with: .scale))
					} else {
						Image("avatar")
							.resizable()
							.frame(width: 80, height: 80)
							.clipShape(Circle())
							.transition(.opacity.combined(with: .scale))
					}
				}
				
				if viewModel.selectedImage != nil {
					Button(action: {
						withAnimation {
							viewModel.deleteImage()
						}
					}) {
						Text("Удалить")
							.font(.caption)
							.foregroundColor(.gray)
					}
				}
			}
			
			VStack(alignment: .leading, spacing: 5) {
				Text("\(viewModel.profile.name) \(viewModel.profile.lastName)")
					.font(.title)
				Text("\(viewModel.profile.bio)")
					.font(.subheadline)
			}
			
			Spacer()
		}
		.padding(.top, 20)
		.padding(.horizontal, 20)
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
				await MainActor.run {
					viewModel.selectedImage = Image(uiImage: uiImage)
					viewModel.saveImage(uiImage)
				}
			}
		}
	}
}

#Preview {
	ProfileTabView(viewModel: ProfileViewModel())
}

