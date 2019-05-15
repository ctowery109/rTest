library(tidyverse)

#Flight_Time_Accuracy %>% mutate(TotalFlightTime = reorder(PIC, FlightLogTime)) %>%
#  ggplot(aes(PIC, TotalFlightTime)) +
#  geom_bar(width = 0.5, stat = "identity") +
#  coord_flip()


Flight_Time_Pilot_Summary <- Flight_Time_Accuracy %>% 
  select(PIC, FlightLogTime, QuotedToActual, EstimatedToActual) %>%
  group_by(PIC) %>%
  summarize(FlightLogTime = sum(FlightLogTime), QuotedToActual = mean(QuotedToActual, na.rm = T), EstimatedToActual = mean(EstimatedToActual, na.rm = T)) %>%
  mutate(FlightLogTime = reorder(FlightLogTime, PIC)) %>%
  ggplot(aes(PIC, FlightLogTime)) +
  geom_bar(width = 0.5, stat = "identity") +
  coord_flip()

ggsave("figs/barplot.png")
