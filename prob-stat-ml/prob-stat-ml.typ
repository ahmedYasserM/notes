// *************************** Plugins & Blocks Start *************************** //

#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#codly(
  fill: rgb("#FDF5E5"),
  languages: (python: (name: "py", color: rgb("#e8da58"))),
  zebra-fill: none,
)


#let coro(body) = {
  text(rgb("#AD715A"))[Corollary #body]
  v(-0.3em)
}

#let def(body) = {
  text(rgb("#7B7DBD"))[Definition (#body)]
  v(-0.3em)
}

#let remark(body) = {
  text(rgb("#EF82B5"))[Remark #body]
  v(-0.3em)
}

#let theorem(body) = {
  text(rgb("#0077B6"))[Theorem (#body)]
  v(-0.3em)
}


#let definition(title, body) = {
  block(width: 100%, fill: none, stroke: (thickness: 1.5pt, paint: rgb("#2C3E50")), radius: 4pt, inset: 0pt, [
    #block(
      fill: rgb("#34495E"),
      radius: (top-left: 4pt, top-right: 4pt, bottom-left: 0pt, bottom-right: 0pt),
      inset: (x: 14pt, y: 9pt),
      width: 100%,
      [#text(weight: "bold", size: 10pt, fill: white)[Definition] #h(0.3em) #text(
          weight: "bold",
          size: 10pt,
          fill: rgb(
            "#BDC3C7",
          ),
        )[#title]],
    )
    #block(
      inset: (x: 10pt, y: 9pt),
      width: 100%,
      body,
    )
  ])
}

// #import "@preview/algo:0.3.3": algo, i, d, comment, code
// #show sym.triangle.l: it => box()[#it #h(.1cm)]

// *************************** Plugins & Blocks End *************************** //

// *************************** Variables Start *************************** //

#let title = [#box[Probability&Statistics for ML Notes]]
#let author = [#link("https://www.github.com/ahmedYasserM")[Ahmed Yasser]]
#let date = [#datetime.today().display("[month repr:long] [year]")]
#let font = "New Computer Modern"
#let normalFontSize = 12pt
#let baseLink = ""

// *************************** Variables End *************************** //

// *************************** Configs Start *************************** //

#show raw: set text(font: "JetBrainsMono NFP")
#show raw: it => box(text(fill: rgb("#538EBB"), it))
// #show math.equation: it => text(fill: rgb("#538EBB"), it)
#set math.mat(delim: "[", column-gap: 1em)
#set math.vec(delim: "[")
#show heading: set block(below: 1em)
#set list(marker: text(fill: red, size: 1.3em)[•], indent: 1em)




// *************************** Configs End *************************** //


// *************************** Formatting Start *************************** //

#set page(paper: "a4", margin: (x: 1.7cm, y: 1.8cm), header: [], numbering: "1")

#set text(font: font, size: normalFontSize)
#show strong: set text(stroke: 0.1pt)

#set par(justify: true)

// *************************** Formatting End *************************** //

// *************************** Title Page Start *************************** //


#align(center + horizon)[
  #par(leading: 0.7cm)[
    #text(size: 40pt)[*#title*] \
    #text(size: 20pt)[*#author*] \
    #text(size: 17pt)[*#date*]
  ]
]

#pagebreak()

// *************************** Title Page End *************************** //

// *************************** Table of Contents Start *************************** //

// #outline(target: heading.where(level: 1))

// #pagebreak()

// *************************** Table of Contents End *************************** //

= Chapter 1

=== 1.1.1 The Interplay Between Probability, Statistics, and Machine  Learning

#remark("(Difference between probability and statistics)")

The difference between *probability* and *statistics* is that between *modeling the likelihood  of future events* and *analyzing the frequency of past events*. Probability theory is useful for modeling *expected outcomes*, whereas statistics is useful for analyzing *sample  outcomes*. The sample outcomes from a probabilistic  model are only approximations of the probabilistically expected outcomes.


== 1.2 Representing Data

#remark("")
The simplest form of data used in statistics and machine learning is *tabular data*, which is also referred to as *multidimensional data*. This data typically contains a set of *observations*, which are represented by *rows* in the data table. Each observation contains a set of *fields*, which are represented by *columns* in the data table, and they describe the difefrent  properties of the specific observation (row) at hand.

Note that:

- An observation is also reffered to as a *data point*, *database record*, *instance*, *example*, *transaction*, *entity*, *tuple*, *object*, *sample*, or *feature vector*.

- Fields are also referred to as *attributes*, *dimensions*, *variables*, or *features*.


#def("Multidimensional Data")
A multidimensional data set is an $m times n$ data matrix $D = [x_(i j)]_(m times n)$, which may also be #box[represented] by a table containing $m$ rows and $n$ columns. The $m$ rows of the data matrix are denoted by the $m$ row vectors $bold(x)_1, bold(x)_2, " " dots " ", bold(x)_m$, such that each vector $bold(x)_i$ contains a set of $n$ features or variables denoted by $[x_(i 1) " " dots " " x_(i n)]$. Each vector is also referred to as an *observation*.


#remark("")

A data set with a single dimension ($n = 1$) is referred to as *univariate data*, and multidimensional data set with $n > 1$ is referred to as *multivariate data*.

#def("Univariate Analysis and Multivariate Analysis")
When the analysis is performed on a single variable, it is referred to as *univariate analysis*. On the other hand, when the analysis is performed on multiple variables together, it is referred to as *multivariate analysis*.

#remark("(Attributes Data Types)")
Attributes can be of different types, such as:

- *Numerical*: Attributes with values that have a *natural ordering* and *quantifiable distances* between values. They can be further classified into:

  - *Discrete*: Attributes with values that are *countable* and *finite*.

  - *Continuous*: Attributes with values that are *uncountable* and *infinite*.


- *Categorical*: Attributes that take values from a *finite set of categories* without inherent numeric meaning. They can be further classified into:

  - *Nominal*: Categories with *no ordering* or ranking.

  - *Ordinal*: Categories with a *meaningful ordering* but *no quantifiable distances*.

#remark("")

Categorical data can be transformed to *binary numerical* data through *one-hot encoding*, while numerical data can be transformed to *binary numerical* data through *discretization*.


== 1.3 Summarizing and Visualizing Data

#def("Summary Statistics")
Summary statistics are used to describe the main characteristics of a data set. Two common forms of summaries of the data distribution include:

- *Measures of Central Tendency*: Identify representative  points corresponding to central regions of the data. Common measures include *arithmetic mean*, *median*, and *mode*.
// Note that ranking-based measures can be used not just to compute the central points but  other placements within the data distribution. For example, one can compute specifci  percentile values within the data distribution.

- *Measures of Dispersion*: Model the degree of spread of the  distribution from the center of the data. Common measures include *variance*, *standard deviation*, *range*, and *inter-quartile range*.

Note that the measures of central tendency and dispersion are *univariate summary statistics* because  they are based on only one dimension. Several forms of summary statistics, such as *covariance* and *correlation* provide an idea of how different attributes are related to one another.

#remark("")

While summary statistics offer a concise, numerical description of data distribution, they are often insufficient to capture the underlying patterns and relationships. Therefore, data visualization is necessary for a comprehensive understanding.

We use different types of visualizations depending on the *number of variables* being analyzed:

- *For a single variable*, we use *univariate visualizations*. A *histogram*, for instance, is a common example that partitions the variable into bins and plots a frequency measure (like raw or relative frequency) for each bin.


- To capture the relationship between *two or more variables*, we use *multivariate visualizations*. A *scatterplot*  is a key example, where the attributes are represented along the axes and each observation is plotted as a marker.
