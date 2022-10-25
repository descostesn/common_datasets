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
  wildcard_constraints:
    samplenamesingle="[0-9A-Za-z]+"
  shell:
    """
    OUTFOLD=`dirname {output.bam}`
    mkdir -p $OUTFOLD
    
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
--outFileNamePrefix $OUTFOLD/{wildcards.samplenamesingle}-

    rm -r $OUTFOLD/{wildcards.samplenamesingle}-_STARtmp
    """


rule alignstar_paired:
  input:
    fq1 = "../{speciespaired}/fastq/RNASeq/paired/allchrom/{samplenamepaired}_1.fastq.gz",
    fq2 = "../{speciespaired}/fastq/RNASeq/paired/allchrom/{samplenamepaired}_2.fastq.gz",
    index="../{speciespaired}/{genomepaired}/STAR_index/{prefixpaired}-{prefixExtpaired}"
  output:
    bam = "../{speciespaired}/{genomepaired}/STAR/{prefixpaired}-{prefixExtpaired}/{samplenamepaired}-Aligned.sortedByCoord.out.bam"
    #logSTAR = "../{speciespaired}/{genomepaired}/STAR/{prefixpaired}-{prefixExtpaired}/{samplenamepaired}-Log.final.out",
    #log = "../{speciespaired}/{genomepaired}/STAR/{prefixpaired}-{prefixExtpaired}/{samplenamepaired}-{label}-Log.out",
    #progress = "../{speciespaired}/{genomepaired}/STAR/{prefixpaired}-{prefixExtpaired}/{samplenamepaired}-Log.progress.out",
    #SJ = "../{speciespaired}/{genomepaired}/STAR/{prefixpaired}-{prefixExtpaired}/{samplenamepaired}-SJ.out.tab"
  conda: "../../conda/star.yaml"
  threads: 12
  wildcard_constraints:
    samplenamesingle="[0-9A-Za-z]+"
  shell:
    """
    OUTFOLD=`dirname {output.bam}`
    mkdir -p $OUTFOLD
    
    STAR --runMode alignReads \
--runThreadN {threads} \
--genomeLoad NoSharedMemory \
--genomeDir {input.index} \
--readFilesIn {input.fq1} {input.fq2} \
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
--outFileNamePrefix $OUTFOLD/{wildcards.samplenamepaired}-

    rm -r $OUTFOLD/{wildcards.samplenamepaired}-_STARtmp
    """
