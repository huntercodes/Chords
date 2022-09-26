//
//  ChordsView.swift
//
//  Created by hunter downey on 9/18/22.
//

import SwiftUI

struct ChordsView: View {
    @State private var selectedInstrument: Instrument = .guitar
    @State private var selectedKey: String = "C"
    @State private var selectedSuffix: String = "major"
    
    private let instruments = [Instrument.guitar, Instrument.ukulele]
    
    private var foundChords: [Chord.Position] {
        selectedInstrument.findChordPositions(key: selectedKey, suffix: selectedSuffix)
    }
    
    var body: some View {
        VStack {
            Text("Chords")
                .font(.largeTitle)
                .padding()
            
            Spacer()
                .frame(height: 23)
            
            Picker("Instrument", selection: $selectedInstrument) {
                ForEach(instruments, id: \.self) {
                    Text($0.name.capitalized(with: nil))
                }
            }
            .pickerStyle(.segmented)
            .background(
                RoundedRectangle(cornerRadius: 7)
                    .fill(
                        Color("backgroundColor").gradient
                    )
                    .frame(maxWidth: 300, maxHeight: 74)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 7)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color("borderColor"))
                    .frame(maxWidth: 300, maxHeight: 74)
            )
            .frame(maxWidth: 300, maxHeight: 87)
            
            Spacer()
                .frame(height: 7)
                
            HStack {
                Spacer()
                    
                Menu {
                    Picker("Key", selection: $selectedKey) {
                        ForEach(selectedInstrument.keys, id: \.self) {
                            Text($0)
                        }
                    }
                    .labelsHidden()
                } label: {
                    Text(selectedKey)
                        .frame(minWidth: 80)
                        .padding(7)
                        .foregroundColor(.primary)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .fill(
                                    Color("backgroundColor").gradient
                                )
                                .frame(maxWidth: 107, maxHeight: 34)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color("borderColor"))
                                .frame(maxWidth: 107, maxHeight: 34)
                        )
                }
                    
                Spacer()
                    
                Menu {
                    Picker("Suffix", selection: $selectedSuffix) {
                        ForEach(selectedInstrument.suffixes, id: \.self) {
                            Text($0)
                        }
                    }
                    .labelsHidden()
                } label: {
                    Text(selectedSuffix)
                        .frame(minWidth: 80)
                        .padding(7)
                        .foregroundColor(.primary)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .fill(
                                    Color("backgroundColor").gradient
                                )
                                .frame(maxWidth: 107, maxHeight: 34)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 7)
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color("borderColor"))
                                .frame(maxWidth: 107, maxHeight: 34)
                        )
                }
                    
                Spacer()
            }
                
            HStack {
                ForEach(foundChords, id: \.self) { position in
                    FretboardView(position: position)
                        .aspectRatio(0.6, contentMode: .fit)
                }
            }
        
            Spacer()
        }
    }
}
