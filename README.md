# Perf
Simple and swifty performance measure.


## Usage

Download file from GitHub.

```sh
$ curl -s https://raw.githubusercontent.com/mothule/Perf/master/Perf.swift -o ~/Downloads/Perf.swift
```

### Why download

This file is supposed to be used for a little research.
So Therefore, we exclude library and small and difficult structures.

### How to use

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
