library(tercen)
library(dplyr)

mat <- (ctx = tercenCtx()) %>%
  as.matrix(fill = NA) %>% 
  t %>%
  as.data.frame

mat[] <- lapply(mat, function(x) ifelse(is.na(x) | is.nan(x), mean(x, na.rm = TRUE), x)) 
colnames(mat) <- 1:ncol(mat) - 1

mat_out <- mat %>%
  mutate(.ci = 1:nrow(.) - 1) %>%
  gather(.ri, mean_imputed, -.ci)              

mat_out %>%
  ctx$addNamespace() %>%
  ctx$save()

