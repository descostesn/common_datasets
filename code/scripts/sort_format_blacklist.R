#########
# This script sort and format the encode blacklist.
#########

library(GenomicRanges)

#########
# params
#########

blacklistPath <- snakemake@input[[1]]
outputFile <- snakemake@output[[1]]
outputFolder <- dirname(outputFile)


#save(blacklistPath, file="/g/romebioinfo/common_datasets/code/tmp-blacklist/blacklistPath.Rdat")
#save(outputFolder, file="/g/romebioinfo/common_datasets/code/tmp-blacklist/outputFolder.Rdat")
#save(outputFile, file="/g/romebioinfo/common_datasets/code/tmp-blacklist/outputFile.Rdat")
#stop("## Objects saved")
#load("/g/romebioinfo/common_datasets/code/tmp-blacklist/blacklistPath.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-blacklist/outputFolder.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-blacklist/outputFile.Rdat")


#############
## PARAMS
#############

#############
## MAIN
#############

bl <- read.delim(blacklistPath, stringsAsFactors=F, header=F)

## Find the complementary intervals
blGR <- gr <- GRanges(seqnames = bl$V1, ranges = IRanges(start=bl$V2, end = bl$V3))

if(is.unsorted(blGR))
    blGR <- sort(blGR)

bed <- data.frame(chrom=as.vector(seqnames(blGR)),
        chromStart = start(blGR),
        chromEnd = end(blGR),
        name = "blacklist",
        score = 0,
        strand = ".",
        thickStart = start(blGR),
        thickEnd = end(blGR),
        itemRgb = ".",
        blockCount = ".",
        blockSizes = ".",
        blockStarts =".")

dir.create(outputFolder, recursive=TRUE)
write.table(bed, file=outputFile, sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
