# Gene Expression Filtering

## Description
This R script analyzes gene expression data under control and treated conditions.

## Genes
The analysis includes:
- BRCA1
- TP53
- EGFR
- MYC
- PTEN
- KRAS

## Analysis Steps
1. Create named vectors for control and treated expression values.
2. Calculate fold change using treated/control.
3. Identify genes with fold change greater than 1.5.
4. Create an expression matrix for control and treated conditions.
5. Calculate mean expression for each gene using rowMeans().
6. Classify genes as upregulated, downregulated, or stable.
7. Save the results using write.table().

## Classification Criteria
- Fold change > 1.2: Upregulated
- Fold change < 0.8: Downregulated
- Otherwise: Stable

## Output
The analysis produces:
- A table containing gene expression, fold change, mean expression, and classification.
- A list of genes with fold change > 1.5.
- An expression matrix.
- A `results.txt` file containing the analysis results.