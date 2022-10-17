rule build_star_index:
  input:
    fa = "../{species}/{genome}/fasta/{prefix}.dna.chromosome.fa",
    gtf = "../{species}/{genome}/gtf/{prefixExt}.chr.gtf"
  output:
    directory("../{species}/{genome}/STAR_index-{prefix}-{prefixExt}")
  conda: "../../conda/star.yaml"
  threads: 8
  shell:
    """
    mkdir -p {output}
    STAR --runMode genomeGenerate --runThreadN {threads} --genomeDir {output} \
    --genomeFastaFiles {input.fa} --sjdbGTFfile {input.gtf} --outTmpDir ./{wildcards.species}_{wildcards.genome}_{wildcards.prefix}_{wildcards.prefixExt}
    """
