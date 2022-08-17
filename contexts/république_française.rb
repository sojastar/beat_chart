DICTIONARY  = {
  ### Places :
  basement:                 { en: 'basement',                 fr: 'cave' },
  underground_parking_lot:  { en: 'underground parking lot',  fr: 'parking sous-terrain' },
  roundabout:               { en: 'roundabout',               fr: 'rond-point' },
  field:                    { en: 'field',                    fr: 'champ' },
  forest:                   { en: 'forest',                   fr: 'forêt' },
  farming_warehouse:        { en: 'farming warehouse',        fr: 'hangar agricole' },
  service_area:             { en: 'service area',             fr: "aire d'autoroute" },
  supermarket_parking_lot:  { en: 'supermarket parking lot',  fr: 'parking de supermarché' },
  suburbian_house:          { en: 'suburbian house',          fr: 'pavillon' },
  pub:                      { en: 'pub',                      fr: 'café' },
  greasy_spoon:             { en: 'greasy spoon',             fr: 'cantine' },
  restaurant:               { en: 'restaurant',               fr: 'restaurant' },
  posh_restaurant:          { en: 'posh restaurant',          fr: 'restaurant hupé' },
  hospital:                 { en: 'hospital',                 fr: 'hôpital' },
  museum:                   { en: 'museum',                   fr: 'musée' },
  suburb_train:             { en: 'suburb train',             fr: 'RER' },
  subway:                   { en: 'subway',                   fr: 'métro' },
  kebab_restaurant:         { en: 'kebab restaurant',         fr: 'kebab' },
  warehouse:                { en: 'warehouse',                fr: 'entrepot' },
  lac:                      { en: 'lac',                      fr: 'lac' },
  mosque:                   { en: 'mosque',                   fr: 'mosquée' },
  plush_building:           { en: 'plush building',           fr: 'immeuble cossu' },
  presidential_office:      { en: 'presidential office',      fr: 'bureau présidentiel' },
  TV_studio:                { en: 'TV studio',                fr: 'plateau TV' },

  ### Ailements :
  dark:     { en: 'dark',     fr: 'sombre' },
  decrepit: { en: 'decrepit', fr: 'délabré' },
  smoky:    { en: 'smoky',    fr: 'enfumé' },
  on_fire:  { en: 'on fire',  fr: 'en feu' },
  foggy:    { en: 'foggy',    fr: 'brouillardeux' },
  cloudy:   { en: 'cloudy',   fr: 'nuageux' },
  rainy:    { en: 'rainy',    fr: 'pluvieux' },
  stormy:   { en: 'stormy',   fr: 'orageux' },
  flooded:  { en: 'flooded',  fr: 'inondé' },

  ### Variants :
  big_m:    { en: 'big',      fr: 'grand' },
  small_m:  { en: 'small',    fr: 'petit' },
  big_f:    { en: 'big',      fr: 'grande' },
  small_f:  { en: 'small',    fr: 'petite' }
}


PLACES  = [
  { type: :basement,                ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :roundabout,              ailements: [:on_fire, :foggy, :rainy],    variants: [] },
  { type: :field,                   ailements: [:on_fire, :flooded, :foggy,
                                                :cloudy, :rainy, :stormy],    variants: [] },
  { type: :forest,                  ailements: [:on_fire, :foggy, :rainy,
                                                :stormy],                     variants: [] },
  { type: :kebab_restaurant,        ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :suburb_train,            ailements: [:smoky, :on_fire],            variants: [] },
  { type: :farming_warehouse,       ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :service_area,            ailements: [:on_fire, :foggy, :cloudy,
                                                :rainy, :stormy],             variants: [] },
  { type: :supermarket_parking_lot, ailements: [:on_fire, :foggy, :cloudy,
                                                :rainy, :stormy],             variants: [] },
  { type: :underground_parking_lot, ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :suburbian_house,         ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :pub,                     ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :greasy_spoon,            ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :restaurant,              ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :posh_restaurant,         ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :hospital,                ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :museum,                  ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :subway,                  ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :warehouse,               ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :lac,                     ailements: [:foggy, :cloudy, :rainy,
                                                :stormy],                     variants: [] },
  { type: :mosque,                  ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :plush_building,          ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :presidential_office,     ailements: [:smoky, :on_fire, :flooded],  variants: [] },
  { type: :TV_studio,               ailements: [:smoky, :on_fire, :flooded],  variants: [] }
]


#CHARACTERS = { caillera: { alignment: -0.5,   # -1: hostile, 0:neutral, 1: friendly
#                            bound: true,
#                            motivation: :wealth, # wealth, power, knowledge, revenge, suicidal
#                            skills: :persuasion, # persuasion, strength, wealth
                          
