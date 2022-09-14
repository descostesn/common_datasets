rule downloadChromInfo:
  output:
    "../{species}/{genome}/chromInfo/{genomeBiomart}-chromInfo.txt"
  threads: 1
  container: "singularities/genomeinfodb-v1323.sif"
  params:
    release = lambda wildcards: config["prefixesExtended"][wildcards.genome],
    excludeChrom = lambda wildcards: config["excludeChrom"][wildcards.genome]
  script:
    "../../scripts/create-chromInfo.R"
