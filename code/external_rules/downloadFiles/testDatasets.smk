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


rule download_fastq_paired:
  output:
    pair1 = "../test/{speciespaired}/fastq/{technique}/{layoutpaired}/allchrom/{samplenamepaired}.fastq.gz"
  params:
    outputdirectory = lambda wildcards: f"../test/{wildcards.speciespaired}/fastq/{wildcards.technique}/{wildcards.layoutpaired}/fastq/allchrom",
    linkpair1 = lambda wildcards: samples_paired_forlinks.loc[wildcards.samplenamepaired, "link1"]
  threads: 1    
  shell:
    """
    echo "Downloading {params.linkpair1}"
    wget --directory-prefix={params.outputdirectory} {params.linkpair1}
    
    sleep 10s
    FILENAME1=`basename {params.linkpair1}`
    
    mv {params.outputdirectory}/$FILENAME1 {output.pair1}
    
    """
