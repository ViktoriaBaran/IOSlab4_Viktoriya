import SwiftUI


struct ContentView: View {
    @State private var carStatus: String = "Готується до поїздки 🏁"
    @State private var mileageInput: String = "45 200"
    
    var body: some View {
        ZStack {
            //Фон з градієнтом
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.blue.opacity(0.4)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                //Основний вертикальний стек
                VStack(spacing: 20) {
                    
                    // Блок іконки машини з ефектом
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 220)
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                        
                        VStack(spacing: 12) {
                            Image(systemName: "car.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .foregroundColor(.cyan)
                                .shadow(color: .cyan.opacity(0.6), radius: 10)
                            
                            Text("Renault Megane III")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("1.5 dCi • 2011")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    //Характеристики
                    HStack(spacing: 12) {
                        CarSpecCard(icon: "fuelpump.fill", title: "Пальне", value: "Дизель")
                        CarSpecCard(icon: "speedometer", title: "Пробіг", value: "\(mileageInput) км")
                        CarSpecCard(icon: "gearshape.fill", title: "КПП", value: "Механіка")
                    }
                    .padding(.horizontal)
                    
                    // Блок введення/редагування
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Статус та нотатки:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.cyan)
                        
                        HStack {
                            Image(systemName: "note.text")
                                .foregroundColor(.cyan)
                            
                            TextField("Введіть статус авто...", text: $carStatus)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .padding(.horizontal)
                    
                    // Додаткова інформаційна панель
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "wrench.and.screwdriver.fill")
                                .foregroundColor(.orange)
                            Text("Технічний стан")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                        Text("Автомобіль у справному технічному стані. Перевірено роботу круїз-контролю, клімат-контролю та витрату пального в дорозі.")
                            .font(.body)
                            .foregroundColor(.gray)
                            .lineSpacing(4)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(15)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
}


struct CarSpecCard: View {
    var icon: String
    var title: String
    var value: String
    
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.cyan)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(Color.white.opacity(0.08))
        .cornerRadius(12)
    }
}


#Preview {
    ContentView()
}
