# Load Data
library(tidyverse)

# Plot hyw (miles per gallon) against displ (engine size in L)
ggplot(data = mpg) + # Create Blank plot
  geom_point(mapping = aes(x = displ, y = hwy)) # Add points

# Exercises
ggplot(data = mpg) # Gives Nothing
mpg # 234 * 11
?mpg # drv = type of drive train
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))

# Map third variable to aesthetic
ggplot(data = mpg) + # Correct spelling of colour!
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

ggplot(data = mpg) + # Size
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + # Alpha (transparency)
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) + # Alpha (transparency)
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# For each aesthetic, you use aes() to associate name with variable to display
# aes() gathers aesthetic mappings used by layer and passes to mapping argument
# x and y are just aesthetics - visual properties 

# We can set aesthetic properties manually
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# Exercises 
ggplot(data = mpg) + # Wrong because it sits within aes()
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
?mpg # Manufacturer, model, trans, drv, fl, class -> categorical

ggplot(data = mpg) + # Mapping multiple vars to one aesthetic works as expected
  geom_point(mapping = aes(x = displ, y = hwy, color=class, shape=class))

ggplot(data = mpg) + # Stroke is border width
  geom_point(mapping = aes(x = displ, y = hwy, stroke=cyl))

ggplot(data = mpg) + # You can use TRUE/FALSE filters as well
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))


# Common problems
ggplot(data = mpg) # Doesn't work - + in wrong place
+ geom_point(mapping = aes(x = displ, y = hwy))

# Facets - Split plot into subplots that display subsets

ggplot(data = mpg) + # Formulas!
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)


ggplot(data = mpg) + # Formulas!
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(drv ~ cyl)

# Facet Grid vs Facet wrap
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(. ~ cyl)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl) # Overall grid rep - shows empty facets

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(drv ~ cyl) # Separate plot per facet - misses empty

# Exercises
ggplot(data = mpg) + # Continous variables - in for a bad time
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cty)


ggplot(data = mpg) + # No datapoints in 5 drv and 4 cty
  geom_point(mapping = aes(x = drv, y = cyl)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + # (Same results as this)
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .) # Just one var

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl) # Just one var


ggplot(data = mpg) + # Why facet instead of colour?
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + # Don't know - easier to pick out smaller groups?
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

?facet_grid # Facet grad has no nrow/nrow as these are predetermined by variables

# Geometric Objects
