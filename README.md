# Spotify Song Analysis: Trends in Music from 2010–2019

## Project Overview

This project explores trends in popular music from 2010 to 2019 using the **R language** and the **RStudio IDE**. The goal was to practice and demonstrate basic **data manipulation**, **visualization**, and **analysis** in R, while exploring questions about song features and their relationships.


## Dataset and Project Details

This project contains the manipulation of a dataset containing ~600 songs that were in the top songs of the year between the years of 2010 to 2019, which was measured by Billboard. The purpose of the project is to display an understanding of how R language (with the use of RStudio IDE) can be used to manipulate data and how statistics can assist in better understanding of what the data tells us. 

- **Dataset Source**: Originally found via [DataCamp](https://www.datacamp.com), downloaded as a `.csv` from [Kaggle](https://www.kaggle.com).
- **Learning Resources**: Much of the foundational R knowledge was gained through [W3Schools' R Tutorial](https://www.w3schools.com/r/). Other resources included YouTube, Reddit, and Google.
- **Goal**: To practice working with R and RStudio, and to improve analytical and reporting skills through a beginner-friendly, music-based dataset.


## Questions and Tasks

During the creation of this project, the following questions/tasks have helped guide me in the basic understanding of R language, statistics, and analysis skills. The first set of questions displays my work and understanding of how data is manipulated and how graphs can be used to display meaningful information, and the second set of questions included finding the relationship between specific values and whether they correlated with each other. The following set of questions/tasks includes:

### Data Manipulation & Visualization Tasks

- Create a table grouping all artist together alphabetically with their songs
- Create a graph displaying all the artists and the number of songs they have in the dataset
- Who are the top 5 artists with the most songs?
- What are all the genres and display their popularity throughout the years
- What are the top 10 most popular genres?

### Correlation & Statistical Analysis Tasks

- Is there a correlation between the **energy** of the songs and **decibel levels**? Do more **energetic** songs have **higher decibel levels**?
- What is the **average valence** (happy/positive emotion vs sad/negative emotion) each year?
- Is there a correlation between **beats per minute (bpm)** and **valence**? Does a **higher bpm** indicate a happier/positive sounding song?
- What is the **average valence per genre**?
- Is there a correlation between **genre valence** and **genre popularity**? Are happier/positive songs more popular or vice versa?


## Data Dictionary
Copied via [DataCamp](https://www.datacamp.com)

| **Variable** | **Explanation** |
|--------------|------------------|
| `title`      | Title of the song |
| `artist`     | Artist or performer |
| `top.genre`  | Song's genre |
| `year`       | Billboard year |
| `bpm`        | Tempo (beats per minute) |
| `nrgy`       | Energy level (0–100) |
| `dnce`       | Danceability (0–100) |
| `dB`         | Loudness in decibels |
| `live`       | Liveness (likelihood of being recorded live) |
| `val`        | Valence: positivity of the sound (0–100) |
| `dur`        | Duration of the song |
| `acous`      | Acousticness score |
| `spch`       | Speechiness score |


## Exploratory Data Analysis (EDA)
### Artist and Song Titles

Let's begin by focusing on the artists and their songs in the list.

Create a table of artist and their songs:

![Image](https://github.com/user-attachments/assets/9e329c63-c90e-4d8f-afc9-19fba6e358a4)

The next table was to display the artist, the number of songs they had in the dataset, and sort them in descending order: 

![Image](https://github.com/user-attachments/assets/241c4132-2b82-4433-b96f-caa87e7445b5)

Let's focus on the top 5 artists with the most songs in the set:

![Image](https://github.com/user-attachments/assets/e1f05e16-96ca-495d-a6c1-7a5ac7d5fff0)

---

### Genres

The next dataset looks at the types of genres of each song, which year it made in the charts, and its popularity scale (the higher the number, the more popular the song was in the dataset). 

Here is the line graph created displaying the years and popularity trends of each genre in the dataset: 

![Image](https://github.com/user-attachments/assets/d4ef9335-5d03-47ea-b751-d38579d755f4)

Let's select the Top 10 most popular genres:
- Here we can see the top 10 most popular genres between the years of 2010 to 2019. At the beginning of 2010 the most popular genre at the time was neo mellow, but has gradually declined, until 2016. A reason as to why this genre no longer is as popular can be due to artists of that genre not being able to make it to the top songs of the year.

- On the opposite end, we see that big room started with 0 popularity before quickly moving up above 75 in 2013. It has gradually gone up and down the popularity scale between 2013 to 2019. Although the genre itself starts at 0, its popularity average is still higher than the other genres average popularity.

![Image](https://github.com/user-attachments/assets/5f05c795-6287-4965-98aa-e634c2a60955)

---

### Energy and Decibels
Here we look at the relationship between energy and decibels. 

**Question:** Does energy increase with decibel levels? Does lower energy equal lower decibel levels?

- In the table below we see that there is a slight increase in energy when decibel levels also increase. We also see that the correlation coefficient  is 0.5, indicating that there is a strong correlation between energy and decibel level. We can say that an increase in decibel levels often means an increase in the energy of a song

![Image](https://github.com/user-attachments/assets/966e882a-49c9-410d-84b1-48c5889fec77)

---

### Valence
Valence indicates the emotions that a song portrays. A higher value indicates a happier/positive emotion of a song, while a lower value indicates sad/negative emotion. 

The graph displays that happier songs made it to the top song between 2011 and 2012, before gradually decreasing in 2013. We can see that there has been a fall in happier songs and sad/negative songs have been more common after 2013. 

![Image](https://github.com/user-attachments/assets/cf24b9c7-ba20-45af-a310-db1281484d6c)

Learning more about valence, let's find if there is a correlation between beats per minute (bpm) and valence. 

**Question**: Does higher bpm indicate happy/positive sounds? Does lower bpm indicate sad/negative sound? 

- Based on the scatter chart, along with the linear regression line, this displays that there is a weak relationship/correlation between the bpm and valence. The data shows that there is not sufficient enough data to say that bpm affects the emotions of a song.

![Image](https://github.com/user-attachments/assets/c05b3b1c-ae68-4118-a543-550f6616b111)

Let us look into genres and its average valence:

![Image](https://github.com/user-attachments/assets/c8d0cdb0-ae78-46b4-acaa-56a9e1d6007b)

Lets see if there is any correlation between genre valence and genre popularity:

With the scatterplot below, and linear regression line, we can see that there is a weak relationship/correlation between genre popularity and valence. While this may suggest that an increase in valence can decrease its popularity, there is very minimal significance to this data that can guarantee that the emotions of a song has little to no impact on the popularity of the song.

![Image](https://github.com/user-attachments/assets/71524c50-948f-4cb3-a3b1-554ffdf0f72c)

Another scatterplot was also created to show the genres and their average valence and average popularity:

![Image](https://github.com/user-attachments/assets/f182d634-c128-4adb-8474-90e08adddc1b)

---

## Key Findings
- Looking at the top 5 most popular artists, we see that Katy Perry was number one in the chart with 17 songs. At that time her album Teenage Dream, came out in the year 2010, sold  3.1 million copies in the United States, and charted within the Top 40 of the Billboard 200 year-end chart three years in a row (Wikipedia contributors, n.d.). Justin Bieber follows next on the list with 16 songs, as he debuted in 2009, and with his first album, My World 2.0, releasing in 2010.

- Looking further into the top 10 most popular genres we see that boy bands entered in 2012 and gained traction up to 2019. A popular boy band that debuted in 2011 includes One Direction, whose album, Up All Night, released in late 2011. We began to see an increase in boy band subgenres in 2015. Some international bands that either have debuted in 2015 or have gained international recognition include 5 Seconds of Summer, BTS, EXO, SHINee, GOT7, Seventeen, CNCO, and VIXX

- We also see that there is a strong correlation between the energy of a song and the decibel levels. While the energy of the song increases, indicating high energy, the decibel level also seems to increase with it as well. The linear regression line visually indicates that there is a positive correlation between energy and decibel level.

## Reflection
This project was made more to explore and build proficiency in R language and the use of RStudio. While my background experience in building code, queries, and basic statistics, has aided me in my learning of R language, there is still more to know when it comes to building graphs and using statistics to visually display relationships between the datasets and values. 

Throughout the process I’ve learned to use:
- Data manipulation techniques using the dplyr library, such as group_by(), summarise(), filter(), ungroup(), and arrange()
- The use of ggplot() to build visual graphs such as line graphs, bar graphs, scatter plot graphs, and regression lines.
- Using cor() to find the correlation coefficient and understanding the relationship between data such as the strong correlation between Energy versus Decibel Levels, and the weak correlation between Valence versus bpm, and Genre Valence versus Genre Popularity. 
- Better understanding on the structure of R analysis reports and how narration is combined with code blocks and data visualization. 

While this project was more for building experience in R language, RStudio, and analysis reports, I would like to explore more on popularity of genres and how other factors such as length of the song, word count of the lyrics, and acoustics have played a role in popularity and its trends throughout the years.


## References

Wikipedia contributors. (n.d.). Teenage Dream (Katy Perry album). Wikipedia. Retrieved May 22, 2025, from https://en.wikipedia.org/wiki/Teenage_Dream#:~:text=Billboard%20named%20Teenage%20Dream%20%22one,and%20Record%20of%20the%20Year. 
