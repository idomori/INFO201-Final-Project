# INFO201-Final-Project
This is the final project repository for Boundless


## Visualizing crime rates in NY

In the project, we will be analyzing government data from the Division of Criminal Justice Services in the state of New York about Violent, Property, and Firearm Rates by county. Our target audience are any concerned New York citizen and tourism industry to explore crime rates. Our project provides a way to visual crime and hopefully be a guide to those travelers or citizens.

## Target Audiences

```{r}
Direct stakeholders - NY citizens, tourism industry
They are entities that have a visible role in the operation and support of the service. They use the service and are impacted by it.

Indirect stakeholders - data.gov, Division of Criminal Justice Services, Politicians
Although they will not interact with the app, but they took an important role as supporters who provide the detail information.
```

## Dataset and Sources

```{r}
The datasets we worked with are "Index, Violent, Property, and Firearm Rates By County: Beginning 1990 to 2016 in New York State."

The Division of Criminal Justice Services collected the data, and can be accessed through the data.gov, Division of Criminal Justice Services.

Following is the Link to dataset provided by data.gov:
https://catalog.data.gov/dataset/index-violent-property-and-firearm-rates-by-county-beginning-1990
```

```{r}
Data shows overall crime rate
Type shows which county has the most crime rate and firearm rate
Graph displays the NY crime rate changes over time.

Violent Crimes: murder/non-negligent manslaughter, forcible rape, robbery, and aggravated assault
Property Crimes: burglary, larceny, and motor vehicle theft
Firearm: violent crimes involving firearms
Population Data: provided by FBI based on US census
*Disclaimer*: count only represent crimes reported to the police, not the total crimes that occurred. There may be reporting problems.

The statistical analysis/machine learning tells the safety of New York in terms of firearm ownership and firearm violence for residents as well tourists.
```

Through the use of a Shiny Web App, we visualize the data taken about crime rates in the state of New York read in from a data.gov csv data table.The data wrangling procedures we take are filtering, selecting, and joining the csv data with the state county csv data, in order to apply those data onto the ggplot visual representation.
The code is available on https://github.com/idomori/INFO201-Final-Project .

Web Designed by: Franklin, Alanna, Margaret, Nick
3/2018
