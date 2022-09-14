rule create_whiteLists:
  input:
    blist = "../{species}/{genome}/blacklist/{genomeBiomart}-encodeblacklist-sorted.bed",
    chrInfo = "../{species}/{genome}/chromInfo/{genomeBiomart}-chromInfo.txt"
  output:
    "../{species}/{genome}/whitelist/{genomeBiomart}-encodewhitelist-sorted.bed"
  threads: 1
  container: "singularities/genomicranges-v1480.sif"
  params:
    outputFolder= lambda wildcards: f"../{wildcards.species}/{wildcards.genome}/whitelist"
  script:
     "../../scripts/whitelist.R"