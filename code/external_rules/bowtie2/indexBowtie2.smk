rule build_bowtie_index:
  input:
    "../{species}/{genome}/fasta/{prefix}.dna.chromosome.fa"
  output:
    "../{species}/{genome}/bowtie2_index/{prefix}.1.bt2",
    "../{species}/{genome}/bowtie2_index/{prefix}.2.bt2",
    "../{species}/{genome}/bowtie2_index/{prefix}.3.bt2",
    "../{species}/{genome}/bowtie2_index/{prefix}.4.bt2",
    "../{species}/{genome}/bowtie2_index/{prefix}.rev.1.bt2",
    "../{species}/{genome}/bowtie2_index/{prefix}.rev.2.bt2"
  conda: "conda/bowtie2.yaml"
  threads: 8
  params:
    outputFolder= lambda wildcards: f"../{wildcards.species}/{wildcards.genome}/bowtie2_index"
  shell:
    """
    mkdir -p {params.outputFolder}
    bowtie2-build -f --threads {threads} {input} {params.outputFolder}/{wildcards.prefix}
    """
