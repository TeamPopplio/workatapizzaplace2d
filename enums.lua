return {
    BaseTimer = {
        Active = false,
        CurWait = 0,
        End = 0,
        Callback = function() end
    },
    --Generic
    None = 0,
    --Jobs
    Unassigned = 0,
    Cashier = 1,
    Cook = 2,
    PizzaBoxer = 3,
    Delivery = 4,
    Manager = 5,
    OnBreak = 6,
    --Times of day
    Morning = 0,
    Afternoon = 1,
    Midday = 2,
    Evening = 3,
    Night = 4,
    --Seasons
    Spring = 0,
    Summer = 1,
    Fall = 2,
    Winter = 3,
    --Ingredients
    TomatoSauce = 0,
    Cheese = 1,
    Pepperoni = 2,
    Sausage = 3,
    --Pizzas
    CheesePizza = 0,
    PepperoniPizza = 1,
    SausagePizza = 2,
    --Houses
    C1 = 0,
    C2 = 1,
    C3 = 2,
    B1 = 3,
    B2 = 4,
    B3 = 5,
    B4 = 6,
    B5 = 7,
    B6 = 8,
    A1 = 9,
    A2 = 10,
    A3 = 11,
    --Job Variables
    NoButton = 0,
    TopLeftButton = 1,
    TopRightButton = 2,
    BottomLeftButton = 3,
    BottomRightButton = 4
}
