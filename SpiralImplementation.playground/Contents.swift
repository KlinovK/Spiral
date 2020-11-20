import UIKit
import Foundation

// Press (command-/+) for scaling editor font size

public var twoDimensionArraySize: Float = 37
public var countOfLoops: Float = 6

func generate2DArray(with size: Float) -> [[String]] {
  let numbers = [[String]](repeating: [String](repeating: " ", count: Int(size)), count: Int(size))
  twoDimensionArraySize = size
  return numbers
}

func generateSpiralCoordinates(with countOfLoops: Float) -> [(Int, Int)] {
  
  let twopi: Float = 6.2
  let angleStep: Float = 0.1
  let aStep: Float = 0.5 // is minimal aStep value for this solution
  var angle: Float = 0.0
  var a: Float = 0
  var r: Float = 0
  var spiral2Dindexes: [(Int, Int)] = []
  
  while angle < (twopi * countOfLoops) {
    angle += angleStep
    a += aStep
    r = aStep * angle
    let x = (r * cos(angle))
    let y = (r * sin(angle))
    let rowIndex = (twoDimensionArraySize / 2) - y
    let columnIndex = (twoDimensionArraySize / 2) + x
    spiral2Dindexes.append((Int(rowIndex), Int(columnIndex)))
  }
  
  return spiral2Dindexes
  
}

func insertStarsTo2DArray(with generatedSpiralCoordinates: [(Int, Int)]) {
  for coordinate in generatedSpiralCoordinates {
    if coordinate.0 >= Int(twoDimensionArraySize) || coordinate.1 >= Int(twoDimensionArraySize) {
      print("Please, increase 2DArraySize or decrease countOfLoops")
      break
    } else {
      generated2DArray[coordinate.0][coordinate.1] = "*"
    }
  }
}

func printSpiral(in twoDimensionArray: [[String]]) {
  for row in twoDimensionArray {
    print(row)
  }
}

var generated2DArray = generate2DArray(with: twoDimensionArraySize)
var generatedSpiralCoordinates = generateSpiralCoordinates(with: countOfLoops)
insertStarsTo2DArray(with: generatedSpiralCoordinates)
printSpiral(in: generated2DArray)
