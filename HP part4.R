HP <- read.csv("~/Documents/GitHub/HP-Intern/Dataset.csv")
library(ggplot2)
library(dplyr)
library(stringr)
library(plotly)

str(HP)
HP$Total.Funding.Amount.Currency..in.USD. <- as.numeric(HP$Total.Funding.Amount.Currency..in.USD.)
HP$Number.of.Acquisitions <- as.numeric(HP$Number.of.Acquisitions)
HP$Number.of.Founders <- as.numeric(HP$Number.of.Founders)
HP$Number.of.Funding.Rounds <- as.numeric(HP$Number.of.Funding.Rounds)

data_clean <- HP %>%
  group_by(Organization.Name) %>%
  select(Organization.Name, Total.Funding.Amount.Currency..in.USD., Number.of.Founders, Number.of.Acquisitions, Last.Funding.Amount.Currency..in.USD.) %>%
  filter(!is.na(Number.of.Acquisitions)) %>%
  filter(!is.na(Organization.Name)) %>%
  filter(!is.na(Total.Funding.Amount.Currency..in.USD.))%>%
  filter(!is.na(Last.Funding.Amount.Currency..in.USD.)) %>%
  filter(!is.na(Number.of.Founders))
  
data_apply <- data_clean %>%
  arrange(-Total.Funding.Amount.Currency..in.USD.)
data_apply<- head(data_apply, 20)

plot1 <- ggplot(data = data_apply) +
  geom_col(mapping = aes(
    x = Number.of.Acquisitions, y = reorder(Organization.Name, Number.of.Acquisitions)
  )) +
  labs(
    x = "Acquisitions", y = "Startups",
    title = "Chart1"
  )
ggplotly(plot1)










  
  
  