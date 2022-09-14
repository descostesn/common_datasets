rule download_blacklists:
  output:
    "../{species}/{genome}/blacklist/{genomeBiomart}-encodeblacklist.txt"
  threads: 1
  params:
    listlink= lambda wildcards: config["blacklists"][wildcards.genome],
    outputFolder= "../{species}/{genome}/blacklist"
  shell:
    """
    mkdir -p {params.outputFolder}
    cd {params.outputFolder}
    wget {params.listlink}
    filename=`ls`
    extension="${{filename##*.}}"
    
    if [ $extension = "gz" ]; then
      gunzip $filename
    fi
    
    filename=`ls`
    target=`basename {output}`
    mv $filename $target
    """

rule sort_format_blacklist:
  input:
    rules.download_blacklists.output
  output:
    "../{species}/{genome}/blacklist/{genomeBiomart}-encodeblacklist-sorted.bed"
  threads: 1
  conda: "../../conda/genomicranges.yaml"
  script:
    "../../scripts/sort_format_blacklist.R"