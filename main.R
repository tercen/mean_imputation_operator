library(tercen)
library(dplyr)

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

