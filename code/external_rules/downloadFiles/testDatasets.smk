rule download_fastq_single:
  output:
    "../{speciessingle}/fastq/{technique}/{layoutsingle}/allchrom/{samplename}.fastq.gz"
  params:
    outputdirectory = lambda wildcards: f"../{wildcards.speciessingle}/fastq/{wildcards.technique}/{wildcards.layoutsingle}/fastq/allchrom",
    linksingle = lambda wildcards: samples_single_forlinks.loc[wildcards.samplename, "link1"]
  threads: 1    
  shell:
    """
    echo "Downloading {params.linksingle}"
    wget --directory-prefix={params.outputdirectory} {params.linksingle}
    sleep 10s
    FILENAME=`basename {params.linksingle}`
    mv {params.outputdirectory}/$FILENAME {output}  
    """
