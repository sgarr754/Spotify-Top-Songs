#installing and loading package
install.packages("dplyr") 
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

Spotifytop10s <- read.csv("~/RStudio/DataSets/Spotifytop10s.csv")
View(Spotifytop10s)

#This is to filter songs by Lady Gaga
Lady_gaga <- Spotifytop10s %>% filter(artist == "Lady Gaga")
print(Lady_gaga)

#This is to create a table of artists and their songs and arrange them in alphabetical order based on the artists name
artist_and_songs <- Spotifytop10s %>% select(artist, title) %>% arrange(artist)

#Creating a bar graph to display the number of songs each artist has
num_songs <- artist_and_songs %>% count(artist, sort = TRUE)

#Using a bar graph to display artist and number of sons each artist had
ggplot(num_songs, aes(x = reorder(artist, n), y = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(x = "Artist", y = "Number of Songs", title = "Number of Songs by Artist") +
  theme_minimal()

#This is to grab the top 5 artist with the most songs in the dataset
top_5 <- num_songs %>% slice_max(order_by = n, n = 5)

ggplot(top_5, aes(x = reorder(artist, n), y = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(x = "Artist", y = "Number of Songs", title = "Number of Songs by Top 5 Artist") +
  theme_minimal()

#This is to grab the genre of song and its popularity
popular_genre <- Spotifytop10s %>%
  group_by(year, top.genre) %>%
  summarise(avg_popularity = mean(pop, na.rm = TRUE)) %>% #Find the avg popularity (remove any N/A if any)
  ungroup()

# Using a line graph for each genre and its popularity throughout the years (2010-2019)
ggplot(popular_genre, aes(x = year, y = avg_popularity, color = top.genre)) +
  geom_line(size = 1) +
  scale_x_continuous(breaks = 2010:2019) + 
  labs(title = "Genre Popularity Trends (2010–2019)",
       x = "Year",
       y = "Average Popularity",
       color = "Genre") +
  theme_minimal()

#Grabbing the top 10 most popular genres
top10_genre <- Spotifytop10s %>%
  count(top.genre, sort = TRUE) %>%
  slice_max(n, n = 10) %>% #grab the first 10
  pull(top.genre) #This is extracted in to a vector, not its own dataset

#This filter will allow us to create a dataset with only the top 10 genres that we want to graph
filtered_genres <- popular_genre %>%
  filter(top.genre %in% top10_genre)


#Creating line graph
ggplot(filtered_genres, aes(x = year, y = avg_popularity, color = top.genre)) +
  geom_line(size = 1) +
  scale_x_continuous(breaks = 2010:2019) + 
  labs(title = "Genre Popularity Trends (2010–2019)",
       x = "Year",
       y = "Average Popularity",
       color = "Genre") +
  theme_minimal()

#Selecting the energy and the decibels
nrgy_db <- Spotifytop10s %>% select(nrgy, dB)

#This is to find if there is a correlation between the energy and decibel level
nrgy_db_cor <- cor(nrgy_db$nrgy, nrgy_db$dB, use = "complete.obs")
print(nrgy_db_cor)

#Using a scatter plot to find the correlation between energy and decibel level
ggplot(nrgy_db, aes (x = nrgy, y = dB)) +
  geom_point(size = 1) +
  scale_x_continuous(breaks = seq(0,90, by = 10)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = paste("Energy and Decibel(Correlation: ", round(nrgy_db_cor, 2), ")"),
       x = "Energy",
       y = "Decibels",
       color = "Decibel") +
  theme_minimal()

#This is to grab the year and the valence of the song
#This is to find the average valence in each year
val_in_years <- Spotifytop10s %>%
  group_by(year) %>%
  summarise(avg_val = mean(val, na.rm = TRUE)) %>% #Find the avg val (remove any N/A if any)
  ungroup()

# Using the line graph to see if more happy songs or sad songs were played those years
ggplot(val_in_years, aes(x = year, y = avg_val)) +
  geom_line(size = 1) +
  scale_x_continuous(breaks = 2010:2019) + 
  labs(title = "Valence (Happy vs. Sad sounds) between 2010-2019",
       x = "Year",
       y = "Average Valence") +
  theme_minimal()

#This is to find if bpm and valence are correlated.
bpm_val <- Spotifytop10s %>% select(bpm, val)

#This is to find if there is a correlation between the bpm and valence
bpm_val_cor <- cor(bpm_val$bpm, bpm_val$val, use = "complete.obs")
print(bpm_val_cor)

#Using a scatter plot to find if there is a correlation between bpm and valence
ggplot(bpm_val, aes(x = val, y = bpm)) +
  geom_point(size = 1) +
  scale_x_continuous(breaks = seq(0,200, by = 10)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = paste("Beats per Minute (bpm) and Valence (Correlation: ", round(bpm_val_cor, 2), ")"),
       x = "Valence",
       y = "Beats per Minute (bpm)",
       color = "bpm") +
  theme_minimal()

#This if to find which genres tend to be more happy or sad
genre_val <- Spotifytop10s %>% 
  group_by(top.genre) %>%
  summarise(avg_val = mean(val, na.rm = TRUE)) %>%
  arrange(desc(avg_val))

#Using a bar graph to see which genres are more positive or negative
ggplot(genre_val, aes(x = reorder(top.genre, avg_val), y = avg_val)) +
  geom_bar(stat = "identity", fill = "blue", width = 0.4) +
  coord_flip() +
  labs(title = "Average Valence by Genre",
       x = "Genre",
       y = "Average Valence") +
  theme_minimal()

#This is to see if there is a correlation between valence and popularity based by genre
genre_val_popularity <- Spotifytop10s %>%
  group_by(top.genre) %>%
  summarise(avg_val = mean(val, na.rm = TRUE), avg_pop = mean(pop, na.rm = TRUE), ) %>%
  ungroup()

#This is to find if there is a correlation between the avg_val and avg_pop
genre_val_pop_cor <- cor(genre_val_popularity$avg_val, genre_val_popularity$avg_pop, use = "complete.obs")
print(genre_val_pop_cor)

#Using a scatter plot to find if there is a correlation between valence and popularity
ggplot(genre_val_popularity, aes(x = avg_val, y = avg_pop)) +
  geom_point(size = 1) +
  scale_x_continuous(breaks = seq(0,100, by = 10)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = paste("Genre Valence and Genre Popularity(Correlation: ", round(genre_val_pop_cor, 2), ")"),
       x = "Valence",
       y = "Popularity") +
  theme_minimal()

#Using scatter plot too, lets add colour to display the types of genres as well
ggplot(genre_val_popularity, aes(x = avg_val, y = avg_pop, color = top.genre)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  scale_x_continuous(breaks = seq(0, 100, by = 10)) +
  labs(title = paste("Genre Valence vs. Popularity (Correlation:", round(genre_val_pop_cor, 2), ")"),
       x = "Valence",
       y = "Popularity",
       color = "Genre") +
  theme_minimal()

