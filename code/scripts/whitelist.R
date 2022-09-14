#########
# This script takes the encode blacklist and output the coordinates
# corresponding to the whitelist.
#########

library(GenomicRanges)

#########
# params
#########

blacklistPath <- snakemake@input$blist
chromInfoPath  <- snakemake@input$chrInfo
outputFolder <- snakemake@params$outputFolder
outputFile <- snakemake@output[[1]]

#save(blacklistPath, file="/g/romebioinfo/common_datasets/code/tmp-whitelist/blacklistPath.Rdat")
#save(chromInfoPath, file="/g/romebioinfo/common_datasets/code/tmp-whitelist/chromInfoPath.Rdat")
#save(outputFolder, file="/g/romebioinfo/common_datasets/code/tmp-whitelist/outputFolder.Rdat")
#save(outputFile, file="/g/romebioinfo/common_datasets/code/tmp-whitelist/outputFile")
#stop("## Objects saved")
#load("/g/romebioinfo/common_datasets/code/tmp-whitelist/blacklistPath.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-whitelist/chromInfoPath.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-whitelist/outputFolder.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-whitelist/outputFile")

#############
## MAIN
#############

bl <- read.delim(blacklistPath, stringsAsFactors=F, header=F)

## Find the complementary intervals
blGR <- gr <- GRanges(seqnames = bl$V1, ranges = IRanges(start=bl$V2, end = bl$V3))
wlGR <- gaps(reduce(blGR, ignore.strand=T))

## Retrieve length of each chromosome
cl <- read.table(chromInfoPath, stringsAsFactors=F, header=F)
cl$V1 <- paste0("chr", cl$V1)

## Retrieve maximum interval end in wlGR for each chromosome
chromvec <- seqnames(wlGR)
endvec <- end(wlGR)
endByChrom <- split(endvec, as.factor(chromvec))
maxVec <- sapply(endByChrom, max)
GRtoAdd <- mapply(function(maxval, chr, cl){
            
            message(chr)
            
            chromEnd <- cl[which(cl$V1 == chr),2]
            if(chromEnd > maxval && (maxval+1) != chromEnd)
                return(GRanges(seqnames=chr, 
                                ranges = IRanges(start=maxval+1, 
                                        end=chromEnd)))
            else
                return(NULL)
                    
                }, maxVec, names(maxVec), MoreArgs=list(cl))


## Adding the missing intervals to wlGR
finalGR <- c(wlGR, unlist(GRangesList(GRtoAdd)))
if(is.unsorted(finalGR))
    finalGR <- sort(finalGR)

bed <- data.frame(chrom=as.vector(seqnames(finalGR)),
        chromStart = start(finalGR),
        chromEnd = end(finalGR),
        name = "whitelist",
        score=0,
        strand=".",
        thickstart = start(finalGR),
        thickend = end(finalGR),
        itemRGB = ".",
        blockcount=".",
        blockSizes=".",
        blockStart=".")

dir.create(outputFolder, recursive=TRUE)
write.table(bed, file=outputFile, sep="\t", quote=FALSE, 
        row.names=FALSE, col.names=FALSE)
