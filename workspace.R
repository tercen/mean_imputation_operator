library(tercen)
library(dplyr)

options("tercen.workflowId" = "b5eee6b1ed83d50347d04d6ba20a0f29")
options("tercen.stepId"     = "adf28ca1-c14f-43ae-95a8-c78c2a5b1c56")

mat <- (ctx = tercenCtx()) %>%
  as.matrix %>% 
  t %>%
  as.data.frame

mat[] <- lapply(mat, function(x) ifelse(is.na(x) | is.nan(x), mean(x, na.rm = TRUE), x)) 
colnames(mat) <- 1:ncol(mat) - 1

matrix <- t(mat)
ctx %>% select(.ci, .ri) %>% mutate(mean_imputed = as.double(matrix)) %>%
    ctx$addNamespace() %>%
    ctx$save()

