import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    @Binding var isNight: Bool
    var body: some View {
        Button(action: {
            isNight.toggle()
        }) {
            Text(title)
                .frame(width: 280, height: 50)
                .background(Color.mint.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
    }
}
