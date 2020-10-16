# Mean imputation operator

##### Description

`mean_imputation` operator replaces missing values by the column mean.

##### Usage

Input projection|.
---|---
`row`        | factor, observations 
`column`     | factor, variables 
`y-axis`     | numeric, input data, per cell 

Output relations|.
---|---
`mean_imputed`        | numeric, measurements with imputed values

##### Details

The operator replaces missing values (`NA`) by the column mean.

##### References

See [Mean substitution on Wikipedia](https://en.wikipedia.org/wiki/Imputation_(statistics)#Mean_substitution).

##### See also

[impute_operator](https://github.com/tercen/impute_operator)
