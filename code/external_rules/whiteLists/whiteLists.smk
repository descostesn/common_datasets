rule create_whiteLists:
  input:
    blist = "../{species}/{genome}/blacklist/{genomeBiomart}-encodeblacklist-sorted.bed",
    chrInfo = "../{species}/{genome}/chromInfo/{genomeBiomart}-chromInfo.txt"
  output:
    "../{species}/{genome}/whitelist/{genomeBiomart}-encodewhitelist-sorted.bed"
  threads: 1
  conda: "../../conda/genomicranges.yaml"
  params:
    outputFolder= lambda wildcards: f"../{wildcards.species}/{wildcards.genome}/whitelist"
  script:
     "../../scripts/whitelist.R"
