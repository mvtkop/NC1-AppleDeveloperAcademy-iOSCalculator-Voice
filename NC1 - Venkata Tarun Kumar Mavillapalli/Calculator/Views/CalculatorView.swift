//
//  CalculatorView.swift
//  Calculator
//
//  Created by Venkata Tarun Kumar Mavillapalli on 23/11/23.
//

import SwiftUI

// MARK: - BODY

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    @State private var isRecording = false
    @State private var recognizedText = ""
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isRecording.toggle()
                    }) {
                        Image(systemName: isRecording ? "mic.fill" : "mic")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                }
                Spacer()
                displayText
                buttonPad
            }
            .padding(Constants.padding)
            .background(Color.black)
        }
    }

// MARK: - PREVIEWS

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
    }
}

// MARK: - COMPONENTS

extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
