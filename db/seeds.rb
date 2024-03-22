# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

p "Deleting current database..."

RecipeIngredient.destroy_all
UserBadge.destroy_all
UserRecipe.destroy_all
Step.destroy_all
Recipe.destroy_all
User.destroy_all
Country.destroy_all
Ingredient.destroy_all
Badge.destroy_all

p "Current database deleted!"

#####

p "Creating countries..."

countries = ["france", "italy"]

countries.each do |country|
  Country.create(name: country)
end

p "#{Country.all.length} Countries created!"

#####

p "Creatings badges..."

badges = [
  { name: "French cook",
    icon: "Badge-fr.png" },
  { name: "Italian cook",
    icon: "Badge-it.png" },
  { name: "Easy",
    icon: "Badge-easy.png" },
  { name: "Medium",
    icon: "" },
  { name: "Hard",
    icon: "" },
  { name: "Badge Chicken",
    icon: "" },
  { name: "Badge Pork",
    icon: "" },
  { name: "Badge Beef",
    icon: "" },
  { name: "Badge Duck",
    icon: "" },
  { name: "Vegetarian cook",
    icon: "Badge-veget.png" },
  { name: "Badge Vegan",
    icon: "" },
  { name: "Badge Dessert",
    icon: "" },
  { name: "Level 5",
    icon: "" },
  { name: "Level 10",
    icon: "" },
  { name: "Level 15",
    icon: "" },
  { name: "Level 20",
    icon: "" },
  { name: "Level 25",
    icon: "" },
  { name: "Badge 1h",
    icon: "" },
  { name: "Badge 5h",
    icon: "" },
  { name: "Badge 10h",
    icon: "" },
  { name: "Badge 15h",
    icon: "" },
  { name: "Badge 20h",
    icon: "" },
  { name: "Badge 25h",
    icon: "" }
]

badges.each do |badge|
  new_badge = Badge.new(name: badge[:name])

  new_badge.icon = badge[:icon] unless badge[:icon].empty?

  new_badge.save
end

p "#{Badge.all.length} Badges created!"

#####

p "Creating ingredients..."

ingredients = ["strong bread flour", "instant yeast", "salt", "olive oil", "passata",
               "basil", "garlic clove", "mozarella", "parmesan", "cherry tomato",
               "pancetta", "pecorino", "egg", "spaghetti", "butter", "black pepper",
               "gelatine", "double cream", "whole milk", "white caster sugar", "vanilla pod",
               "strawberry", "cornflour", "bacon", "shallot", "chicken leg", "chicken thigh",
               "chicken breast", "cognac", "red wine", "chicken stock", "tomato purée",
               "thyme sprig", "rosemary sprig", "bay leaf", "parsley", "chestnut mushroom",
               "plain flour", "softened butter", "red peppers", "courgette", "aubergine",
               "onion", "red wine vinegar", "sugar", "dry white wine", "vegetable stock",
               "baguette", "gruyère"]

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient)
end

p "#{Ingredient.all.length} Ingredients created!"

#####

