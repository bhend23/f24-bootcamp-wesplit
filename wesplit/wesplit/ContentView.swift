//
//  ContentView.swift
//  wesplit
//
//  Created by Brandon Henderson on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var amount: Double = 0.0
    @State var numpeople: Double = 0.0
    @State var selectedTip = ""
    
    var totalTip: Double {
        let tipPercentage = Double(selectedTip.dropLast()) ?? 0.0
        let tipAmount = amount * (tipPercentage / 100)
        let totalAmount = amount + tipAmount
        return totalAmount
    }
    
    let tip = ["10%", "15%", "20%", "25%", "0%"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $amount, format: .number)
                        .keyboardType(.decimalPad)
                    TextField("Number of People", value: $numpeople, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("How much tip do you want to leave?") {
                    Picker("Tip", selection: $selectedTip) {
                        ForEach(tip, id: \.self) {tip in
                            Text(tip)
                        }
                    }
                    .pickerStyle(.segmented)
                        }
                Section("Check Total with Tip:") {
                                    Text(totalTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                }
                Section("Amount per person:") {
                    Text(totalTip / numpeople, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

                }
            .navigationTitle("WeSplit")
            }
        }
    }

#Preview {
    ContentView()
}
