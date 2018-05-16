# Analytical procedure for automated LC/MS/MS assay of digoxin and dihydrodigoxin in plasma
#### Modified from Yong Huang 6/16
#### Version 1.0 16 May 2018 ENB + JB
***

# Materials

#### Reagents, consumables, and equipment
- [ ] HPLC Grade Methanol
- [ ] MQ water
- [ ] Ethyl Acetate, 0.5 mL per sample
- [ ] Methyl t-butyl ether, 0.5mL per sample
- [ ] Acetonitrile
- [ ] Glass pasteur pipettes (~1mL), 1 per sample
- [ ] 16x48mm test tubes (Agilent 5022-6533), 2 per sample
- [ ] Autosampler vials (485050 E&K scientific)
- [ ] Turbovap and nitrogen tank
- [ ] Appropriate serum blank (germ-free mouse serum)
- [ ] Dry ice and methanol/isopropanol bath
- [ ] Vortex
- [ ] Fume Hood
- [ ] Centrifuge


#### Standards

|Standard|Company|Catolog #|Stock Concentration|Stock Diluent|
|-|-|-|-|-|
|Digoxin|Sigma|D6003|500µg/mL|DMF/MeOH|
|Oleandrin(IS)|Sigma|06069|500µg/mL|MeOH|
|Dihydrodigoxin|Custom synthesized|NA|500µg/mL|DMF/MeOH|

#### Instrument
* Pump:	Shimadzu LC-30 AD
* Injector: Shimadzu SIL- 30AC set at 4°C
* Detector: LC/MS/MS API Qtrap 6500
* Column: ODS Hypersil 4.6 x 100 mm, 5 µm particle size (or equivalent)

#### Run Conditions
* Mobile phase: 65/35 (v/v) MeOH:water
* Column Temperature: 50°C
* Inection Volume: 10-20µL
* Run Time 5.0min

|Metabolite|Elution Time(min)|
|-|-|
|Digoxin|2.0|
|Dihydrodigoxin|2.1|
|Oleandrin(IS)|3.6|

* Sample Inlet: Turbo Spray IonDrive
* Mass scanning mode:	Negative MRM (Multiple Reaction Monitor)

|Metabolite    |Q1 (m/z)|Q3 (m/z)|
|--------------|--------|--------|
|Digoxin       |779.4   |475.2   |
|Dihydrodigoxin|781.4   |521.1   |
|Oleandrin(IS) |575.2   |531.1   |

* Ionization:	ESI/Negative Ionization

|Parameter    | Setting |
|-|-|
|Duration     |5.0min   |
|Cycle Time   |0.615sec |
|Cycles 	    |488      |
|Scan Time    |200 msec |
|Scan Type|Negative MRM|
|Resolution Q1|unit|
|Resolution Q3|unit|
|Intensity Threshold|0.00 cps|
|Smart Setting|off|
|Settling Time|0.00 msec|
|MR Pause|5.00 msec|
|MCA|No|
|GS1|55|
|GS2|55|
|CUR|20|
|Temperature|600°C|
|CAD|High (N2 = 99.999%)|
|Step Size|0.00 amu|
|DP|-40|
|EP| -10.00|
|CE Digoxin |-59 |
|CE Dihydrodigoxin|-56|
|CE Oleandrin (IS)|-45|
|CXP|12|
|IS|4500|
|Weighted linear regression|1/x<sup>2</sup>|

***

# Preparation of Standards

Standards are prepared by mixing 45µL H<sub>2</sub>O with 5µL serum and the volumes below:

|Standard|50% ACN (µL)|Dig Working Solution (ng/mL)|Working Solution (µL)|Stanrdard Curve Concentration (ng/ml)|
|-|-|-|-|-|
|00|20|0|0|0|
|0|20|0|0|0|
|1|18|2.5|2|0.1|
|2|15|2.5|5|0.25|
|3|10|2.5|10|0.5|
|4|0|2.5|20|1|
|5|18|50|2|2|
|6|15|50|5|5|
|7|10|50|10|10|
|8|0|50|20|20|

QC samples are prepared according to the volumes below:

|QC Sample|50% ACN (µL) | Dig Working solution (ng/mL)| Volume Spiked (µL) | Nominal Concentration)|
|-|-|-|-|-|
|Low|14|2.50|6|0.75|
|Medium|18|50|2|5.0|
|High|4|50|16|40|

***

# Extraction

- [ ] Mix 45µL H<sub>2</sub>O with 5µL sample in serum, and 20 µL of 50% acetonitrile/water
- [ ] Add 100µL of internal standard (10ng/mL oleandrin) and mix
- [ ] Add 1 mL of 1:1 methyl t-butyl ether: ethyl acetate, and mix well by vortex
- [ ] Centrifuge at 3000rpm for 10 min
- [ ] Freeze the aqueous layer in dry ice/alcohol bath
- [ ] Transfer organic phase to new 16x48mm tube
- [ ] Evaporate in Turbovap under nitrogen (10psi) at RT for ~30 min or until dry
- [ ] Reconstitute in 65:35 MeOH:H<sub>2</sub>O and votex well
- [ ] Transfer to autosampler vials and centrifuge for 6 min at 10,000rpm
