rule unique_tss:
  input:
    rules.download_gff.output
  output:
    "../{species}/{genome}/uniqeTSS_bed/{prefixExt}_TSSunique.bed"
  threads: 1
  conda: "conda/rbedr.yaml"
  params:
    outputFolder = "../{species}/{genome}/uniqeTSS_bed"
  script:
    "../../scripts/uniqueTSS_bedSorted.R"
