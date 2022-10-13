rule download_fastq_single:
  output:
    "../{speciessingle}/fastq/{techniquesingle}/{layoutsingle}/allchrom/{samplenamesingle}.fastq.gz"
  params:
    outputdirectory = lambda wildcards: f"../{wildcards.speciessingle}/fastq/{wildcards.techniquesingle}/{wildcards.layoutsingle}/fastq/allchrom",
    linksingle = lambda wildcards: samples_single_forlinks.loc[wildcards.samplenamesingle, "link1"]
  threads: 1
  wildcard_constraints:
    samplenamesingle="[0-9A-Za-z]+"
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
    pair1 = "../{speciespaired}/fastq/{techniquepaired}/{layoutpaired}/allchrom/{samplenamepaired}_1.fastq.gz",
    pair2 = "../{speciespaired}/fastq/{techniquepaired}/{layoutpaired}/allchrom/{samplenamepaired}_2.fastq.gz"
  threads: 1
  wildcard_constraints:
    samplenamepaired="[0-9A-Za-z]+"
  shell:
    "echo 'hello' > {output}"

#rule download_fastq_paired:
#  output:
#    pair1 = "../{speciespaired}/fastq/{techniquepaired}/{layoutpaired}/allchrom/{samplenamepaired}_1.fastq.gz",
#    pair2 = "../{speciespaired}/fastq/{techniquepaired}/{layoutpaired}/allchrom/{samplenamepaired}_2.fastq.gz"
#  params:
#    outputdirectory = lambda wildcards: f"../{wildcards.speciespaired}/fastq/{wildcards.techniquepaired}/{wildcards.layoutpaired}/fastq/allchrom",
#    linkpair1 = lambda wildcards: samples_paired_forlinks.loc[wildcards.samplenamepaired, "link1"],
#    linkpair2 = lambda wildcards: samples_paired_forlinks.loc[wildcards.samplenamepaired, "link2"]
#  threads: 1    
#  shell:
#    """
#    echo "Downloading {params.linkpair1} and {params.linkpair2}"
#    wget --directory-prefix={params.outputdirectory} {params.linkpair1}
#    wget --directory-prefix={params.outputdirectory} {params.linkpair2}
#    sleep 10s
#    FILENAME1=`basename {params.linkpair1}`
#    FILENAME2=`basename {params.linkpair2}`
#    mv {params.outputdirectory}/$FILENAME1 {output.pair1}
#    mv {params.outputdirectory}/$FILENAME2 {output.pair2}
#    """
