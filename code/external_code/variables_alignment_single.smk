results_for_alignments_single = alignment_variables(fq_and_index_single)

## Preparing variables for RNASeq alignment with star for single-end
SPECIESSINGLESTAR = results_for_alignments_single['star'][0]
GENOMESINGLESTAR = results_for_alignments_single['star'][1]
PREFIXSINGLESTAR = results_for_alignments_single['star'][2]
PREFIXEXTSINGLESTAR = results_for_alignments_single['star'][3]
SAMPLENAMESSINGLESTAR = results_for_alignments_single['star'][4]

## Preparing variables for RNASeq alignment with bowtie2 for single-end
SPECIESSSINGLEBOW = results_for_alignments_single['bowtie'][0]
GENOMESINGLEBOW = results_for_alignments_single['bowtie'][1]
PREFIXSINGLEBOW = results_for_alignments_single['bowtie'][2]
PREFIXEXTSINGLEBOW = results_for_alignments_single['bowtie'][3]
SAMPLENAMESSINGLEBOW = results_for_alignments_single['bowtie'][4]
