
// *************************** Variables *************************** //

#let title = [Mahcine Learning Notes]
#let author = [#link("https://www.github.com/ahmedYasserM")[Ahmed Yasser]]
#let date = [#datetime.today().year()]
#let font = "New Computer Modern Math"
#let baseLink = ""
// *************************** Variables *************************** //

// *************************** Code Blocks *************************** //

#show raw: set text(font: "JetBrainsMono NFP")
#show raw: it => box(text(fill: rgb("#538EBB"), it))
#show math.equation: it => text(fill: rgb("#538EBB"), it)



#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#codly(
  fill: rgb("#FDF5E5"), 
  languages: (python: (name: "py", color: rgb("#e8da58"))), zebra-fill: none,
)

// #import "@preview/algo:0.3.3": algo, i, d, comment, code
// #show sym.triangle.l: it => box()[#it #h(.1cm)]

// *************************** Code Blocks *************************** //

// *************************** Formatting *************************** //

#set page(paper: "a4", margin: (x: 1.7cm, y: 1.8cm), header: [], numbering: "1")

#set text(font: font, size: 12pt)
#show strong: set text( stroke: 0.1pt)

#set par(justify: true)

// *************************** Formatting *************************** //
predicts discrete categories or classes, assigning input data to predefined groups such as spam/not spam or specific object types.
// *************************** Title Page *************************** //


#align(center + horizon)[
  #par(leading: 0.7cm)[
    #text(size: 40pt)[*#title*] \
    #text(size: 20pt)[*#author*] \
    #text(size: 17pt)[*#date*]
  ]
]

#pagebreak()

// *************************** Title Page *************************** //

#outline(
  target: heading.where(level: 1),
)

#pagebreak()

= Some Important Definitions

- $theta$ = Parameters of the model

- $X$ = Inputs or features

- $y$ = Output or target variable

- $h(x)$ = Hypothesis function 

- $m$ = Number of training examples (Number of rows in the training set)

- $n$ = Number of features

- $(X^((i)), y^((i)))$ = The $i\-\th$ training example



= Supervised Learning 

Supervised learning is a type of machine learning where the model is trained on labeled data. The goal is to learn a mapping from inputs to outputs based on the provided labels. The model can then make predictions on new, unseen data.

== Supervised Learning Types

Supervised learning can be divided into two main types:

1. *Classification*: Predicts discrete categories or classes, assigning input data to predefined groups such as spam/not spam or specific object types.

2. *Regression*: Predicts continuous numerical values or quantities within a range, such as prices, temperatures, or heights.


here are some common supervised learning algorithms used for regression tasks:

- Linear Regression 
- Polynomial regression
- Lasso Regression (L1 Regularization)
- Ridge Regression (L2 Regularization)
- Decision Trees 
- Random Forests 
- Support Vector Regression (SVR) 

#pagebreak()

==  Linear Regression

Linear regression is a supervised learning algorithm used for regression tasks. It models the relationship between input features and a continuous output variable by fitting a linear equation to the observed data. The goal is to find the best-fitting line (or hyperplane in higher dimensions) that minimizes the difference between the predicted values and the actual values.


=== Linear Regression Equation

The hypothesis function for linear regression is represented as:

$ h(x) = theta_0 + theta_1 x_1 + theta_2 x_2 + ... + theta_n x_n = sum_(j=0)^n theta_j x_i $


Where: 

- $h(x)$ is the predicted output (hypothesis function) 

- $theta_0$ is the bias 

- $theta_1, theta_2, ..., theta_n$ are the weights (coefficients) for each feature 

- $x_1, x_2, ..., x_n$ are the input features 

The equation can also be expressed in vector form as: 

$ h(x) = theta^T X $

Where: 

$theta = vec(theta_0, theta_1, ..., theta_n)$ is the vector of parameters (weights) and $X = vec(1, x_1, x_2, ..., x_n)$ is the vector of input features.


=== Cost Function

The cost function for linear regression is used to measure how well the model fits the training data. It calculates the difference between the predicted values and the actual values. The most common cost function used in linear regression is the Mean Squared Error (MSE): 

$ J(theta) = 1/(2m) sum_(i=1)^m (h(x^((i))) - y^((i)))^2 $

Where:

- $J(theta)$ is the cost Function

- $m$ is the number of training examples

- $h(x^((i)))$ is the predicted value for the $i\-\th$ training examples

- $y^((i))$ is the actual value for the $i\-\th$ training examples

- $theta$ is the vector of parameters (weights)

- $x^((i))$ is the input features for the $i\-\th$ training examples

