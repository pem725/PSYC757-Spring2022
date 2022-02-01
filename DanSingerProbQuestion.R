# I've been noodling through some probability questions with Kristin (variations
# of the Boy-Girl problem). We are still trying to sort the second question, and
# I'm curious to get your thoughts on whether my reasoning is sound.

# 1. In families with 2 daughters, what's the probability that at least one
# daughter born on a Thursday?

## PEM:  These probability problems test you for independence.  First, try to
## tackle the givens and the assumptions:

## Given:  Families with two daughters only
## Needed:  P(Thurs birth | two births)

## Assumption 1:  Birthdays (day of week) are independent events
## Assumption 2:  At least one denotes exclusive OR
## Assumption 3:  Probability of birth each day of week equal (uniform)

## Notations:
##  Let A = Thurs birth for girl one (G1)
##  Let B = Thurs birth for girl two (G2)
##  Let 2Girls = G1 and G2 being born already 

## Thus, 

## P(A or B | 2Girls) = P(A) + P(B) - 2P(A)P(B)
## 
## by my reckoning, I would get....

## P(A or B | 2Girls) = 1/7 + 1/7 - 2*(1/49)
##                    = 7/49 + 7/49 - 2/49
##                    = 12/49

### LATE NIGHT REFRAME

## At least one success rule:  P(at least 1 born on Thurs) = 1 - P(non Thurs births)^n
## where n is the number of trials.  Let's work it out using this formulation:

## Success = Thursday birth
## Failure = any other birth day of the week = 1 - Success
## n Trials = 2 girls

PThurs <- 1/7
nTrials <- 2
PnotThurs <- 6/7

PAtLeast1Thurs <- 1 - PnotThurs^nTrials
PAtLeast1Thurs

## Your calculations were correct Dan according to the "At Least Rule"

# 2. In families with 2 daughters, what's the probability that at least one
# daughter is named Leila? Let's assume that on average 1 out of every 7 girl is
# named Leila, and that two girls from the same family can't have the same name.
# (Additional clarification: "There are only two names a family will give their
# daughters, and no family will give two daughters the same name. Imagine the
# confusion otherwise! Let the states of the daughter names be [L,N], [Leiha,
# not Leiha]. Whenever a daughter is born, a random draw is taken from the set
# of possible names with P(Leiha) = 1/7. There are 4 possible outcomes if these
# events (naming the daughter) were independent. But this is not the case, since
# we do not allow the state [L,L], two daughters of the same name."

# For question 1, we can imagine the problem space as a 7 x 7 two dimensional
# space (see second table in attached image).

# Let P(C1t) = probability daughter 1 is born on a tuesday
# Let P(C2t) = probability daughter 2 is born on a tuesday

# There is no conditional relationship here, so we're just looking at the union
# of P(C1t OR C2t). Visually, the shaded squares in the second table represent
# the cases where this is true. This gives us a probability of 13/49. This makes
# sense algebraically since:

# P(C1t OR C2t) = P(C1t) + P(C2t) - P(C1t AND C2t) = (1/7) + (1/7) - (1/49) = 13/49

# Presuming that's not wrong, here's my reasoning for problem 2: I think we can
# imagine the problem space for question 2 as the same 7 x 7 two-dimensional
# space, since the question explicitly defines P(L) = 1/7. The first table in my
# attachment shows what I think is the cases where this is true...effectively
# it's the same quantity of cases minus the intersection (on this table) of
# P(L1) and P(L2), where L1 = child 1 named Leila, and L2 = child 2 named Leila.
# Using this visualization, I get 12/49.

# This makes intuitive sense to me, which when it comes to probability
# questions, almost always means I'm wrong. This is where I'm getting tripped
# up:

# Algebraically, my rationale based on my visulization works out to:

# P(L1) + P(L2) - 2(P(L1 AND L2)) = (1/7) + (1/7) - 2(1/49) = 12/49

# But actually, based on the question, P(L1 AND L2) = 0, since those two cases
# cannot occur simultaneously. So while my inclination was to use the formula
# for P(L1 OR L2) and just plug in 0 for P(L1 AND L2), that doesn't yield a
# rational answer to me. I'm guessing that theorem only holds when P(L1 AND L2)
# != 0?

# One other thing I'm assuming: the 7x7 grid is just a way to represent the 1/7
# probability. Since the only two states are L and N (Leila and Not Leila), my
# grid is not meant to imply that there are only 7 names to choose from. If this
# were the case, we would reduce the problem space at the beginning to eliminate
# the diagonals of all overlaps.

# Thoughts?