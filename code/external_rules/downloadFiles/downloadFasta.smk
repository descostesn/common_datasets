rule download_genome:
  output:
    "../{species}/{genome}/fasta/{prefix}.dna.chromosome.fa"
  threads: 1
  params:
    genomeLinks = lambda wildcards: config["fasta"][wildcards.genome]
  shell:
    """
    echo "Downloading {wildcards.genome} fasta"
    for link in {params.genomeLinks}
    do
        wget $link
    done
    
    echo "Merging files"
    cat {wildcards.prefix}.dna.chromosome.*.fa.gz > final-{wildcards.prefix}
    rm {wildcards.prefix}.dna.chromosome.*.fa.gz
    mv final-{wildcards.prefix} {wildcards.prefix}.dna.chromosome.fa.gz
    gunzip {wildcards.prefix}.dna.chromosome.fa.gz
    
    echo "Organizing files to destination folders"
    mkdir -p ../{wildcards.species}/{wildcards.genome}/fasta
    mv {wildcards.prefix}.dna.chromosome.fa ../{wildcards.species}/{wildcards.genome}/fasta
    """