recipes = [
  {
    recipe: { name: "Pizza margherita",
              servings: 4,
              xp: 200,
              difficulty: "easy",
              prep_time: 35,
              country_id: Country.find_by(name: "italy").id,
              url: "https://images.ctfassets.net/nw5k25xfqsik/64VwvKFqxMWQORE10Tn8pY/200c0538099dc4d1cf62fd07ce59c2af/20220211142754-margherita-9920.jpg"
             },
    steps: ["Make the base: Put the flour into a large bowl, then stir in the yeast and salt. Make a well, pour in 200ml warm water and the olive oil and bring together with a wooden spoon until you have a soft, fairly wet dough. Turn onto a lightly floured surface and knead for 5 mins until smooth. Cover with a tea towel and set aside. You can leave the dough to rise if you like, but it’s not essential for a thin crust.",
            "Make the sauce: Mix the passata, basil and crushed garlic together, then season to taste. Leave to stand at room temperature while you get on with shaping the base.",
            "Roll out the dough: if you’ve let the dough rise, give it a quick knead, then split into two balls. On a floured surface, roll out the dough into large rounds, about 25cm across, using a rolling pin. The dough needs to be very thin as it will rise in the oven. Lift the rounds onto two floured baking sheets.",
            "Top and bake: heat the oven to 240C/220C fan/gas 8. Put another baking sheet or an upturned baking tray in the oven on the top shelf. Smooth sauce over bases with the back of a spoon. Scatter with cheese and tomatoes, drizzle with olive oil and season. Put one pizza, still on its baking sheet, on top of the preheated sheet or tray. Bake for 8-10 mins until crisp. Serve with a little more olive oil, and basil leaves if using. Repeat step for remaining pizza."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "strong bread flour").id,
                            quantity: 300,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "instant yeast").id,
                            quantity: 1,
                            unit: "tsp" },
                          { ingredient_id: Ingredient.find_by(name: "salt").id,
                            quantity: 1,
                            unit: "tsp" },
                          { ingredient_id: Ingredient.find_by(name: "olive oil").id,
                            quantity: 1,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "passata").id,
                            quantity: 100,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "basil").id,
                            quantity: 1,
                            unit: "handful" },
                          { ingredient_id: Ingredient.find_by(name: "garlic clove").id,
                            quantity: 1,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "mozarella").id,
                            quantity: 125,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "parmesan").id,
                            quantity: 1,
                            unit: "handful" },
                          { ingredient_id: Ingredient.find_by(name: "cherry tomato").id,
                            quantity: 1,
                            unit: "handful" } ],
    keywords: ["vegetarian"]
  },
  {
    recipe: { name: "Spaghetti carbonara",
              servings: 4,
              xp: 200,
              difficulty: "easy",
              prep_time: 30,
              country_id: Country.find_by(name: "italy").id,
              url: "https://assets.afcdn.com/recipe/20211214/125831_w1024h1024c1cx866cy866cxt0cyt292cxb1732cyb1732.jpg"
            },
    steps: ["Put a large saucepan of water on to boil.",
            "Finely chop the 100g pancetta, having first removed any rind. Finely grate 50g pecorino cheese and 50g parmesan and mix them together.",
            "Beat the 3 large eggs in a medium bowl and season with a little freshly grated black pepper. Set everything aside.",
            "Add 1 tsp salt to the boiling water, add 350g spaghetti and when the water comes back to the boil, cook at a constant simmer, covered, for 10 minutes or until al dente (just cooked).",
            "Squash 2 peeled plump garlic cloves with the blade of a knife, just to bruise it.",
            "While the spaghetti is cooking, fry the pancetta with the garlic. Drop 50g unsalted butter into a large frying pan or wok and, as soon as the butter has melted, tip in the pancetta and garlic.",
            "Leave to cook on a medium heat for about 5 minutes, stirring often, until the pancetta is golden and crisp. The garlic has now imparted its flavour, so take it out with a slotted spoon and discard.",
            "Keep the heat under the pancetta on low. When the pasta is ready, lift it from the water with a pasta fork or tongs and put it in the frying pan with the pancetta. Don’t worry if a little water drops in the pan as well (you want this to happen) and don’t throw the pasta water away yet.",
            "Mix most of the cheese in with the eggs, keeping a small handful back for sprinkling over later.",
            "Take the pan of spaghetti and pancetta off the heat. Now quickly pour in the eggs and cheese. Using the tongs or a long fork, lift up the spaghetti so it mixes easily with the egg mixture, which thickens but doesn’t scramble, and everything is coated.",
            "Add extra pasta cooking water to keep it saucy (several tablespoons should do it). You don’t want it wet, just moist. Season with a little salt, if needed.",
            "Use a long-pronged fork to twist the pasta on to the serving plate or bowl. Serve immediately with a little sprinkling of the remaining cheese and a grating of black pepper. If the dish does get a little dry before serving, splash in some more hot pasta water and the glossy sauciness will be revived."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "pancetta").id,
                            quantity: 100,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "pecorino").id,
                            quantity: 50,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "parmesan").id,
                            quantity: 50,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "egg").id,
                            quantity: 3,
                            unit: "large" },
                          { ingredient_id: Ingredient.find_by(name: "spaghetti").id,
                            quantity: 350,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "garlic clove").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "butter").id,
                            quantity: 50,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "salt").id,
                            quantity: 1,
                            unit: "pinch" },
                          { ingredient_id: Ingredient.find_by(name: "black pepper").id,
                            quantity: 1,
                            unit: "pinch" } ],
    keywords: ["pork"]
  },
  {
    recipe: { name: "Strawberry panna cotta",
              servings: 6,
              xp: 400,
              difficulty: "hard",
              prep_time: 55,
              country_id: Country.find_by(name: "italy").id,
              url: "https://img.delicious.com.au/hF-Hsp-j/w1200/del/2023/11/vanilla-yoghurt-panna-cotta-with-sumac-strawberries-and-arak-strawberry-granita-201035-1.jpg"
             },
    steps: ["For the panna cotta, put the gelatine leaves in a small bowl of cold water to soften – this will take about 5 mins. Meanwhile, pour the cream, milk and 2/3 of the sugar into a pan, split the vanilla pod, scrape out the seeds and add, along with the pod, to the cream mixture. Heat gently until hot, but not bubbling. Remove the gelatine leaves from the water, squeeze out any excess liquid then add, one at a time, to the hot cream. Stir until dissolved. Leave to stand for 20-30 mins until cooled – the vanilla pods should be suspended in the liquid by this point. Strain the mixture through a sieve into 6 serving glasses, then chill for at least 3 hrs.",
            "Toss the strawberries with the cornflour and what's left of the sugar in a saucepan. Place over a medium heat and cook for 4-5 mins, until the released juices thicken and the strawberries soften. Set aside to cool. Once completely cooled, top the set panna cottas with the strawberry mixture. Chill until ready to serve."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "gelatine").id,
                            quantity: 3,
                            unit: "leaf" },
                          { ingredient_id: Ingredient.find_by(name: "double cream").id,
                            quantity: 450,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "whole milk").id,
                            quantity: 200,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "white caster sugar").id,
                            quantity: 150,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "vanilla pod").id,
                            quantity: 1,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "strawberry").id,
                            quantity: 400,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "cornflour").id,
                            quantity: 1.5,
                            unit: "tsp" } ],
    keywords: ["dessert"]
  },
  {
    recipe: { name: "Coq au vin",
              servings: 6,
              xp: 400,
              difficulty: "hard",
              prep_time: 105,
              country_id: Country.find_by(name: "france").id,
              url: "https://couteaux-et-tirebouchons.com/wp-content/uploads/2017/10/coq-au-vin-recette-gastronomique.jpg"
             },
    steps: ["Heat 1 tbsp olive oil in a large, heavy-based saucepan or flameproof dish. Tip in 3 trimmed and chopped smoked back bacon rashers and fry until crisp. Remove and drain on kitchen paper.",
            "Add 12 peeled shallots to the pan and fry, stirring or shaking the pan often, for 5-8 mins until well browned all over. Remove and set aside with the bacon.",
            "Take 2 chicken legs, 4 chicken thighs and 2 boneless chicken breasts, all with skin removed and pat dry with kitchen paper.",
            "Pour ½ tbsp olive oil into the pan, then fry half the chicken pieces, turning regularly, for 5-8 mins until well browned. Remove, then repeat with the remaining chicken. Remove and set aside.",
            "Scatter in 3 finely chopped garlic cloves and fry briefly, then, with the heat medium-high, pour in 3 tbsp brandy or Cognac, stirring the bottom of the pan to deglaze. The alcohol should sizzle and start to evaporate so there is not much left.",
            "Return the chicken legs and thighs to the pan along with any juices, then pour in a little of 600ml red wine, stirring the bottom of the pan again.",
            "Stir in the rest of the wine, 150ml good-quality chicken stock and 2 tsp tomato purée. Drop in 3 thyme sprigs, 2 rosemary sprigs and 2 bay leaves to make a bouquet garni, season with pepper and a pinch of salt, then return the bacon and shallots to the pan.",
            "Cover, lower the heat to a gentle simmer, add the chicken breasts and cook for 50 mins - 1hr.",
            "Just before ready to serve, heat 1 ½ tbsp olive oil in a large non-stick frying pan. Add 250g chestnut mushrooms, halved if large, and fry over a high heat for a few mins until golden. Remove and keep warm.",
            "Lift the chicken, shallots and bacon from the pan and transfer to a warmed serving dish. Remove the bouquet garni.",
            "To make the thickener, mix 2 tbsp plain flour, 1 ½ tsp olive oil and 1 tsp softened butter in a small bowl using the back of a teaspoon.",
            "Bring the wine mixture to a gentle boil, then gradually drop in small pieces of the thickener, whisking each piece in using a wire whisk. Simmer for 1-2 mins.",
            "Scatter the mushrooms over the chicken, then pour over the wine sauce. Garnish with a handful of chopped flat-leaf parsley."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "olive oil").id,
                            quantity: 1.5,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "bacon").id,
                            quantity: 100,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "shallot").id,
                            quantity: 12,
                            unit: "small" },
                          { ingredient_id: Ingredient.find_by(name: "chicken leg").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "chicken thigh").id,
                            quantity: 4,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "chicken breast").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "garlic clove").id,
                            quantity: 3,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "cognac").id,
                            quantity: 3,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "red wine").id,
                            quantity: 600,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "chicken stock").id,
                            quantity: 150,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "tomato purée").id,
                            quantity: 2,
                            unit: "tsp" },
                          { ingredient_id: Ingredient.find_by(name: "thyme sprig").id,
                            quantity: 3,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "rosemary sprig").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "bay leaf").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "parsley").id,
                            quantity: 1,
                            unit: "handful" },
                          { ingredient_id: Ingredient.find_by(name: "chestnut mushroom").id,
                            quantity: 250,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "plain flour").id,
                            quantity: 2,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "softened butter").id,
                            quantity: 1,
                            unit: "tsp" } ],
    keywords: ["chicken", "pork"]
  },
  {
    recipe: { name: "Ratatouille",
              servings: 6,
              xp: 300,
              difficulty: "medium",
              prep_time: 140,
              country_id: Country.find_by(name: "france").id,
              url: "https://foodhub.scene7.com/is/image/woolworthsltdprod/fi-2306-ratatouille:Mobile-1300x1150" },
    steps: ["Heat the grill to high. Lay the pepper quarters skin-side up on a baking tray and grill until the skins are black and charred. Tip into a bowl, cover and leave to cool. Peel the charred skin off the peppers, then cut into strips, and toss back in the juices collected in the bowl. Tie the basil stalks and thyme sprig together using kitchen string and set aside.",
            "Heat the oven to 160C/140C fan/ gas 4. Heat the olive oil in a flameproof casserole dish and fry the courgettes and aubergine for 15 mins until nicely browned. You may need to do this in batches, adding more oil to the pan as needed so the pan is never dry.",
            "Scoop the veg out of the pan and set aside. Add a drizzle more oil, tip in the onion and cook for another 15 mins until softened and starting to brown. Add the garlic and leave to sizzle for a moment. Scatter with sugar, then leave for a minute to caramelise and splash in the vinegar. Stir in the cooked vegetables along with the pepper juice, season generously, pour over the cans of tomatoes and bring everything to a simmer.",
            "Nestle in the herbs, cover the dish and transfer to the oven for 1 hr. Remove the lid and give it another 30 mins until everything is cooked down and jammy. Leave the ratatouille to cool until just warm, then stir through most of the basil leaves and the extra virgin olive oil. Scatter with the rest of the basil and serve with griddled sourdough."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "red peppers").id,
                            quantity: 3,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "basil").id,
                            quantity: 1,
                            unit: "handful" },
                          { ingredient_id: Ingredient.find_by(name: "thyme sprig").id,
                            quantity: 1,
                            unit: "large" },
                          { ingredient_id: Ingredient.find_by(name: "olive oil").id,
                            quantity: 2,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "courgette").id,
                            quantity: 2,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "aubergine").id,
                            quantity: 1,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "onion").id,
                            quantity: 1,
                            unit: "large" },
                          { ingredient_id: Ingredient.find_by(name: "garlic clove").id,
                            quantity: 4,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "red wine vinegar").id,
                            quantity: 1,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "cherry tomato").id,
                            quantity: 800,
                            unit: "g" } ],
    keywords: ["vegan", "vegetarian"]
  },
  {
    recipe: { name: "French onion soup",
              servings: 4,
              xp: 200,
              difficulty: "easy",
              prep_time: 70,
              country_id: Country.find_by(name: "france").id,
              url: "https://www.onceuponachef.com/images/2019/02/french-onion-soup-1-760x970.jpg"
            },
    steps: ["Melt the butter with the olive oil in a large heavy-based pan. Add the onions and fry with the lid on for 10 mins until soft.",
            "Sprinkle in the sugar and cook for 20 mins more, stirring frequently, until caramelised. The onions should be really golden, full of flavour and soft when pinched between your fingers. Take care towards the end to ensure that they don’t burn.",
            "Add the garlic cloves for the final few minutes of the onions’ cooking time, then sprinkle in the plain flour and stir well.",
            "Increase the heat and keep stirring as you gradually add the wine, followed by the vegetable stock. Cover and simmer for 15-20 mins.",
            "To serve, turn on the grill, and toast the bread. Ladle the soup into heatproof bowls.",
            "Put a slice or two of toast on top of the bowls of soup, and pile on the gruyère. Grill until melted. Alternatively, you can cook the toasts under the grill, then add them to the soup to serve."],
    recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "butter").id,
                            quantity: 50,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "olive oil").id,
                            quantity: 1,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "onion").id,
                            quantity: 1000,
                            unit: "g" },
                          { ingredient_id: Ingredient.find_by(name: "sugar").id,
                            quantity: 1,
                            unit: "tsp" },
                          { ingredient_id: Ingredient.find_by(name: "garlic clove").id,
                            quantity: 4,
                            unit: "" },
                          { ingredient_id: Ingredient.find_by(name: "plain flour").id,
                            quantity: 2,
                            unit: "tbsp" },
                          { ingredient_id: Ingredient.find_by(name: "dry white wine").id,
                            quantity: 250,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "vegetable stock").id,
                            quantity: 1300,
                            unit: "ml" },
                          { ingredient_id: Ingredient.find_by(name: "baguette").id,
                            quantity: 4,
                            unit: "slice" },
                          { ingredient_id: Ingredient.find_by(name: "gruyère").id,
                            quantity: 140,
                            unit: "g" } ],
    keywords: ["vegetarian"]
  }
]

