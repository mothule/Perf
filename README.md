# Perf
Simple and swifty performance measure.


## Usage

```swift
var results: [Perf.Result] = []

var ret = Perf(numberOfCaptures: 10).capture(label: "capture name") {
  // Something processing.
}
results.append(ret)

ret = Perf(numberOfCaptures: 10).capture(label: "any name") {
  // Something processing.
}
results.append(ret)

print(Perf.toCSV(from: results)) // Output in CSV format.
print(Perf.toDictionary(from: results)) // Output in Dictionary format
```

## Result model

- label
- number of captures
- fastest time in the captures
- latest time in the captures
- average time in the captures
