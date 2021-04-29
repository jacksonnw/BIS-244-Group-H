#Group H Project Script
if(!require("tidyverse")) install.packages(("tidyverse"))
library(tidyverse)

#pulls in Greenhouse Gas and FossilFuel csv files
FossilFuel <- read.csv("FossilFuel.csv")
GreenhouseGas <- read.csv("GreenhouseGas.csv")

#cleans to data from 2005 with 50,000 or more Tonnes of C02 equivalent
UpdatedGreenhouseGas <- subset(GreenhouseGas, select = c(1,19))
UpdatedGreenhouseGas <- filter(UpdatedGreenhouseGas, X2005>50000.0)

#cleans to data from 2005 with fossil fuel % at 50 or above
UpdatedFossilFuel <- subset(FossilFuel, select = c(1,2,48))
UpdatedFossilFuel <- filter(UpdatedFossilFuel, X2005>50.0)

