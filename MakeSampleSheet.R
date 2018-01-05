library(tidyverse)
library(readxl)
library(reshape2)
###########################################################################
# Set the following variables for your study:

InputXLSX="/Users/jbisanz/Research/MHGEP/MGHEP_16S/MGHEP_Template_june8.xlsx"
OutputLocation="~/Desktop/"
ProjectName="MGHEP"
Description="V4Amplicons"

###########################################################################
#Sample sheet header, only change if you know what you are doing
#Sample sheet header, only change if you know what you are doing
Header=paste0("[Header]
              IEMFileVersion,4
              Investigator Name,JBisanz
              Experiment Name,",ProjectName,"
              Date,5/22/2017
              Workflow,GenerateFASTQ
              Application,FASTQ Only
              Assay,TruSeq HT
              Description,Pilot run of New Barcode Strategy-
              Chemistry,Amplicon\n
              [Reads]
              270
              270\n
              [Settings]
              ReverseComplement,0\n
              [Data]")



###########################################################################
# Get primer layouts and seqs

IndexSeqs<-read_excel(InputXLSX, sheet= "Primers")

Plate1<-left_join(
  melt(id.vars="Row", variable.name="Column", value.name="I5_Index_ID", read_excel(InputXLSX, sheet= "Plate1_F_Index")),
  melt(id.vars="Row", variable.name="Column", value.name="I7_Index_ID", read_excel(InputXLSX, sheet= "Plate1_R_Index"))
  )


Plate2<-left_join(
  melt(id.vars="Row", variable.name="Column", value.name="I5_Index_ID", read_excel(InputXLSX, sheet = "Plate2_F_Index")),
  melt(id.vars="Row", variable.name="Column", value.name="I7_Index_ID", read_excel(InputXLSX, sheet = "Plate2_R_Index"))
)

Plate3<-left_join(
  melt(id.vars="Row", variable.name="Column", value.name="I5_Index_ID", read_excel(InputXLSX, sheet = "Plate3_F_Index")),
  melt(id.vars="Row", variable.name="Column", value.name="I7_Index_ID", read_excel(InputXLSX, sheet = "Plate3_R_Index"))
)

Plate4<-left_join(
  melt(id.vars="Row", variable.name="Column", value.name="I5_Index_ID", read_excel(InputXLSX, sheet = "Plate4_F_Index")),
  melt(id.vars="Row", variable.name="Column", value.name="I7_Index_ID", read_excel(InputXLSX, sheet = "Plate4_R_Index"))
)

Plate1$Sample_Plate="Plate1of4"
Plate2$Sample_Plate="Plate2of4"
Plate3$Sample_Plate="Plate3of4"
Plate4$Sample_Plate="Plate4of4"

Primer.Layouts<-rbind(Plate1, Plate2, Plate3, Plate4)

Primer.Layouts$Sample_Well<-paste0(Primer.Layouts$Row, gsub("X","", Primer.Layouts$Column))

Primer.Layouts$index<-IndexSeqs[match(Primer.Layouts$I7_Index_ID, IndexSeqs$IndexName),]$IndexSeq
Primer.Layouts$index2<-IndexSeqs[match(Primer.Layouts$I5_Index_ID, IndexSeqs$IndexName),]$IndexSeq

Primer.Layouts$Sample_Project=ProjectName
Primer.Layouts$Description=Description

###########################################################################
#Get sample locations

Layout.Plate1<-melt(read_excel(InputXLSX, sheet = "Plate1")[1:8,1:13], id.var=c("Row"), variable.name="Column", value.name="Sample_Name")
Layout.Plate2<-melt(read_excel(InputXLSX, sheet = "Plate2")[1:8,1:13], id.var=c("Row"), variable.name="Column", value.name="Sample_Name")
Layout.Plate3<-melt(read_excel(InputXLSX, sheet = "Plate3")[1:8,1:13], id.var=c("Row"), variable.name="Column", value.name="Sample_Name")
Layout.Plate4<-melt(read_excel(InputXLSX, sheet = "Plate4")[1:8,1:13], id.var=c("Row"), variable.name="Column", value.name="Sample_Name")

Layout.Plate1$Sample_Plate<-"Plate1of4"
Layout.Plate2$Sample_Plate<-"Plate2of4"
Layout.Plate3$Sample_Plate<-"Plate3of4"
Layout.Plate4$Sample_Plate<-"Plate4of4"

Sample.Layouts<-rbind(Layout.Plate1,Layout.Plate2,Layout.Plate3,Layout.Plate4)
Sample.Layouts$Sample_Well<-paste0(Sample.Layouts$Row, gsub("X","", Sample.Layouts$Column))
Sample.Layouts$Sample_Name<-apply(Sample.Layouts, 1, 
  function(x){
      if(is.na(x["Sample_Name"])){
          return(paste0("Empty_",x["Sample_Plate"],"_", x["Sample_Well"]))
        } else { 
          return(x["Sample_Name"])
        }
      }
    ) #fill empty values with a unique identifier with Empty and the plate/well location

Sample.Layouts$Sample_ID<-Sample.Layouts$Sample_Name #duplicate id to name

SampleSheet<-Sample.Layouts %>% left_join(Primer.Layouts, by=c("Sample_Well", "Sample_Plate"))
SampleSheet<-SampleSheet[,c("Sample_ID", "Sample_Name","Sample_Plate","Sample_Well", "I7_Index_ID","index","I5_Index_ID","index2","Sample_Project","Description")]


if(sum(duplicated(SampleSheet$Sample_ID))!=0){stop(paste("There is a duplicated Sample Name: ", paste(SampleSheet[duplicated(SampleSheet$Sample_ID),], collapse = " ")))}

#Now remove all emptys
SampleSheet<-SampleSheet[-grep("Empty_Plate", SampleSheet$Sample_ID),]

write.table(SampleSheet, "tmpsamplesheet.csv", sep=",", quote=F, row.names = F)

##############################


system(paste0("echo \'", Header, "\' | cat - tmpsamplesheet.csv > ", paste0(OutputLocation,"/", ProjectName,"_samplesheet.csv")), intern=T)
system("rm tmpsamplesheet.csv")
