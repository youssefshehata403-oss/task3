gene_names <- c("BRCA1", "TP53", "EGFR", "MYC", "PTEN", "KRAS")

control <- c(5.2, 7.8, 3.1, 9.4, 6.0, 4.5)
treated <- c(8.9, 7.6, 6.7, 12.1, 2.3, 9.8) 

names(control) <- gene_names
names(treated) <- gene_names

fold_change <- treated / control
high_fold_change_genes <- fold_change[fold_change > 1.5]

expression_matrix <- matrix(
  c(control, treated),
  nrow = length(gene_names),
  ncol = 2,
  byrow = FALSE,
  dimnames = list(gene_names, c("control", "treated"))
)

row_mean_expression <- rowMeans(expression_matrix)


classification <- ifelse(
  fold_change > 1.2,
  "upregulated",
  ifelse(fold_change < 0.8, "downregulated", "stable")
)

classification <- factor(
  classification,
  levels = c("upregulated", "downregulated", "stable")
)

results <- data.frame(
  Gene = gene_names,
  Control = as.numeric(control),
  Treated = as.numeric(treated),
  Fold_Change = as.numeric(fold_change),
  Mean_Expression = as.numeric(row_mean_expression),
  Classification = classification
)
print(results)

cat("\nGenes with fold change > 1.5:\n")
print(high_fold_change_genes)

cat("\nExpression matrix:\n")
print(expression_matrix)

write.table(
  results,
  file = "results.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)

