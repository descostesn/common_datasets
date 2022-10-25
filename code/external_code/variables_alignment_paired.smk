results_for_alignments_paired = alignment_variables(fq_and_index_paired)

## Preparing variables for RNASeq alignment with star for paired-end
SPECIESPAIREDSTAR = results_for_alignments_paired['star'][0]
GENOMEPAIREDSTAR = results_for_alignments_paired['star'][1]
PREFIXPAIREDSTAR = results_for_alignments_paired['star'][2]
PREFIXEXTPAIREDSTAR = results_for_alignments_paired['star'][3]
SAMPLENAMESPAIREDSTAR = results_for_alignments_paired['star'][4]

## Preparing variables for RNASeq alignment with bowtie2 for paired-end
SPECIESSPAIREDBOW = results_for_alignments_paired['bowtie'][0]
GENOMEPAIREDBOW = results_for_alignments_paired['bowtie'][1]
PREFIXPAIREDBOW = results_for_alignments_paired['bowtie'][2]
PREFIXEXTPAIREDBOW = results_for_alignments_paired['bowtie'][3]
SAMPLENAMESPAIREDBOW = results_for_alignments_paired['bowtie'][4]
