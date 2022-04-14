#' @title Example Data Frame for oxidizable organic carbon (C) or Walkley-Black C in soil
#' @description User is advised to prepare the data as suggested in the example to get the oxidizable organic C or Walkley-Black C (WBC) in soil
#' @usage df_WBC
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of potassium dichromate solution (mL) in the second column, Volume of ferrous ammonium sulphate solution (mL) consumed in titration without soil (i.e., blank titration) in the third column, Volume of ferrous ammonium sulphate solution (mL) consumed in titration with soil in the fourth column, Normality of potassium dichromate solution in the fifth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_Potassium_dichromate	-	for Volume of potassium dichromate solution (mL)
#'
#' Vol_FAS_Blank - for Volume of ferrous ammonium sulphate solution (mL) consumed in titration without soil (i.e., blank titration)
#'
#' Vol_FAS_Soil - for Volume of ferrous ammonium sulphate solution (mL) consumed in titration with soil
#'
#' Normality_Potassium_dichromate - for Normality of potassium dichromate solution
#'
#' @export
df_WBC = read.table(text = "Mass_Soil	Vol_Potassium_dichromate	Vol_FAS_Blank	Vol_FAS_Soil	Normality_Potassium_dichromate
1	10	20	18	1
1	10	20.1	17	1
1	10	19.9	17.5	1
1	10	19.8	16.8	1
1	10	20.2	17.1	1
0.5	10	19.8	16.7	1
0.5	10	19.9	15.8	1
0.5	10	19.7	14.9	1
0.5	10	20.1	17.9	1
0.5	10	20	18.2	1", header = TRUE)

#' @title Oxidizable organic carbon (C) or Walkley-Black C in soil
#'
#' @description The oxidizable organic C or Walkley-Black C (WBC) in soil is obtained by this function based on the method described by Walkley and Black (1934).
#'
#' @usage WBC(W = W, Vk = Vk, Vb = Vb, Vs = Vs, Nk = Nk)
#'
#' @param  W Mass of soil sample (g)
#' @param  Vk Volume of potassium dichromate solution (mL)
#' @param  Vb Volume of ferrous ammonium sulphate solution (mL) consumed in titration without soil (i.e., blank titration)
#' @param  Vs Volume of ferrous ammonium sulphate solution (mL) consumed in titration with soil
#' @param  Nk Normality of potassium dichromate solution
#' @return WBC_pc - Oxidizable organic C or Walkley-Black C in soil (%)
#' WBC_gkg - Oxidizable organic C or Walkley-Black C in soil (g/kg)
#'
#'
#' @references Basak RK (2000) Soil Testing and Recommendation: A Text Book. Kalyani Publishers, New Delhi, India.
#'
#' Walkley AJ, Black CA (1934) An estimation of the Degtjareff method for determining soil organic matter and a proposed modification of the chromic acid titration method. Soil Science 37, 29–38. doi:10.1097/00010694-193401000-00003
#'
#' @details Soil organic C is very important to soil fertility, nutrient cycling and C sequestration. Routine soil testing includes determination of oxidizable organic C as per the method described by Walkley and Black (1934). The oxidizable organic C mostly encompasses C present in partly decomposed organic matter and slightly the well decomposed organic matter in soil (Basak, 2000). The method suggested by Walkley and Black (1934) involves oxidation of soil organic C with an excess of standard (usually 1 N) potassium dichromate solution (usually, 10 mL for 1 g soil) in presence of concentrated sulphuric acid (20 mL). The unreacted potassium dichromate solution is titrated against freshly prepared ferrous ammonium sulphate solution to get the volume of potassium dichromate solution consumed in oxidizing soil organic C, from which the content of oxidizable organic C is calculated.
#' @export
#' @examples
#' with(data = df_WBC, WBC(W = Mass_Soil, Vk = Vol_Potassium_dichromate,
#' Vb = Vol_FAS_Blank, Vs = Vol_FAS_Soil, Nk = Normality_Potassium_dichromate))
#'

WBC <- function(W = W, Vk = Vk, Vb = Vb, Vs = Vs, Nk = Nk){
  WBC_pc = Vk*(1-(Vs/Vb))*Nk*0.3/W
  WBC_gkg = WBC_pc*10

  return(list(WBC_pc = WBC_pc, WBC_gkg = WBC_gkg))
}

#' @title Example Data Frame for mineral nitrogen (N) in soil
#' @description User is advised to prepare the data as suggested in the example to get the mineral N (ammonium-N and nitrate-N together) in soil
#' @usage df_Minearl_N
#' @format Data frame with Mass of moist soil sample (g) in the first column, Moisture content (% w/w) in the second column, Volume of aliquot of the extract (mL) taken for distillation in the third column, Volume of 2 M KCl (mL) added as extractant in the fourth column, Volume of standard sulphuric acid solution (mL) consumed in titration with soil in the fifth column, Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration) in the sixth column, and Normality of standard sulphuric acid solution in the seventh column. Write the following notations on the spreadsheet:
#'
#' Mass_Moistsoil - for Mass of moist soil sample (g)
#'
#' Moisture_Percent - for Moisture content of the field-moist soil sample (% w/w)
#'
#' Vol_Aliquot - for Volume of aliquot of the extract (mL) taken for distillation
#'
#' Vol_Extractant - for Volume of 2 M KCl (mL) added as extractant
#'
#' Vol_Sulphuric_Soil - for Volume of standard sulphuric acid solution (mL) consumed in titration with soil
#'
#' Vol_Sulphuric_Blank - for Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration)
#'
#' Normality_Sulphuric - for Normality of standard sulphuric acid solution
#'
#' @export
df_Minearl_N = read.table(text = "Mass_Moistsoil	Moisture_Percent	Vol_Aliquot	Vol_Extractant	Vol_Sulphuric_Soil	Vol_Sulphuric_Blank	Normality_Sulphuric
40	23.2	50	200	1.29	0.04	0.01
40	21.4	50	200	1.24	0.03	0.0101
40	20.5	50	200	1.26	0.05	0.01
40	26.1	50	200	1.12	0.06	0.01
40	20.4	50	200	1.27	0.01	0.0102
20	19.5	25	100	0.67	0.07	0.01
20	17.5	25	100	0.65	0.02	0.0104
20	16.2	25	100	0.69	0.05	0.01
20	14.2	25	100	0.48	0.03	0.0102
20	18.9	25	100	0.61	0.04	0.0101", header = TRUE)

#' @title Mineral N i.e., summation of ammonium-N and nitrate-N in soil
#'
#' @description This function determines the amount of mineral N (ammonium-N + nitrate-N) in soil as extracted by 2 M KCl, expressed in terms of oven-dried soil mass (Rowell, 1994).
#'
#' @usage Mineral_N(W = W, m = m, VA = VA, VE = VE, VS = VS, VB = VB, X = X)
#'
#' @param  W Mass of moist soil sample (g)
#' @param  m Moisture content of the field-moist soil sample (% w/w)
#' @param  VA Volume of aliquot of the extract (mL) taken for distillation
#' @param  VE Volume of 2 M KCl (mL) added as extractant
#' @param  VS Volume of standard sulphuric acid solution (mL) consumed in titration with soil
#' @param  VB Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration)
#' @param  X Normality of standard sulphuric acid solution
#' @return N_mgkg - Mineral N in soil (mg/kg) (expressed in terms of oven-dried soil mass)
#'
#'
#' @references Biswas, D.R. (2018) Determination of different forms of nitrogen in soil and total N in plant. In Manual on Advanced Techniques for Analysis of Nutrients and Pollutant Elements in Soil, Plant and Human (S.P. Datta, M.C. Meena, B.S. Dwivedi, A.K. Shukla (Eds.)), Westville Publishing House, New Delhi, pp. 57-68.
#'
#' Rowell, D.L. (1994) Soil Science Methods and Application, Pearson Education Ltd., Essex, England.
#'
#' @details Mineral N in soil consists of ammonium and nitrate ions present on soil exchange sites or solution or both. It can be extracted by 2 M KCl. The extract is steam-distilled in the presence of magnesium oxide and Devarda’s alloy (Cu: Al: Zn :: 50: 45: 5) to liberate ammonia. The evolved ammonia is absorbed in 2% boric acid solution containing mixed indicator, pH 4.5, and titrated against standard sulphuric acid solution to know the volume of the boric acid consumed during ammonia absorption (Rowell, 1994; Biswas, 2018).
#'
#' @export
#' @examples
#' with(data = df_Minearl_N, Mineral_N(W = Mass_Moistsoil, m = Moisture_Percent,
#' VA = Vol_Aliquot, VE = Vol_Extractant, VS = Vol_Sulphuric_Soil,
#' VB = Vol_Sulphuric_Blank, X = Normality_Sulphuric))
#'

Mineral_N <- function(W = W, m = m, VA = VA, VE = VE, VS = VS, VB = VB, X = X){
  N_mgkg = (VS-VB)*14*X*(VE+(W*m)/(100+m))*(100+m)*10/(VA*W)

  return(N_mgkg)
}


#' @title Example Data Frame for total nitrogen (N) and available or mineralizable N in soil
#'
#' @description User is advised to prepare the data as suggested in the example to get the total N (when soil is digested with concentrated sulphuric acid in the presence of digestion mixture); or available or mineralizable N (when soil is distilled with alkaline potassium permanganate solution) in soil
#'
#' @usage df_N_Boric
#'
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of standard sulphuric acid solution (mL) consumed in titration with soil in the second column, Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration) in the third column, and Normality of standard sulphuric acid solution in the fourth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_Sulphuric_Soil - for Volume of standard sulphuric acid solution (mL) consumed in titration with soil
#'
#' Vol_Sulphuric_Blank - for Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration)
#'
#' Normality_Sulphuric - for Normality of standard sulphuric acid solution
#'
#' @export
df_N_Boric = read.table(text = "Mass_Soil	Vol_Sulphuric_Soil	Vol_Sulphuric_Blank	Normality_Sulphuric
0.5	5	0.1	0.01
0.5	5	0.1	0.01
1	5	0.1	0.0105
1	5	0.1	0.0101
5	5	0.1	0.01
5	5	0.15	0.0104
20	15.1	0.15	0.0101
20	16.2	0.15	0.0101", header = TRUE)

#' @title Total, or Mineralizable Nitrogen using boric acid for ammonia absorption
#'
#' @description Nitrogen in soil when the ammonia is absorbed in 4% or 2% boric acid (pH 4.5); and standard sulphuric acid is used for titration
#'
#' @usage N_Boric(W = W, VS = VS, VB = VB, X = X)
#'
#' @param  W Mass of soil sample (g)
#' @param  VS Volume of standard sulphuric acid solution (mL) consumed in titration with soil
#' @param  VB Volume of standard sulphuric acid solution (mL) consumed in titration without soil (i.e., blank titration)
#' @param  X Normality of standard sulphuric acid solution
#' @return N_pc - Nitrogen in soil (%)
#' N_gkg - Nitrogen in soil (g/kg)
#' N_mgkg - Nitrogen in soil (mg/kg)
#' N_kgha - Nitrogen in soil (kg/ha)
#'
#' @references Biswas, D.R. (2018) Determination of different forms of nitrogen in soil and total N in plant. In Manual on Advanced Techniques for Analysis of Nutrients and Pollutant Elements in Soil, Plant and Human (S.P. Datta, M.C. Meena, B.S. Dwivedi, A.K. Shukla (Eds.), Westville Publishing House, New Delhi, pp. 57-68.
#'
#' Bremner, J.M. (1996) Nitrogen Total. In Methods of Soil Analysis Part 3: Chemical Methods (D.L. Sparks (Eds.), SSSA Book Series 5, Soil Science Society of America, Madison, Wisconsin, pp. 1085-1022.
#'
#' Subbiah, B.V. and Asija, G.L. (1956) A rapid procedure for the determination of available nitrogen in soils. Current Science 25, 259-260.
#'
#' @details In a soil, total N can be determined by first digesting the soil with concentrated sulphuric acid in presence of a digestion mixture containing potassium sulphate, cupric sulphate, and selenium powder in the ratio 200: 20: 1 at 390±5 °C till a clear solution (greenish coloured) is obtained. Then the acid digest is distilled with alkali (generally 40% NaOH) to liberate ammonia gas which is then absorbed in 4% boric acid solution, pH 4.5, and titrated against standard sulphuric acid solution to know the volume of the boric acid consumed during ammonia absorption (Bremner, 1996; Biswas, 2018). For available or mineralizable N, soil is distilled with alkaline potassium permanganate solution (0.32%). The potassium permanganate oxidizes a part of soil organic matter, and liberates ammonia gas in the presence of an alkali, e.g., 40% NaOH. The evolved ammonia is absorbed in 2% boric acid solution containing mixed indicator, pH 4.5, and titrated against standard sulphuric acid solution to know the volume of the boric acid consumed during ammonia absorption (Subbiah and Asija, 1956; Biswas, 2018).
#'
#' @export
#'
#' @examples
#' with(data = df_N_Boric, N_Boric(W = Mass_Soil, VS = Vol_Sulphuric_Soil,
#' VB = Vol_Sulphuric_Blank, X = Normality_Sulphuric))
#'

N_Boric <- function(W = W, VS = VS, VB = VB, X = X){
  N_pc = (VS-VB)*X*1.4/W
  N_gkg = N_pc*10
  N_mgkg = N_gkg*1000
  N_kgha = N_mgkg*2.24

  return(list(N_pc = N_pc, N_gkg = N_gkg, N_mgkg = N_mgkg,
              N_kgha = N_kgha))
}


#' @title Example Data Frame for total nitrogen (N) in soil
#'
#' @description User is advised to prepare the data as suggested in the example to get the total N in soil
#'
#' @usage df_N_Sulphuric
#'
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of standard sodium hydroxide solution (mL) consumed in titration with soil in the second column, Volume of standard sodium hydroxide solution (mL) consumed in titration without soil (i.e., blank titration) in the third column, and Normality of standard sodium hydroxide solution in the fourth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_NaOH_Soil - for Volume of standard sodium hydroxide solution (mL) consumed in titration with soil
#'
#' Vol_NaOH_Blank - for Volume of standard sodium hydroxide solution (mL) consumed in titration without soil (i.e., blank titration)
#'
#' Normality_NaOH - for Normality of standard sodium hydroxide solution
#'
#' @export
df_N_Sulphuric = read.table(text = "Mass_Soil	Vol_NaOH_Soil	Vol_NaOH_Blank	Normality_NaOH
0.5	19.1	20.1	0.101
0.5	19.1	19.8	0.1
1	19.4	20.2	0.108
1	18.1	19.7	0.1
5	19.5	19.9	0.1
5	19	19.5	0.107
20	18.5	20.4	0.1
20	17.6	20.1	0.1", header = TRUE)

#' @title Total Nitrogen (N) using sulphuric acid for ammonia absorption
#'
#' @description This function determines the amount of total N in soil given that liberated ammonia gas is absorbed in standard sulphuric acid; and standard sodium hydroxide solution is used for titration.
#'
#' @usage N_Sulphuric(W = W, VS = VS, VB = VB, X = X)
#'
#' @param  W Mass of soil sample (g)
#' @param  VS Volume of standard sodium hydroxide solution (mL) consumed in titration with soil
#' @param  VB Volume of standard sodium hydroxide solution (mL) consumed in titration without soil (i.e., blank titration)
#' @param  X Normality of standard sodium hydroxide solution
#' @return N_pc - Nitrogen in soil (%)
#' N_gkg - Nitrogen in soil (g/kg)
#' N_mgkg - Nitrogen in soil (mg/kg)
#' N_kgha - Nitrogen in soil (kg/ha)
#'
#' @references Biswas, D.R. (2018) Determination of different forms of nitrogen in soil and total N in plant. In Manual on Advanced Techniques for Analysis of Nutrients and Pollutant Elements in Soil, Plant and Human (S.P. Datta, M.C. Meena, B.S. Dwivedi, A.K. Shukla (Eds.), Westville Publishing House, New Delhi, pp. 57-68.
#'
#' Bremner, J.M. (1996) Nitrogen Total. In Methods of Soil Analysis Part 3: Chemical Methods (D.L. Sparks (Eds.), SSSA Book Series 5, Soil Science Society of America, Madison, Wisconsin, pp. 1085-1022.
#'
#' @details In a soil, total N can be determined by first digesting the soil with concentrated sulphuric acid in presence of a digestion mixture containing potassium sulphate, cupric sulphate, and selenium powder in the ratio 200: 20: 1 at 390±5 °C till a clear solution (greenish coloured) is obtained. Then the acid digest is distilled with alkali (generally 40% NaOH) to liberate ammonia gas which is then absorbed in standard sulphuric acid solution (0.1 N or so), and titrated against standard sodium hydroxide solution (0.1 N or so) to know the volume of the sulphuric acid consumed during ammonia absorption (Bremner, 1996; Biswas, 2018).
#'
#' @export
#'
#' @examples
#' with(data = df_N_Sulphuric, N_Sulphuric(W = Mass_Soil, VS = Vol_NaOH_Soil,
#' VB = Vol_NaOH_Blank, X = Normality_NaOH))
#'

N_Sulphuric <- function(W = W, VS = VS, VB = VB, X = X){
  N_pc = (VB-VS)*X*1.4/W
  N_gkg = N_pc*10
  N_mgkg = N_gkg*1000
  N_kgha = N_mgkg*2.24

  return(list(N_pc = N_pc, N_gkg = N_gkg, N_mgkg = N_mgkg,
              N_kgha = N_kgha))
}


#' @title Example Data Frame for available phosphorus (P) in soils
#'
#' @description User is advised to prepare the data as suggested in the example to get the content of available P in soil based on spectrophotometric determination using ascorbic acid blue colour method (Watanabe and Olsen, 1965).
#'
#' @usage df_Available_P
#'
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of extractant solution (mL) in the second column, Volume of aliquot of the extract (mL) in the third column, Volume of coloured solution (mL) in the fourth column, P concentration (mg/L) in coloured solution as obtained from the ‘Std_Curve’ function in the fifth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_Extractant - for Volume of extractant solution (mL)
#'
#' Vol_Aliquot - for Volume of aliquot of the extract (mL)
#'
#' Vol_Colour - for Volume of coloured solution (mL)
#'
#' P_mgL_Std_curve - for P concentration in coloured solution (mg/L) as obtained from the ‘Std_Curve’ function
#'
#' @export
df_Available_P = read.table(text = "Mass_Soil	Vol_Extractant	Vol_Aliquot	Vol_Colour	P_mgL_Std_curve
2.5	50	5	25	0.0892764
2.5	50	5	25	0.0933456
2.5	50	5	25	0.0729996
2.5	50	5	25	0.0689304
2.5	50	5	25	0.193041
2.5	50	5	25	0.172695
2.5	50	5	25	0.1462452
2.5	50	5	25	0.1584528
2.5	50	5	25	0.1665912
2.5	50	5	25	0.1584528", header = TRUE)

#' @title Available phosphorus (P) in soil determined by ascorbic acid blue colour method
#'
#' @description The available P in soil is obtained by this function when P concentration in the extract is determined by ascorbic acid blue colour method using a spectrophotometer (Watanabe and Olsen, 1965).
#'
#' @usage Available_P(W = W, VE = VE, VA = VA, VC = VC, R = R)
#'
#' @param  W Mass of soil sample (g)
#' @param  VE Volume of extractant solution (mL)
#' @param  VA Volume of aliquot of the extract (mL)
#' @param  VC Volume of coloured solution (mL)
#' @param  R P concentration in coloured solution (mg/L) as obtained from the 'Std_Curve' function
#' @return P_mgkg - Available P in soil (mg/kg)
#' P_kgha - Available P in soil (kg/ha)
#' P2O5_mgkg - Available P in soil in terms of P2O5 (mg/kg)
#' P2O5_kgha - Available P in soil in terms of P2O5 (kg/ha)
#'
#' @references Bray, R.H. and Kurtz, L.T. (1945) Determination of total, organic and available forms of phosphorus in soils. Soil Science 59, 39-45.
#'
#' Olsen, S.R., Sommers, L.E., Watanabe, F.S. and Dean, L.A. (1954) Estimation of available phosphorus in soils by extraction with sodium bicarbonate. Circular 939. U.S. Department of Agriculture, Washington, DC.
#'
#' Watanabe, F.S. and Olsen, S.R. (1965) Test of an ascorbic acid method for determining phosphorus in water and NaHCO3 extracts from soil. Soil Science Society of America Proceedings 29, 677-678.
#'
#' @details Available P is commonly extracted by Olsen extractant i.e., 0.5 M sodium bicarbonate (pH 8.5) in neutral to alkaline and calcareous soils (Olsen et al., 1954); or Bray and Kurtz extractant no. 1 i.e., 0.03 N ammonium fluoride in 0.025 N HCl in acid soils (Bray and Kurtz, 1945). After extraction, blue colour is developed using ascorbic acid method, the intensity of which is measured using a spectrophotometer (Watanabe and Olsen, 1965).
#'
#' @export
#'
#' @examples
#' with(data = df_Available_P, Available_P(W = Mass_Soil, VE = Vol_Extractant,
#' VA = Vol_Aliquot, VC = Vol_Colour, R = P_mgL_Std_curve))
#'

Available_P <- function(W = W, VE = VE, VA = VA, VC = VC, R = R){
  P_mgkg = R*(VE/W)*(VC/VA)
  P_kgha = P_mgkg*2.24
  P2O5_mgkg = P_mgkg*2.29
  P2O5_kgha = P2O5_mgkg*2.24

  return(list(P_mgkg = P_mgkg, P_kgha = P_kgha, P2O5_mgkg = P2O5_mgkg,
              P2O5_kgha = P2O5_kgha))
}


#' @title Example Data Frame for available potassium (K) in soils
#'
#' @description User is advised to prepare the data as suggested in the example to get the content of available K in soil based on flame photometer reading.
#'
#' @usage df_Available_K
#'
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of extractant solution (mL) in the second column, Volume of aliquot of the extract (mL) in the third column, Volume of final solution fed to flame photometer (mL) in the fourth column, K concentration (mg/L) in final solution as obtained directly from the flame photometer or indirectly from the ‘Std_Curve’ function in the fifth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_Extractant - for Volume of extractant solution (mL)
#'
#' Vol_Aliquot - for Volume of aliquot of the extract (mL)
#'
#' Vol_Final - for Volume of final solution fed to flame photometer (mL)
#'
#' Flame_Reading - for K concentration (mg/L) in final solution as obtained directly from the flame photometer or indirectly from the ‘Std_Curve’ function
#' In case of no additional dilution after extraction, the values of Vol_Aliquot and Vol_Final should be put as 1.
#'
#' @export
df_Available_K = read.table(text = "Mass_Soil	Vol_Extractant	Vol_Aliquot	Vol_Final	Flame_Reading
5	25	1	1	5
5	25	1	1	4
5	25	1	1	4.5
5	25	1	1	6.2
5	25	1	5	2.4
5	25	1	5	3.5
5	25	1	5	1.6
5	25	1	10	0.5
5	25	1	10	0.89", header = TRUE)

#' @title Available potassium (K) in soil
#'
#' @description The content of available K in soil as extracted by neutral normal ammonium acetate solution is obtained by this function based on flame photometric determination (Hanway and Heidel, 1952).
#'
#' @usage Available_K(W = W, VE = VE, VA = VA, VF = VF, FR = FR)
#'
#' @param  W Mass of soil sample (g)
#' @param  VE Volume of extractant solution (mL)
#' @param  VA Volume of aliquot of the extract (mL)
#' @param  VF Volume of final solution fed to flame photometer (mL)
#' @param  FR K concentration (mg/L) in final solution as obtained directly from the flame photometer or indirectly from the ‘Std_Curve’ function
#' @return K_mgkg - Available K in soil (mg/kg)
#' K_kgha - Available K in soil (kg/ha)
#' K_cmolckg - Available K in soil (cmolc/kg)
#' K2O_mgkg - Available K in soil in terms of K2O (mg/kg)
#' K2O_kgha - Available K in soil in terms of K2O (kg/ha)
#' K2O_cmolckg - Available K in soil in terms of K2O (cmolc/kg)
#'
#' @references Hanway, J.J. and Heidel, H. (1952) Soil analysis methods as used in Iowa State College Soil Testing Laboratory. Iowa Agriculture 57, 1–13.
#'
#' Das, D., Sahoo, J., Basit-Raza, Md., Barman, M. and Das, R. (2022) Ongoing soil potassium depletion under intensive cropping in India and probable mitigation strategies. A review. Agronomy for Sustainable Development 42:4. https://doi.org/10.1007/s13593-021-00728-6
#'
#' @details Available K is commonly extracted by 1 N ammonium acetate (pH 7), and determined by a flame photometer directly, or after dilution if needed (Hanway and Heidel, 1952). It includes solution K and exchangeable K present in soil, and is readily available to plants (Das et al., 2022). In case of no additional dilution after extraction, the values of VA and VF should be put as 1.
#'
#' @export
#'
#' @examples
#' with(data = df_Available_K, Available_K(W = Mass_Soil, VE = Vol_Extractant,
#' VA = Vol_Aliquot, VF = Vol_Final, FR =  Flame_Reading))
#'

Available_K <- function(W = W, VE = VE, VA = VA, VF = VF, FR = FR){
  K_mgkg = FR*(VE/W)*(VF/VA)
  K_kgha = K_mgkg*2.24
  K_cmolckg = K_mgkg/390
  K2O_mgkg = K_mgkg*1.2046
  K2O_kgha = K_kgha*1.2046
  K2O_cmolckg = K_cmolckg*1.2046

  return(list(K_mgkg = K_mgkg, K_kgha = K_kgha, K_cmolckg = K_cmolckg,
              K2O_mgkg = K2O_mgkg, K2O_kgha = K2O_kgha, K2O_cmolckg = K2O_cmolckg))
}


#' @title Example Data Frame for available micronutrient cations in soils
#'
#' @description User is advised to prepare the data as suggested in the example to get the content of available micronutrient cations in soil based on atomic absorption spectrophotometer (AAS) reading.
#'
#' @usage df_DTPA_Micro
#'
#' @format Data frame with Mass of soil sample (g) in the first column, Volume of extractant solution (mL) in the second column, Volume of aliquot of the extract (mL) in the third column, Volume of final solution fed to AAS (mL) in the fourth column, Concentration of the micronutrient cation (mg/L) in final solution (test sample) as obtained from the AAS in the fifth column, Concentration of the micronutrient cation (mg/L) in the blank solution as obtained from the AAS in the sixth column. Write the following notations on the spreadsheet:
#'
#' Mass_Soil - for Mass of soil sample (g)
#'
#' Vol_Extractant - for Volume of extractant solution (mL)
#'
#' Vol_Aliquot - for Volume of aliquot of the extract (mL)
#'
#' Vol_Final - for Volume of final solution fed to AAS (mL)
#'
#' AAS_Sample	for Concentration of the micronutrient cation (mg/L) in final solution (test sample) as obtained from the AAS
#'
#' AAS_Blank	for Concentration of the micronutrient cation (mg/L) in the blank solution as obtained from the AAS
#'
#' In case of no additional dilution after extraction, the values of Vol_Aliquot and Vol_Final should be put as 1.
#'
#' @export
#'
df_DTPA_Micro = read.table(text = "Mass_Soil	Vol_Extractant	Vol_Aliquot	Vol_Final	AAS_Sample	AAS_Blank
20	40	1	1	5	0.05
20	40	1	1	4	0.04
20	40	1	1	4.5	0.03
20	40	1	1	6.2	0.02
20	40	1	5	2.4	0.04
20	40	1	5	3.5	0.07
20	40	1	5	1.6	0.05
20	40	1	10	0.5	0.06
20	40	1	10	0.89	0.08", header = TRUE)

#' @title Available micronutrient cations in soil
#'
#' @description The content of available or DTPA (diethylene triamine penta-acetic acid) extractable micronutrient cations e.g., iron (Fe), manganese (Mn), zinc (Zn), copper (Cu), and nickel (Ni) can be obtained by this function based on AAS reading.
#'
#' @usage DTPA_Micro(W = W, VE = VE, VA = VA, VF = VF, S = S, B =  B)
#'
#' @param  W Mass of soil sample (g)
#' @param  VE Volume of extractant solution (mL)
#' @param  VA Volume of aliquot of the extract (mL)
#' @param  VF Volume of final solution fed to flame photometer (mL)
#' @param  VF Volume of final solution fed to AAS (mL)
#' @param  S Concentration of the micronutrient cation (mg/L) in final solution (test sample) as obtained from the AAS
#' @param  B Concentration of the micronutrient cation (mg/L) in the blank solution as obtained from the AAS
#' @return Micro_mgkg - Available micronutrient cation in soil (mg/kg)
#' Micro_kgha - Available micronutrient cation in soil (kg/ha)
#'
#' @references Datta, S.P., Golui, D., Barman, M., Meena, M.C., Shukla, S.K. and Trivedi, V.K. (2019) Determination of micronutrients and pollutant elements in soil. In Soil Analysis (S.K. Singh et al. (Eds.), Indian Society of Soil Science, New Delhi.
#'
#' Lindsay, W.L. and Norvell, W.A. (1978) DTPA soil test method for determining available zinc, iron, manganese and copper. Soil Science Society of America Journal 42, 421-428.
#'
#' @details Plant available cationic micronutrients i.e., Fe, Mn, Zn, Cu, and Ni in soils are commonly extracted by DTPA extractant i.e., 0.005 M DTPA + 0.1 M TEA + 0.01 M CaCl2, pH 7.3; and determined by an AAS directly, or after dilution if needed (Lindsay and Norvell, 1978; Datta et al., 2019). In case of no additional dilution after extraction, the values of VA and VF should be put as 1.
#'
#' @export
#'
#' @examples
#' with(data = df_DTPA_Micro, DTPA_Micro(W = Mass_Soil, VE = Vol_Extractant,
#' VA = Vol_Aliquot, VF = Vol_Final, S = AAS_Sample, B =  AAS_Blank))
#'

DTPA_Micro <- function(W = W, VE = VE, VA = VA, VF = VF, S = S, B =  B){
  Micro_mgkg = (S-B)*(VE/W)*(VF/VA)
  Micro_kgha = Micro_mgkg*2.24

  return(list(Micro_mgkg = Micro_mgkg, Micro_kgha = Micro_kgha))
}


#Standard curve
#' @title Example Data Frame for element concentration from standard curve
#'
#' @description User is advised to prepare the data as suggested in the example to get the concentration of the element under consideration from absorbance or emission readings and elemental concentration in the working standard solutions.
#'
#' @usage df_Std_Curve
#'
#' @format Data frame with Concentration of the element in the working standard solutions (mg/L) in the first column, Absorbance or Emission reading of the working standard solutions in the second column, Absorbance or Emission reading of the sample solutions in the third column. Write the following notations on the spreadsheet:
#'
#' Conc_mgL - for Concentration of the element in the working standard solutions (mg/L)
#'
#' Abs_Emi_Std - for Absorbance or Emission reading of the working standard solutions
#'
#' Abs_Emi_Sample - for Absorbance or Emission reading of the sample solutions
#'
#' @export
#'
df_Std_Curve = read.table(text = "C_Std	A_E_Std	A_E_Sample
0	0	0.034
0.08	0.03	0.036
0.16	0.064	0.026
0.24	0.104	0.024
0.32	0.144	0.085
0.4	0.193	0.075
0.48	0.233	0.062
0.56	0.246	0.068
0.64	0.3	0.072
0.72	0.355	0.068
0.8	0.385	0.07", header = TRUE)

#' @title Elemental concentration in solution from absorbance or emission values
#'
#' @description The concentration of the element in question is obtained by this function based on absorbance or emission values corresponding to the concentrations of that element in the working standard solutions.
#' @importFrom graphics abline legend
#' @importFrom stats coef lm
#' @usage Std_Curve(C_Std = C_Std, A_E_Std = A_E_Std, A_E_Sample = A_E_Sample,...)
#'
#' @param  C_Std Concentration of the element in the working standard solutions (mg/L)
#' @param  A_E_Std Absorbance or Emission reading of the working standard solutions
#' @param  A_E_Sample Absorbance or Emission reading of the sample solutions
#' @param  ... Any other arguments that can be passed to base plot, such as main = "title", xlab = "Emission", ylab = "Concentration"
#' @return Sample_mgL - Concentration of the element under consideration in the solution used for absorbance or emission reading (mg/L)
#'
#' @details For elements like phosphorus (P), sulphur (S), boron (B), the determination of concentration in the extract is done by a spectrophotometer based on absorbance readings corresponding to different known concentrations. For elements like potassium (K), sodium (Na), the determination of concentration in the extract is done by a flame photometer based on emission readings corresponding to different known concentrations. In each case, a standard curve is fitted between the absorbance or emission readings and the concentrations of the particular element in the working standard solutions. A linear regression equation can be fitted to the curve, based on which the concentration of the element under consideration in the sample extract can be determined.
#'
#' @export
#'
#' @examples
#' with(df_Std_Curve, Std_Curve(C_Std = C_Std, A_E_Std = A_E_Std,
#' A_E_Sample = A_E_Sample, xlab = "Emission", ylab = "Concentration"))
#'

Std_Curve <- function(C_Std = C_Std, A_E_Std = A_E_Std,
          A_E_Sample = A_E_Sample,...){
  myplot <- function(x, y, xlab=deparse(substitute(x)), ylab=deparse(substitute(y)),...){
    plot(x, y, xlab=xlab, ylab=ylab, pch = 19,...)
  }
  myplot(x = A_E_Std, y = C_Std,...)
  abline(lm(C_Std ~ A_E_Std), col = "blue")
  fit.slr <- lm(C_Std ~ A_E_Std)

  ##Round the coefficients for better output
  cf <- round(coef(fit.slr), 2)

  ##Make the regression equation
  eq <- paste0("y = ", cf[1],
               ifelse(sign(cf[2])==1, " + ", " - "), abs(cf[2]), " x ")

  #Get the R2 value
  Rsq = format(summary(fit.slr)$r.squared,digits=3)

  ##Printing of the equation and R2 on the plot
  legend("topleft", legend = c(eq, as.expression(bquote(R^2 == .(Rsq)))), bty = "n")

  Sample_mgL = coef(fit.slr)[1]+coef(fit.slr)[2]*A_E_Sample
  return(Sample_mgL)
}