#####

p "Creating recipes..."
recipes.each do |recipe|
  file = URI.parse(recipe[:recipe][:url]).open

  new_recipe = Recipe.new(name: recipe[:recipe][:name],
                          servings: recipe[:recipe][:servings],
                          xp: recipe[:recipe][:xp],
                          difficulty: recipe[:recipe][:difficulty],
                          prep_time: recipe[:recipe][:prep_time],
                          country_id: recipe[:recipe][:country_id])
  new_recipe.photo.attach(io: file, filename: "#{recipe[:recipe][:name].delete(' ').downcase}.jpg", content_type: "image/jpg" )

  recipe[:keywords].each do |keyword|
    new_recipe.keyword_list.add(keyword)
  end

  new_recipe.save

  recipe[:steps].each_with_index do |step, index|
    Step.create(order_number: index + 1,
                instruction: step,
                recipe_id: new_recipe.id)
  end

  recipe[:recipe_ingredients].each do |ri|
    RecipeIngredient.create(quantity: ri[:quantity],
                            unit: ri[:unit],
                            ingredient_id: ri[:ingredient_id],
                            recipe_id: new_recipe.id)
  end
end

p "#{Recipe.all.length} Recipes created!"

# TEMPLATE RECETTE
# Pour tout commenter/décommenter, selectionner les lignes puis appuyer sur "ctrl" et "/"
#
# {
#   recipe: { name: "",
#             servings: ,
#             xp: ,
#             difficulty: "",
#             prep_time: ,
#             country_id: Country.find_by(name: "").id },
#   steps: [],
#   recipe_ingredients: [ { ingredient_id: Ingredient.find_by(name: "").id,
#                           quantity: ,
#                           unit: "" } ],
#   keywords: []
# }
