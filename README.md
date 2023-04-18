# typst-braid
Braid Group Visualization in Typst.

I wrote this in about an hour for a presentation; the output is not nearly as pretty as comparable tools using tikz, but the output is certainly workable. There are a number of configuration parameters available, their default values and concise explanations are given below.

```
strands: 0         // number of strands in the group
unit_width: 18pt   // width separating each strand
unit_height: 40pt  // height of an individual crossing
stroke: 2pt        // weight of each line for under-crossings
bold_stroke: 4pt   // weight of each line for over-crossings
curvature: 0.25    // allowed values between 0 and 1, higher values are more curvy
```

Example:
```typ
#braid(strands: 3)[$sigma_1 sigma_2^(-1) sigma_1 sigma_2^(-1)$]
#braid(strands: 2)[$sigma_1 sigma_1^(-1)$]
```