#########
# This script takes the ensembl annotations and output the TSS coordinates
# making sure that they are unique.
#########

#########
# params
#########

ensPath <- snakemake@input[[1]]
outputFolder <- snakemake@params$outputFolder
outputFile <- snakemake@output[[1]]

#save(ensPath, file="/g/romebioinfo/common_datasets/code/tmp/ensPath.Rdat")
#save(outputFolder, file="/g/romebioinfo/common_datasets/code/tmp/outputFolder.Rdat")
#stop("## Objects saved")
#load("/g/romebioinfo/common_datasets/code/tmp/ensPath.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp/outputFolder.Rdat")

#########
# main
#########

# Reading and filtering
ens <- read.delim(ensPath, stringsAsFactors=FALSE, skip=28, header=F)
ens <- ens[which(ens$V3 == "gene"),]

# Replacing end by start (keeping TSS)
ens$V5 <- ens$V4

# Remove duplicated genes
ensNames <- gsub("Name=", "", sapply(strsplit(ens$V9, ";"), "[", 2))
idx <- which(duplicated(ensNames))
ens <- ens[-idx,]
ensNames <- ensNames[-idx]

# Remove duplicated chrom-start
chromAndStart <- paste(ens$V1, ens$V4, sep="-")
idx <- which(duplicated(chromAndStart))
ens <- ens[-idx,]
ensNames <- ensNames[-idx]

ensBed <- data.frame(chrom=ens$V1, chromStart=ens$V4, chromEnd=ens$V5, name=ensNames, 
        score=0, strand=ens$V8, thickStart=ens$V4, thickEnd=ens$V4, itemRgb=0, 
        blockCount=0, blockSizes=0, blockStarts=0)

## Writing file
dir.create(outputFolder, recursive=TRUE)
write.table(ensBed, file=outputFile, sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)




