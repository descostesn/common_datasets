rule download_gtf:
  output:
    "../{species}/{genome}/gtf/{prefixExt}.chr.gtf"
  threads: 1
  params:
    pathGTF = lambda wildcards: config["gtf"][wildcards.genome]
  shell:
    """
    echo "Downloading GTF"
    wget {params.pathGTF}
    
    echo "Filtering MT from GTF"
    gunzip {wildcards.prefixExt}.chr.gtf.gz
    grep -v MT {wildcards.prefixExt}.chr.gtf > tmp-{wildcards.prefixExt}
    rm {wildcards.prefixExt}.chr.gtf
    mv tmp-{wildcards.prefixExt} {wildcards.prefixExt}.chr.gtf
    
    echo "Organizing files to destination folders"
    mkdir -p ../{wildcards.species}/{wildcards.genome}/gtf
    mv {wildcards.prefixExt}.chr.gtf ../{wildcards.species}/{wildcards.genome}/gtf
    """

