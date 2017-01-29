import Domain as D
import Variable as V
import Constraint as C


class Problem(object):
    red = V.Variable("red", "colour1", D.Domain([1, 2, 3, 4, 5]))
    green = V.Variable("green", "colour2", D.Domain([1, 2, 3, 4, 5]))
    ivory = V.Variable("ivory", "colour3", D.Domain([1, 2, 3, 4, 5]))
    blue = V.Variable("blue", "colour4", D.Domain([1, 2, 3, 4, 5]))
    yellow = V.Variable("yellow", "colour5", D.Domain([1, 2, 3, 4, 5]))

    english = V.Variable("english", "nat1", D.Domain([1, 2, 3, 4, 5]))
    spaniard = V.Variable("spaniard", "nat2", D.Domain([1, 2, 3, 4, 5]))
    ukrainian = V.Variable("ukrainian", "nat3", D.Domain([1, 2, 3, 4, 5]))
    norwegian = V.Variable("norwegian", "nat4", D.Domain([1, 2, 3, 4, 5]))
    japanese = V.Variable("japanese", "nat5", D.Domain([1, 2, 3, 4, 5]))

    zebra = V.Variable("zebra", "pet1", D.Domain([1, 2, 3, 4, 5]))
    snails = V.Variable("snails", "pet2", D.Domain([1, 2, 3, 4, 5]))
    fox = V.Variable("fox", "pet3", D.Domain([1, 2, 3, 4, 5]))
    horse = V.Variable("horse", "pet4", D.Domain([1, 2, 3, 4, 5]))
    dog = V.Variable("dog", "pet5", D.Domain([1, 2, 3, 4, 5]))

    snakes_ladders = V.Variable("snakes and ladders", "game1", D.Domain([1, 2, 3, 4, 5]))
    cluedo = V.Variable("cluedo", "game2", D.Domain([1, 2, 3, 4, 5]))
    pictionary = V.Variable("pictionary", "game3", D.Domain([1, 2, 3, 4, 5]))
    travel_world = V.Variable("travel the world", "game4", D.Domain([1, 2, 3, 4, 5]))
    backgammon = V.Variable("backgammon", "game5", D.Domain([1, 2, 3, 4, 5]))

    oj = V.Variable("orange juice", "beverage1", D.Domain([1, 2, 3, 4, 5]))
    tea = V.Variable("tea", "beverage2", D.Domain([1, 2, 3, 4, 5]))
    milk = V.Variable("milk", "beverage3", D.Domain([1, 2, 3, 4, 5]))
    coffee = V.Variable("coffee", "beverage4", D.Domain([1, 2, 3, 4, 5]))
    water = V.Variable("water", "beverage5", D.Domain([1, 2, 3, 4, 5]))

    all_variables = [english, spaniard, ukrainian, norwegian, japanese,
                        zebra, snails, fox, horse, dog, snakes_ladders, cluedo, pictionary, travel_world,
                        backgammon, oj, tea, milk, coffee, water, red, green, ivory, blue, yellow]

    # Given Constraints
    c1 = C.Constraint_equality_var_var(english, red)
    c2 = C.Constraint_equality_var_var(spaniard, dog)
    c3 = C.Constraint_equality_var_var(coffee, green)
    c4 = C.Constraint_equality_var_var(ukrainian, tea)
    c5 = C.Constraint_equality_var_plus_cons(green, ivory)
    c6 = C.Constraint_equality_var_var(snakes_ladders, snails)
    c7 = C.Constraint_equality_var_var(cluedo, yellow)
    c8 = C.Constraint_equality_var_cons(milk, 3)
    c9 = C.Constraint_equality_var_cons(norwegian, 1)
    c10 = C.Constraint_equality_abs_var_plus_cons(pictionary, fox)   # ???
    c11 = C.Constraint_equality_abs_var_plus_cons(cluedo, horse)     # ???
    c12 = C.Constraint_equality_var_var(travel_world, oj)
    c13 = C.Constraint_equality_var_var(japanese, backgammon)
    c14 = C.Constraint_equality_abs_var_plus_cons(norwegian, blue)   # ???

    # colours
    c15 = C.Constraint_difference_var_var(red, green)
    c16 = C.Constraint_difference_var_var(red, ivory)
    c17 = C.Constraint_difference_var_var(red, blue)
    c18 = C.Constraint_difference_var_var(red, yellow)
    c19 = C.Constraint_difference_var_var(green, ivory)
    c20 = C.Constraint_difference_var_var(green, blue)
    c21 = C.Constraint_difference_var_var(green, yellow)
    c22 = C.Constraint_difference_var_var(ivory, blue)
    c23 = C.Constraint_difference_var_var(ivory, yellow)
    c24 = C.Constraint_difference_var_var(blue, yellow)

    # nationalities
    c25 = C.Constraint_difference_var_var(english, spaniard)
    c26 = C.Constraint_difference_var_var(english, ukrainian)
    c27 = C.Constraint_difference_var_var(english, norwegian)
    c28 = C.Constraint_difference_var_var(english, japanese)
    c29 = C.Constraint_difference_var_var(spaniard, ukrainian)
    c30 = C.Constraint_difference_var_var(spaniard, norwegian)
    c31 = C.Constraint_difference_var_var(spaniard, japanese)
    c32 = C.Constraint_difference_var_var(ukrainian, norwegian)
    c33 = C.Constraint_difference_var_var(ukrainian, japanese)
    c34 = C.Constraint_difference_var_var(norwegian, japanese)

    # pets
    c35 = C.Constraint_difference_var_var(zebra, snails)
    c36 = C.Constraint_difference_var_var(zebra, fox)
    c37 = C.Constraint_difference_var_var(zebra, horse)
    c38 = C.Constraint_difference_var_var(zebra, dog)
    c39 = C.Constraint_difference_var_var(snails, fox)
    c40 = C.Constraint_difference_var_var(snails, horse)
    c41 = C.Constraint_difference_var_var(snails, dog)
    c42 = C.Constraint_difference_var_var(fox, horse)
    c43 = C.Constraint_difference_var_var(fox, dog)
    c44 = C.Constraint_difference_var_var(horse, dog)

    # board games
    c45 = C.Constraint_difference_var_var(snakes_ladders, cluedo)
    c46 = C.Constraint_difference_var_var(snakes_ladders, pictionary)
    c47 = C.Constraint_difference_var_var(snakes_ladders, travel_world)
    c48 = C.Constraint_difference_var_var(snakes_ladders, backgammon)
    c49 = C.Constraint_difference_var_var(cluedo, pictionary)
    c50 = C.Constraint_difference_var_var(cluedo, travel_world)
    c51 = C.Constraint_difference_var_var(cluedo, backgammon)
    c52 = C.Constraint_difference_var_var(pictionary, travel_world)
    c53 = C.Constraint_difference_var_var(pictionary, backgammon)
    c54 = C.Constraint_difference_var_var(travel_world, backgammon)

    # beverages
    c55 = C.Constraint_difference_var_var(oj, tea)
    c56 = C.Constraint_difference_var_var(oj, milk)
    c57 = C.Constraint_difference_var_var(oj, coffee)
    c58 = C.Constraint_difference_var_var(oj, water)
    c59 = C.Constraint_difference_var_var(tea, milk)
    c60 = C.Constraint_difference_var_var(tea, coffee)
    c61 = C.Constraint_difference_var_var(tea, water)
    c62 = C.Constraint_difference_var_var(milk, coffee)
    c63 = C.Constraint_difference_var_var(milk, water)
    c64 = C.Constraint_difference_var_var(coffee, water)

    constraint_set = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20,
                    c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31, c32, c33, c34, c35, c36, c37, c38, c39, c40,
                    c41, c42, c43, c44, c45, c46, c47, c48, c49, c50, c51, c52, c53, c54, c55, c56, c57, c58, c59, c60,
                    c61, c62, c63, c64]

    def __init__(self):
        '''Constructor'''
        self.all_variables
        self.constraint_set

    def get_variables(self):
        '''return a list of all variables'''
        return self.all_variables

    def print_variable_domains(self):
        '''print each variable'''
        for v in self.all_variables:
            v.print_variable()

    def get_constraints(self):
        '''Return a list of all constraints'''
        return self.constraint_set