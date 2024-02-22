import SwiftUI



struct WeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var weather: ResponseBody
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: ResponseBody(coord:ResponseBody.CoordinateResponse(lon: 0, lat: 0),
             weather: [],
             main: ResponseBody.MainResponse(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0),
              name: "",
             wind: ResponseBody.WindResponse(speed: 0, deg: 0)))
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(weather.name)
                .font(.system(size: 36, weight: .semibold))
            
            Text(Date().formatted(.dateTime.month().day()))
                .font(.system(size: 20))
                .opacity(0.5)
            
            HStack {
                if let id = weather.weather.first?.id,
                   let group = WeatherGroup.group(for: id) {
                    Image(group.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210)
                        .offset(y: -70)
                }
                
                VStack {
                    Text(weather.weather[0].main)
                        .font(.system(size: 36, weight: .semibold))
                    Text(weather.weather[0].description)
                        .font(.system(size: 26))
                }
                .padding(.leading)
                .offset(y: -30)
                Spacer()
            }
            .padding(.vertical)
            
            CardView(icon: "thermometer", text: "Min temp", value: "\(weather.main.tempMin.rounded())°")
            CardView(icon: "thermometer", text: "Max temp", value: "\(weather.main.tempMax.rounded())°")
            CardView(icon: "wind", text: "Wind Speed", value: "\(weather.wind.speed.rounded()) m/s")
            CardView(icon: "humidity", text: "Humidity", value: "\(weather.main.humidity.rounded())%")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [
            colorScheme == .dark ? Color("nightLight") : Color("light"),
            colorScheme == .dark ? Color("nightDark") : Color("dark"),
        ], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previews as! ResponseBody)
    }
}

struct CardView: View {
    var icon: String
    var text: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 50, height: 50)
                .background(Color.white.opacity(0.7))
                .cornerRadius(12)
            
            Text(text)
                .font(.system(size: 15))
            Spacer()
            
            Text(value)
                .font(.headline)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Color.white.opacity(0.3))
        .cornerRadius(12)
    }
}
