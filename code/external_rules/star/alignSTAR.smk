rule alignstar_single:
  input:
    fq = "../{speciessingle}/fastq/RNASeq/single/allchrom/{samplenamesingle}.fastq.gz",
    index="../{speciessingle}/{genomesingle}/STAR_index/{prefixsingle}-{prefixExtsingle}"
  output:
    bam = "../{speciessingle}/{genomesingle}/STAR/{prefixsingle}-{prefixExtsingle}/{samplenamesingle}-Aligned.sortedByCoord.out.bam",
    logSTAR = "../{speciessingle}/{genomesingle}/STAR/{prefixsingle}-{prefixExtsingle}/{samplenamesingle}-Log.final.out",
    log = "../{speciessingle}/{genomesingle}/STAR/{prefixsingle}-{prefixExtsingle}/{samplenamesingle}-Log.out",
    progress = "../{speciessingle}/{genomesingle}/STAR/{prefixsingle}-{prefixExtsingle}/{samplenamesingle}-Log.progress.out",
    SJ = "../{speciessingle}/{genomesingle}/STAR/{prefixsingle}-{prefixExtsingle}/{samplenamesingle}-SJ.out.tab"
  conda: "../../conda/star.yaml"
  threads: 12
  shell:
    """
    mkdir -p ../{wildcards.speciessingle}/{wildcards.genomesingle}/STAR/{wildcards.prefixsingle}-{wildcards.prefixExtsingle}
    
    STAR --runMode alignReads \
--runThreadN {threads} \
--genomeLoad NoSharedMemory \
--genomeDir {input.index} \
--readFilesIn {input.fq}\
--readFilesType Fastx \
--readFilesCommand zcat \
--outSAMtype BAM SortedByCoordinate \
--outSAMattributes Standard \
--outSAMstrandField None \
--outFilterIntronMotifs RemoveNoncanonical \
--outFilterIntronStrands RemoveInconsistentStrands \
--outSAMunmapped None \
--outSAMprimaryFlag OneBestScore \
--outSAMmapqUnique 255 \
--outFilterType Normal \
--outFilterMultimapScoreRange 1 \
--outFilterMultimapNmax 10 \
--outFilterMismatchNmax 5 \
--outFilterMismatchNoverLmax 0.3 \
--outFilterMismatchNoverReadLmax 1.0 \
--outFilterScoreMin 0 \
--outFilterScoreMinOverLread 0.66 \
--outFilterMatchNmin 0 \
--outFilterMatchNminOverLread 0.66 \
--outSAMmultNmax -1 \
--outSAMtlen 1 \
--outBAMsortingBinsN 50 \
--outFileNamePrefix ../{wildcards.speciessingle}/{wildcards.genomesingle}/STAR/{wildcards.prefixsingle}-{wildcards.prefixExtsingle}/{wildcards.samplenamesingle}-

    rm -r ../{wildcards.speciessingle}/{wildcards.genomesingle}/STAR/{wildcards.prefixsingle}-{wildcards.prefixExtsingle}/{wildcards.samplenamesingle}-_STARtmp
    """
