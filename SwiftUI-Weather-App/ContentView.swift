//
//  ContentView.swift
//  SwiftUI-Weather-App
//
//  Created by Arshon Saadati on 7/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
                .ignoresSafeArea()
            VStack {
                CityView(city: "Cupertino, CA")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76).padding(.bottom, 40)

                HStack(spacing: 10) {
                    WeatherDayView(day: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(day: "WED", imageName: "sun.max.fill", temperature: 76)
                    WeatherDayView(day: "THU", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(day: "FRI", imageName: "cloud.snow.fill", temperature: 76)
                    WeatherDayView(day: "SAT", imageName: "cloud.fill", temperature: 76)
                }
                Spacer()
                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white, isNight: $isNight)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct WeatherDayView: View {
    var day: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.mint, .orange)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CityView: View {
    var city: String
    var fontSize: Double = 32
    var body: some View {
        Text(city)
            .font(.system(size: fontSize, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
