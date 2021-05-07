#Group H Project Script
#Haoming Li, Yiming Zhuang, Qingxuan Chen, Danielle Pollner, Jackson Nichols-Worley

#Clear the boards
rm(list=ls(all=TRUE))
cat("\014")

#load different packages
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(readr)

#check current working directory
Temp <- getwd()

#pulls in Greenhouse Gas and FossilFuel csv files
FossilFuel <- read.csv("FossilFuel.csv")
GreenhouseGas <- read.csv("GreenhouseGas.csv")
#View(FossilFuel)
#View(GreenhouseGas)

#cleans to data from 2005 with 50,000 or more Tonnes of C02 equivalent
UpdatedGreenhouseGas <- subset(GreenhouseGas, select = c(1,19))
UpdatedGreenhouseGas <- filter(UpdatedGreenhouseGas, X2005>50000.0)

#cleans to data from 2005 with fossil fuel % at 50 or above
UpdatedFossilFuel <- subset(FossilFuel, select = c(1,2,48))
UpdatedFossilFuel <- filter(UpdatedFossilFuel, X2005>50.0)

#View(UpdatedGreenhouseGas)
#View(UpdatedFossilFuel)

#Adjust two data set to match the same countries
df <- UpdatedFossilFuel %>% filter(Country.Name=="Austira" | Country.Name=="Belgium" | Country.Name=="Chile" | Country.Name=="Colombia" | Country.Name=="France" | Country.Name=="Estonia" | Country.Name=="Germany" | Country.Name=="Greece" | Country.Name=="Iceland" | Country.Name=="Israel" | Country.Name=="Italy"| Country.Name=="Japan" | Country.Name=="Latvia" | Country.Name=="Netherlands" | Country.Name=="Norway" | Country.Name=="Poland" | Country.Name=="Slovenia" | Country.Name=="Switzerland" | Country.Name=="Turkey" | Country.Name=="United States" | Country.Name=="Slovak Republic")
ndf <- UpdatedGreenhouseGas %>% filter(Country=="Belgium" | Country=="Chile" | Country=="Colombia" | Country=="France" | Country=="Germany" | Country=="Greece" | Country=="Israel" | Country=="Italy"| Country=="Japan" | Country=="Latvia" | Country=="Netherlands" | Country=="Norway" | Country=="Poland" | Country=="Slovenia" | Country=="Switzerland" | Country=="Turkey" | Country=="United States" | Country=="Slovak Republic")
#View(df)
#View(ndf)

#Create a new column and store the Fossil Fuel data in df
df$FossilFuel <- 0
df$FossilFuel <- ndf$X2005
#View(df)

#Make the graph
p <- ggplot(data=df, aes(x=X2005, y=FossilFuel,label=Country.Name)) + geom_point() + geom_smooth(method = "lm", se = FALSE)
p <- p + geom_text_repel()
p <- p + labs(x="Greenhous Gas",y="Fossil Fuel",title="Relation between Fossil Fuel and Greenhouse Gas")
p
