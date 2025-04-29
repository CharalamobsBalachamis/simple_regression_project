# Just testing some regression with fake age/calorie data
# (Numbers taken from the regression section of my applied stats book)

library(ggplot2)


people <- c(1 : 40) # 40 People


# Ages taken from the book 
ages <- c(63, 49, 44, 69, 55, 62, 41, 42, 36, 50, 60, 50, 42, 37, 34, 
          40, 65, 62, 45, 42, 36, 59, 40, 48, 66, 59, 73, 34, 49, 31, 
          69, 66, 65, 66, 75, 60, 68, 33, 59, 74)


# Calories taken from the book
kcal <- c(2822, 2419, 2518, 3015, 1857, 1875, 2322, 
          3536, 2943, 2658, 2596, 2593, 2655, 3728, 3766, 2327, 2637, 
          2524, 1928, 3027, 2352, 2454, 2175, 2358, 1495, 2075, 1411,
          1725, 2291, 2047, 1776, 2265, 1821, 1501, 1458, 2111, 1546, 
          3181, 1837, 832)

# added a height variable 
heights <- c(164, 153, 158, 161, 153, 168, 167, 173, 167, 
            152, 148, 162, 165, 173, 176, 170, 162, 164,
            178, 176, 165, 168, 156, 163, 146, 175, 153, 
            162, 153, 153, 152, 155, 156, 158, 152, 154,
            173, 176, 163, 149)


#Creation of a df
regression_data <- data.frame(people = people, ages = ages, 
                              heights = heights, kcal = kcal)


# Simple regression model
model <- lm(kcal ~ ages + heights, data = regression_data )

#Displaying the model
summary(model)

# plotting the model out
ggplot(regression_data, aes(x = ages, y = kcal)) +
  geom_point() +                  
  geom_smooth(method = "lm") +    
  labs(title = "Linear Regression: kcal ~ ages",
       x = "Age (years)", y = "Daily Caloric Intake (kcal)")