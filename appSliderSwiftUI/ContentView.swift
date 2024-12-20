import SwiftUI

struct ContentView: View {
    
    @State private var numero: Double = 0
    @State private var resultado: String = ""
    
    var body: some View {
        VStack {
            // Título
            Text("Factorial")
                .font(.title)
                .bold()
                .padding()

            // Slider para seleccionar el número
            Slider(value: $numero, in: 0...10, step: 1)
                .padding(.horizontal, 10)
                .background(Capsule().stroke(Color.blue, lineWidth: 3))
                .accentColor(.blue)

            // Mostrar el número seleccionado
            Text("Número: \(Int(numero))")
                .font(.title2)
                .padding(.top, 10)
            
            // Botón para calcular el factorial
            Button(action: {
                let num = Int(numero)  // Conversión directa a Int
                resultado = "Factorial de \(num) es: \(factorial(num))"
            }) {
                Text("Calcular")
                    .font(.title)
                    .padding()
                    .background(Capsule().fill(Color.blue))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
            }
            .padding(.top, 20)
            
            // Resultado del cálculo
            Text(resultado)
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding()
    }
    
    // Función para calcular el factorial de un número
    func factorial(_ n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return n * factorial(n - 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
