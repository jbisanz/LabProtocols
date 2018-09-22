# Protocol for qPCR of the 16S rRNA gene for microbe detection in germ-free animals and/or quantification
#### Version 0.991 21 sep 2018 J Bisanz incomplete
***

# Background

Checking the germ-free status of animals or quantifying the bacterial numbers in a sample can be carried out in a very sensitive and quantative manor using quantitative PCR. This protocol is using primers targetting the V6 as it (and the V3) have properties that make it intrinsically better for qPCR than V4. The use of multiple DNA extraction and/or environmental controls will help establish the baseline level of background reagent contamination and allow empirical decisions on contamination status and/or bacterial quantity. DNA extraction should be capable of recovery of low levels of bacteria (see 16S_SOP_2017.md) and provide a template free of PCR inhibition. Inhibition can be monitored by creating a dilution series of a positive control to ensure consistent quantification across dilutions.

***

# Materials and Equipment

- [ ] iTaq™ Universal Probes Supermix (BioRad 1725132)
- [ ] CFX384 thermocycler (Biorad)
- [ ] 384 Plates for qPCR (Biorad #HSP3865)
- [ ] Optically clear Plate Seals (Biorad Microseal ‘B’ #MSB1001)
- [ ] 10x Assay mix (prepare 2µM of each oligo below in nuclease-free water)
- [ ] 10-fold dilution series of gDNA (from any bacteria). Use the QuBit DNA concentration to calculate 16S copy number based on [genome size to genome copy number](http://nebiocalculator.neb.com/#!/dsdnaamt) and [rRNA copy number](https://rrndb.umms.med.umich.edu/). For example: 1ng of <i>E. lenta</i> DSM 2243 DNA ~ 2.7E5 genome copies and the 16S rRNA copy number is 3, so the first point on a 10-fold dilution series prepared from 10ng/µL gDNA is 8.1E5 16S rRNA copies/µL.

#### Oligos
|Oligo|Sequence|Stock [µM]|Working [µM]|Final [nM]|
|-|-|-|-|-|
|891F|TGGAGCATGTGGTTTAATTCGA|100|2|200|
|1003R|TGCGGGACTTAACCCAACA|100|2|200|
|1002P|[Cy5]CACGAGCTGACGACARCCATGCA[BHQ3]*|100|2|200|

<i>* Currently our probe is labelled with Cy5 but reorder with FAM as it will be cheaper and may have better signal</i>

***

# Setting up qPCR RXNs

The master mix we are using has an antibody-mediated hot-start, and as such can be set up at RT in the PCR flow-hood in a 384 well plate. If quantification is desired, the reactions should be set up in triplicate.

### Reaction mixture

|Component|[stock]|µL/rxn|[final]|
|-|-|-|-|
|iTaq Supermix|2X|5|1X|
|10X assay mix|2µM|1|200nM|
|DNA template|variable|4|varable|

After setting up the plate, breifly centrifuge to mix and remove air bubbles before transfering to the CFX384.

### Cycling Parameters

Cycle |	Temperature (˚C)  | Time
------|-------------------|------
Initial Denaturation   |	95	| 5min
||
40 cycles:
Denature | 95˚C | 5 sec
Anneal/Extend | 60˚C	| 15 sec
||
Hold	| 4˚C	Hold | 0 sec

When setting up the plate using the BioRad software, select the 384 plate template with all channels (not the FAM/SYBR only) and use the Gnoto_qPCR run template. Using the plate editor, change your standard curves from unknown, to standards and enter the copy number you have calculated.

### Interpretation



