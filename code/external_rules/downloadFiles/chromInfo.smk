rule downloadChromInfo:
  output:
    "../{species}/{genome}/chromInfo/{genomeBiomart}-chromInfo.txt"
  threads: 1
  conda: "conda/genomeinfodb.yaml"
  params:
    release = lambda wildcards: config["prefixesExtended"][wildcards.genome],
    excludeChrom = lambda wildcards: config["excludeChrom"][wildcards.genome]
  script:
    "../../scripts/create-chromInfo.R"
