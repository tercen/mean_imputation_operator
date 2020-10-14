library(tercen)
library(tidyr)
library(dplyr)
library(reshape2)

options("tercen.workflowId" = "a77770c3923fad0ca99b77fa8905471d")
options("tercen.stepId"     = "2edb4d6b-ebb5-4334-a184-37762f1eb51e")

mat <- (ctx = tercenCtx()) %>%
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ri ~ .ci, value.var='.y', fill = NA) %>%
  as.data.frame

mat[] <- lapply(mat, function(x) ifelse(is.na(x) | is.nan(x), mean(x, na.rm = TRUE), x)) 
colnames(mat) <- 1:ncol(mat) - 1

mat_out <- mat %>%
  mutate(.ri = 1:nrow(.) - 1) %>%
  gather(.ci, mean_imputed, -.ri)              

mat_out %>%
  ctx$addNamespace() %>%
  ctx$save()

