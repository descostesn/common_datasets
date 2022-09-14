rule download_gff:
  output:
    "../{species}/{genome}/gff/{prefixExt}.chr.gff3"
  threads: 1
  params:
    pathGFF = lambda wildcards: config["gff"][wildcards.genome]
  shell:
    """
    echo "Downloading GFF"
    wget {params.pathGFF}
    
    echo "Filtering MT from GFF"
    gunzip {wildcards.prefixExt}.chr.gff3.gz
    grep -v MT {wildcards.prefixExt}.chr.gff3 > tmp-gff-{wildcards.prefixExt}
    rm {wildcards.prefixExt}.chr.gff3
    mv tmp-gff-{wildcards.prefixExt} {wildcards.prefixExt}.chr.gff3
    
    echo "Organizing files to destination folders"
    mkdir -p ../{wildcards.species}/{wildcards.genome}/gff
    mv {wildcards.prefixExt}.chr.gff3 ../{wildcards.species}/{wildcards.genome}/gff
    """

