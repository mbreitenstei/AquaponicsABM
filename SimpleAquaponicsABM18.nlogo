;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; variable setup ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

breed[ fov a-fov ]
breed[ fish a-fish ]
breed[ plants plant ]
breed[ feed piece-of-feed ]
breed[ nutrients nutrient ]

globals [
  GHGs
  lighting-GHGs
  feeding-GHGs
  heating-GHGs
  pumping-GHGs
  total-lighting-GHG-emissions
  total-heating-GHG-emissions
  total-feeding-GHG-emissions
  total-pumping-GHG-emissions
  total-GHG-emissions
  total-harvested-fish
  total-harvested-plants
  fish-death ]

patches-own [type-of-patch]

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; setup procedure ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

to setup
  clear-all
  ;; PATCH SETUP ;;
  ask patches [
  set type-of-patch "water"
    if pxcor < max-pxcor - 5 [
      set pcolor blue + 0.5]
  set type-of-patch "air"
    if pxcor >  max-pxcor - 5 [
      set pcolor white ] ]
  ;; FISH SETUP ;;
  set-default-shape fov "circle"
  create-fish number-of-fish [
    if fish-type = "Tilapia" [
      set shape "fish 2"
      set color grey
      set size 0.5 ]
    if fish-type = "Walleye" [
      set shape "fish"
      set color green
      set size 0.5 ]
    if fish-type = "Salmon" or fish-type = "Default" [
      set shape "salmon"
      set color grey
      set size 1 ]
    if fish-type = "Catfish" [
      set shape "catfish"
      set color grey
      set size 1 ]
    set xcor 8 - random 23
    set ycor random-pycor ]
  ;; PLANT SETUP ;;
  ask patches with [(14) > pxcor and pxcor > (10) and pycor < (1)]
    [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ]
  ask patches with [(14) > pxcor and pxcor > (10) and pycor > (0)]
    [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ]
  if number-of-plant-columns = 4 [
  ask patches with [pxcor = 14 and pycor > (0)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  if number-of-plant-columns = 4 [
  ask patches with [pxcor = 14 and pycor < (1)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  if number-of-plant-columns = 5 [
  ask patches with [pxcor = 14 and pycor > (0)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  if number-of-plant-columns = 5 [
  ask patches with [pxcor = 14 and pycor < (1)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  if number-of-plant-columns = 5 [
  ask patches with [pxcor < (11) and pxcor > (9) and pycor < (1)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  if number-of-plant-columns = 5 [
  ask patches with [pxcor > (9) and pxcor < (11) and pycor > (0)]
   [ sprout-plants 1 [
      if plant-type = "Basil" [
        set shape "flower budding"
        set color green - 1
        set size 0.5 ]
      if plant-type = "Lettuce" or plant-type = "Default" [
        set shape "plant small"
        set color green + 1
        set size 0.25 ]
      if plant-type = "Tomato" [
        set shape "plant medium"
        set color green
        set size 0.25 ]
      if plant-type = "Pepper" [
        set shape "plant"
        set color green - 1
        set size 0.25 ] ] ] ]
  ;; FEED SETUP ;;
  create-feed number-of-fish [
    set shape "circle"
    set color brown + 1.5
    set size 0.15
    set xcor 8 - random 23
    set ycor random-pycor ]
  create-feed number-of-fish [
    set shape "circle"
    set color brown + 1.5
    set size 0.15
    set xcor 8 - random 23
    set ycor random-pycor ]
    create-feed number-of-fish [
    set shape "circle"
    set color brown + 1.5
    set size 0.15
    set xcor 8 - random 23
      set ycor random-pycor ]
    if fish-type = "Tilapia" [
      set feeding-GHGs 0.0004152 ]
    if fish-type = "Walleye" [
      set feeding-GHGs 0.001313 ]
    if fish-type = "Salmon" [
      set feeding-GHGs 0.01383 ]
    if fish-type = "Catfish" [
      set feeding-GHGs 0.007620 ]
    set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish * 3)
  ;; PUMP EMISSIONS SETUP ;;
  if climate = "Humid Continental" [
    set pumping-GHGs 0.0060948 ]
  if climate = "Temperate" [
    set pumping-GHGs 0.0060948 ]
  if climate = "Tropical" [
    set pumping-GHGs 0.0060948 ]
  if climate = "Humid Subtropical" [
    set pumping-GHGs 0.0060948 ]
  ;;; LIGHTING EMISSIONS SETUP ;;;
  ;;; Three & Four Columns ;;;
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.010299]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.048921]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.02967]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.05506]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.01700]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0.02267]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.08372]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.016744]

  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.02685]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.022089]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.05581]

  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.01030]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.04892]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.02967]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Temperate" and season = "Winter"  [ set lighting-GHGs 0.05506]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.01700]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0.02267]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.08372]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.16744]

  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.054439]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0.041197]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0.031265]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.093061]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.095611]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.120997]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0.04534]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0.03967]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.06234]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Tropical" and season = "Winter"  [ set lighting-GHGs 0.06801]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0.2233]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0.1674]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.30697]
  if number-of-plant-columns = 3 or number-of-plant-columns = 4 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.3907]

  ;;;Five Columns;;;
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.01545]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.07338]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.04451]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.08259]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.02550]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0.03401]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.1256]
  if number-of-plant-columns = 5 and plant-type = "Basil" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.2512]

  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.04028]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.03313]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0 ]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Lettuce" or plant-type = "Default" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.08372]

  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.01545]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.07338]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.04451]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Temperate" and season = "Winter"  [ set lighting-GHGs 0.08259]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.02550]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Tropical" and season = "Winter"  [set lighting-GHGs 0.03401]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.1256]
  if number-of-plant-columns = 5 and plant-type = "Tomato" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.2512]

  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Spring"  [set lighting-GHGs 0.08166]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Summer"  [set lighting-GHGs 0.06180]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Fall"  [set lighting-GHGs 0.04690]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Continental" and season = "Winter"  [set lighting-GHGs 0.1396]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Temperate" and season = "Spring"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Temperate" and season = "Summer"  [set lighting-GHGs 0]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Temperate" and season = "Fall"  [set lighting-GHGs 0.1434]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Temperate" and season = "Winter"  [set lighting-GHGs 0.1815]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Tropical" and season = "Spring"  [set lighting-GHGs 0.06801]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Tropical" and season = "Summer"  [set lighting-GHGs 0.05951]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Tropical" and season = "Fall"  [set lighting-GHGs 0.09351]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Tropical" and season = "Winter"  [ set lighting-GHGs 0.1020]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Spring"  [set lighting-GHGs 0.3349]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Summer"  [set lighting-GHGs 0.2512]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Fall"  [set lighting-GHGs 0.4604]
  if number-of-plant-columns = 5 and plant-type = "Pepper" and climate = "Humid Subtropical" and season = "Winter"  [set lighting-GHGs 0.5860]

  ;;; HEATING EMISSIONS SETUP ;;;
  if fish-type = "Tilapia" and climate = "Humid Continental" and season = "Spring" [set heating-GHGs 5.7451]
  if fish-type = "Tilapia" and climate = "Humid Continental" and season = "Summer" [set heating-GHGs 1.7258]
  if fish-type = "Tilapia" and climate = "Humid Continental" and season = "Fall" [set heating-GHGs 5.2001]
  if fish-type = "Tilapia" and climate = "Humid Continental" and season = "Winter" [set heating-GHGs 9.7815]
  if fish-type = "Tilapia" and climate = "Temperate" and season = "Spring" [set heating-GHGs 4.2918]
  if fish-type = "Tilapia" and climate = "Temperate" and season = "Summer" [set heating-GHGs 1.0219]
  if fish-type = "Tilapia" and climate = "Temperate" and season = "Fall" [set heating-GHGs 3.5765]
  if fish-type = "Tilapia" and climate = "Temperate" and season = "Winter" [set heating-GHGs 6.0290]
  if fish-type = "Tilapia" and climate = "Tropical" and season = "Spring" [set heating-GHGs 0.5734]
  if fish-type = "Tilapia" and climate = "Tropical" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Tilapia" and climate = "Tropical" and season = "Fall" [set heating-GHGs 0.11922]
  if fish-type = "Tilapia" and climate = "Tropical" and season = "Winter" [set heating-GHGs 1.6747]
  if fish-type = "Tilapia" and climate = "Humid Subtropical" and season = "Spring" [set heating-GHGs 3.9456]
  if fish-type = "Tilapia" and climate = "Humid Subtropical" and season = "Summer" [set heating-GHGs 0.62453]
  if fish-type = "Tilapia" and climate = "Humid Subtropical" and season = "Fall" [set heating-GHGs 2.7250]
  if fish-type = "Tilapia" and climate = "Humid Subtropical" and season = "Winter" [set heating-GHGs 6.2448]

  if fish-type = "Walleye" and climate = "Humid Continental" and season = "Spring" [set heating-GHGs 4.8936]
  if fish-type = "Walleye" and climate = "Humid Continental" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Humid Continental" and season = "Fall" [set heating-GHGs 4.3486]
  if fish-type = "Walleye" and climate = "Humid Continental" and season = "Winter" [set heating-GHGs 8.9299]
  if fish-type = "Walleye" and climate = "Temperate" and season = "Spring" [set heating-GHGs 3.4403]
  if fish-type = "Walleye" and climate = "Temperate" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Temperate" and season = "Fall" [set heating-GHGs 2.7250]
  if fish-type = "Walleye" and climate = "Temperate" and season = "Winter" [set heating-GHGs 5.1774]
  if fish-type = "Walleye" and climate = "Tropical" and season = "Spring" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Tropical" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Tropical" and season = "Fall" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Tropical" and season = "Winter" [set heating-GHGs 0.82316]
  if fish-type = "Walleye" and climate = "Humid Subtropical" and season = "Spring" [set heating-GHGs 3.0940]
  if fish-type = "Walleye" and climate = "Humid Subtropical" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Walleye" and climate = "Humid Subtropical" and season = "Fall" [set heating-GHGs 1.8734]
  if fish-type = "Walleye" and climate = "Humid Subtropical" and season = "Winter" [set heating-GHGs 5.3932]

  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Continental" and season = "Spring"  [set heating-GHGs 2.3389]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Continental" and season = "Summer"  [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Continental" and season = "Fall"  [set heating-GHGs 1.7939]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Continental" and season = "Winter"  [set heating-GHGs 6.3753]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Temperate" and season = "Spring" [set heating-GHGs 0.88561]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Temperate" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Temperate" and season = "Fall" [set heating-GHGs 0.17031]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Temperate" and season = "Winter" [set heating-GHGs 2.6228]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Tropical" and season = "Spring" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Tropical" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Tropical" and season = "Fall" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Tropical" and season = "Winter" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Subtropical" and season = "Spring" [set heating-GHGs 0.53937]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Subtropical" and season = "Summer" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Subtropical" and season = "Fall" [set heating-GHGs 0]
  if fish-type = "Salmon" or fish-type = "Default" and climate = "Humid Subtropical" and season = "Winter" [set heating-GHGs 2.8386]

  if fish-type = "Catfish" and climate = "Humid Continental" and season = "Spring"  [set heating-GHGs 6.5967]
  if fish-type = "Catfish" and climate = "Humid Continental" and season = "Summer"  [set heating-GHGs 2.5774]
  if fish-type = "Catfish" and climate = "Humid Continental" and season = "Fall"  [set heating-GHGs 6.0517]
  if fish-type = "Catfish" and climate = "Humid Continental" and season = "Winter"  [set heating-GHGs 10.6330]
  if fish-type = "Catfish" and climate = "Temperate" and season = "Spring" [set heating-GHGs 5.1434]
  if fish-type = "Catfish" and climate = "Temperate" and season = "Summer" [set heating-GHGs 1.8734]
  if fish-type = "Catfish" and climate = "Temperate" and season = "Fall" [set heating-GHGs 4.4281]
  if fish-type = "Catfish" and climate = "Temperate" and season = "Winter" [set heating-GHGs 6.8805]
  if fish-type = "Catfish" and climate = "Tropical" and season = "Spring" [set heating-GHGs 1.4249]
  if fish-type = "Catfish" and climate = "Tropical" and season = "Summer" [set heating-GHGs 0.22140]
  if fish-type = "Catfish" and climate = "Tropical" and season = "Fall" [set heating-GHGs 0.97077]
  if fish-type = "Catfish" and climate = "Tropical" and season = "Winter" [set heating-GHGs 2.5263]
  if fish-type = "Catfish" and climate = "Humid Subtropical" and season = "Spring" [set heating-GHGs 4.7971]
  if fish-type = "Catfish" and climate = "Humid Subtropical" and season = "Summer" [set heating-GHGs 1.4761]
  if fish-type = "Catfish" and climate = "Humid Subtropical" and season = "Fall" [set heating-GHGs 3.5765]
  if fish-type = "Catfish" and climate = "Humid Subtropical" and season = "Winter" [set heating-GHGs 7.0963]
  reset-ticks
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; go procedure ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to go
;;; RELEASE MORE FEED ;;;
  if count fish = 0 [stop]
  ask feed [
    if count feed <= 6 [
      hatch-feed number-of-fish [
      set xcor max-pxcor - 10
      set ycor random max-pycor - random 18
      set heading random 360]
      set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish)
      hatch-feed number-of-fish [
      set xcor max-pxcor - 16
      set ycor random max-pycor - random 12
      set heading random 360 ]
      set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish)
      hatch-feed number-of-fish [
      set xcor max-pxcor - 24
      set ycor random max-pycor - random 22
      set heading random 360 ]
     set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish) ]
   if count feed <= 50 and fish-type = "Salmon" or fish-type = "Default" [
      hatch-feed number-of-fish [
      set xcor max-pxcor - 10
      set ycor random max-pycor - random 18
      set heading random 360]
      set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish)
      hatch-feed number-of-fish [
      set xcor max-pxcor - 16
      set ycor random max-pycor - random 12
      set heading random 360 ]
      set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish)
      hatch-feed number-of-fish [
      set xcor max-pxcor - 24
      set ycor random max-pycor - random 22
      set heading random 360 ]
     set total-feeding-GHG-emissions total-feeding-GHG-emissions + (feeding-GHGs * number-of-fish) ] ]
;;; FEED MOVES & AVOIDS LEFT & RIGHT EDGES ;;;
  ask feed [
    ifelse not can-move? 0.5
    [set heading 90 fd 1 ]
    [ifelse pcolor = black or pcolor = white
      [set heading 270 fd 2 ]
      [lt random 70
       rt random 70
       fd random-float 4 ] ] ]
;;; FISH MOVES & AVOIDS LEFT & RIGHT EDGES ;;;
  ask fish [
   ifelse not can-move? 0.5
     [set heading 90 fd 1.5 ]
     [ifelse pcolor = black or pcolor = white
       [set heading 270 fd 2 ]
       [lt random 50
        rt random 50
        fd random-float 0.25 ] ] ]
;;; FISH EAT & FEED TURNS TO NUTRIENTS ;;;
  ask fish [
   let prey one-of feed-here
    if prey != nobody [
      ask prey [
        set breed nutrients
        set shape "circle"
        set size 0.15
        set color brown - 2
        set heading 90 ] ] ]
;;; FISH GROW ;;;
  ask fish [
    if size < 2.5 and fish-type = "Tilapia" and any? fish and any? feed and distance one-of fish <= 2.5 and distance one-of feed <= 2.5
    [ set size size + 0.2 ]
    if size < 2.5 and fish-type = "Walleye" and any? fish and any? feed and distance one-of fish <= 2.5 and distance one-of feed <= 2.5
    [ set size size + 0.2 ]
    if size < 3 and fish-type = "Salmon" or fish-type = "Default" and any? fish and any? feed and distance one-of fish <= 2.5 and distance one-of feed <= 2.5
    [ set size size + 0.2 ]
    if size < 3 and fish-type = "Catfish" and any? fish and any? feed and distance one-of fish <= 2.5 and distance one-of feed <= 2.5
    [ set size size + 0.2 ] ]
;;; NUTRIENTS MOVES ;;;
  ask nutrients [
   ifelse not can-move? 0.75
    [ set heading 90 fd random-float 5 ]
    [ rt random 90
      lt random 90
      fd random-float 10 ]
     if not can-move? 0.75
    [set heading 270 fd 4]
     if not can-move? 0.25
    [die] ]
;;; FISH MORTALITY ;;;
  ask fish [
    if size <= 0.5 and ticks = 7300 ;; or ticks = 8000 or ticks =  12000 or ticks = 16000 or ticks = 20000 ;;
    [ set fish-death fish-death + 1
      die] ]
;;; HARVEST FISH ;;;
  ask fish [
    ifelse
    (Restock? = "on") [
    if size >= 2.5 and fish-type = "Tilapia"
    [ set size 0.5
      set total-harvested-fish total-harvested-fish + 1 ]
    if size >= 2.5 and fish-type = "Walleye"
    [ set size 0.5
      set total-harvested-fish total-harvested-fish + 1 ]
    if size >= 3 and fish-type = "Salmon"
    [ set size 1
      set total-harvested-fish total-harvested-fish + 1 ]
     if size >= 3 and fish-type = "Catfish"
    [ set size 1
        set total-harvested-fish total-harvested-fish + 1 ] ]
    [ if size >= 2.5 and fish-type = "Tilapia"
    [ set total-harvested-fish total-harvested-fish + 1
        die]
    if size >= 2.5 and fish-type = "Walleye"
    [ set total-harvested-fish total-harvested-fish + 1
        die ]
    if size >= 3 and fish-type = "Salmon" or fish-type = "Default"
    [ set total-harvested-fish total-harvested-fish + 1
     die ]
     if size >= 3 and fish-type = "Catfish"
    [ set total-harvested-fish total-harvested-fish + 1
        die ] ] ]
;;; PLANTS EAT ;;;
  ask plants [
   let fertilizer one-of nutrients-here
    if fertilizer != nobody [
      ask fertilizer [die] ] ]
;;; PLANTS GROW ;;;
  ask plants [
    if size < 2 and plant-type = "Basil"
    [ if any? plants and any? nutrients [
      if distance one-of plants <= 2 and distance one-of nutrients <= 2 [
        set size size + 0.35 ] ] ]
    if size < 2.5 and plant-type = "Lettuce" or plant-type = "Default"
    [ if any? plants and any? nutrients [
      if distance one-of plants <= 2 and distance one-of nutrients <= 2 [
        set size size + 0.25 ] ] ]
    if size < 2.5 and plant-type = "Tomato"
    [ if any? plants and any? nutrients [
      if distance one-of plants <= 2 and distance one-of nutrients <= 2 [
        set size size + 0.25 ] ] ]
    if size < 2.5 and plant-type = "Pepper"
    [ if any? plants and any? nutrients [
      if distance one-of plants <= 2 and distance one-of nutrients <= 2 [
        set size size + 0.25 ] ] ] ]
;;; HARVEST PLANTS ;;;
  ask plants [
    if size >= 2 and plant-type = "Basil"
    [ set size 0.5
      set total-harvested-plants total-harvested-plants + 1 ]
     if size >= 2.5 and plant-type = "Lettuce" or plant-type = "Default"
    [ set size 0.25
      set total-harvested-plants total-harvested-plants + 1 ]
     if size >= 2.5 and plant-type = "Tomato"
    [ set size 0.25
      set total-harvested-plants total-harvested-plants + 1 ]
     if size >= 2.5 and plant-type = "Pepper"
    [ set size 0.25
      set total-harvested-plants total-harvested-plants + 1 ] ]
;;; REPORTING GHG EMISSIONS ;;;
 set total-lighting-GHG-emissions total-lighting-GHG-emissions + lighting-GHGs
 set total-heating-GHG-emissions total-heating-GHG-emissions + heating-GHGs
 set total-pumping-GHG-emissions total-pumping-GHG-emissions + pumping-GHGs
 tick
end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; reporters ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

to-report lighting-greenhouse-gas-emissions
  report total-lighting-GHG-emissions
end

to-report heating-greenhouse-gas-emissions
  report total-heating-GHG-emissions
end

to-report feeding-greenhouse-gas-emissions
  report total-feeding-GHG-emissions
end

to-report pumping-greenhouse-gas-emissions
  report total-pumping-GHG-emissions
end

to-report greenhouse-gas-emissions
  report total-heating-GHG-emissions + total-lighting-GHG-emissions + total-feeding-GHG-emissions + total-pumping-GHG-emissions
end

to-report harvested-fish
  report total-harvested-fish
end

to-report harvested-plants
  report total-harvested-plants
end

to-report fish-deaths
  report fish-death
end
@#$#@#$#@
GRAPHICS-WINDOW
235
10
823
599
-1
-1
20.0
1
10
1
1
1
0
0
1
1
-14
14
-14
14
0
0
1
ticks
30.0

SLIDER
10
294
215
327
number-of-fish
number-of-fish
100
500
100.0
200
1
fish
HORIZONTAL

BUTTON
19
38
115
72
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
123
38
216
72
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
828
10
1310
304
Total & Heating Greenhouse Gas Emissions
Time (ticks)
GHG Emissions (kg CO2 eq)
0.0
250.0
0.0
100.0
true
true
"" ""
PENS
"Total" 1.0 0 -2674135 true "" "plot greenhouse-gas-emissions"
"Heating" 1.0 0 -13345367 true "" "plot heating-greenhouse-gas-emissions"
"Feeding" 1.0 0 -10899396 true "" "plot feeding-greenhouse-gas-emissions"

CHOOSER
13
81
216
126
Season
Season
"Spring" "Summer" "Fall" "Winter"
3

CHOOSER
11
188
218
233
fish-type
fish-type
"Default" "Tilapia" "Walleye" "Salmon" "Catfish"
1

CHOOSER
11
241
217
286
plant-type
plant-type
"Default" "Basil" "Lettuce" "Tomato" "Pepper"
1

CHOOSER
12
135
217
180
Climate
Climate
"Humid Continental" "Temperate" "Tropical" "Humid Subtropical"
1

PLOT
828
306
1310
602
Lighting, Feeding, & Pumping Greenhouse Gas Emissions
Time (tick)
GHG Emissions (kg CO2 eq)
0.0
250.0
0.0
25.0
true
true
"" ""
PENS
"Lighting" 1.0 0 -10141563 true "" "plot lighting-greenhouse-gas-emissions"
"Pumping" 1.0 0 -955883 true "" "plot pumping-greenhouse-gas-emissions"
"Feeding" 1.0 0 -10899396 true "" "plot feeding-greenhouse-gas-emissions"

MONITOR
122
432
214
481
Harvested Fish
harvested-fish
0
1
12

MONITOR
9
432
116
481
Harvested Plants
harvested-plants
0
1
12

MONITOR
121
377
190
426
Dead Fish
fish-deaths
0
1
12

SWITCH
8
383
113
416
Restock?
Restock?
1
1
-1000

SLIDER
10
332
216
365
number-of-plant-columns
number-of-plant-columns
3
5
3.0
1
1
columns
HORIZONTAL

@#$#@#$#@
## WHAT IS IT?

A model of a commercial aquaponics operation with various parameters

## GENERAL MODEL NOTES

Default Fish & Plant Parameters
1. Salmon
2. Lettuce

Model Assumptions
1. Operation size: commercial 
2. Assumed relative humidity: 70%
3. Timescale: 40 ticks per day, 1.667 ticks/hr
4. All fish in the operation are held in the same tank (in the real world, most fish species would be separated by age/weight, sex, and for breeding)
5. Fish and plants are harvested in the simulation based on size
6. All season temperatures are determined using the corresponding month's averages
7. Greenhouse temperature and related greenhouse gas emissions is dependent on the fish type, climate, and season
8. Lighting duration is dependent on plant type, climate, and season
9. Heating method is dependent on climate (e.g., Japan generally utilizes electricty for their heating)
10. Water in the system is cycled through the system twice an hour and is based on the total modelled volume of the fish and plant tanks
11. Heating and electricity emissions were determined using the reference location's method of heating.


## CLIMATE & SEASON NOTES

Humid Continental (reference location - Madison, WI)
1. Spring: 34.5 F
2. Summer: 71 F
3. Fall: 49.5 F
4. Winter: 25 F

Temperate (reference location - Madrid, Spain)
1. Spring: 54.8 F
2. Summer: 74 F
3. Fall: 59 F
4. Winter: 44.6 F

Tropical (reference location - Miami, FL)
1. Spring: 75 F
2. Summer: 82.3 F
3. Fall: 78 F
4. Winter: 68.2 F

Humid Subtropical (reference location - Tokyo, Japan)
1. Spring: 56.8 F
2. Summer: 76.3 F
3. Fall: 64 F
4. Winter:43.3 F

## FISH NOTES

Greenhouse Temperature:
Tilapia: 80 F
Walleye: 75 F
Salmon: 60 F
Catfish: 70 F

Protein content of feed:
Tilapia:
Walleye:
Salmon:
Catfish:

## HOW IT WORKS

The user selects the parameters they are interested in investigating...

## HOW TO USE IT

The 'setup' button sets up the simulation, randomly placing the fish in the tank and the plants are setup in a grid. The 'go' button runs the simulation, the fish wander around the tank, eats when one comes across food patches, reproduces, and some are harvested after eight months.

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)


## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

catfish
false
0
Polygon -7500403 true true 283 153 288 149 271 146 285 135 285 135 247 119 190 107 104 117 63 129 53 131 31 121 7 125 25 144 6 168 33 163 56 150 69 154 64 164 80 161 86 156 132 160 209 164
Polygon -1 true false 207 164 157 179 158 161 176 163
Polygon -1 true false 223 114 220 101 206 95 191 91 178 96 190 107
Circle -1 true false 256 129 12
Polygon -6459832 true false 108 117 80 114 80 126
Circle -16777216 true false 258 130 6
Polygon -6459832 true false 242 142 217 139 212 144 211 149 217 154 244 149
Polygon -1 true false 129 159 106 174 59 168 69 154 84 155
Line -16777216 false 264 147 249 167
Circle -16777216 false false 255 127 14
Line -16777216 false 54 130 115 115
Line -16777216 false 117 115 188 107
Line -16777216 false 190 107 250 118
Line -16777216 false 224 113 220 103
Line -16777216 false 190 107 179 97
Line -16777216 false 181 94 190 91
Line -16777216 false 78 124 77 113
Line -16777216 false 80 114 109 116
Line -16777216 false 50 130 31 118
Line -16777216 false 32 119 6 123
Line -16777216 false 8 125 24 144
Line -16777216 false 25 144 5 166
Line -16777216 false 8 168 33 164
Line -16777216 false 34 163 55 149
Line -16777216 false 55 150 68 154
Line -16777216 false 65 154 204 164
Line -16777216 false 283 135 271 146
Line -16777216 false 269 146 285 147
Line -16777216 false 287 149 281 154
Line -16777216 false 203 164 279 153
Line -16777216 false 68 154 57 167
Line -16777216 false 58 167 105 174
Line -16777216 false 105 174 129 158
Line -16777216 false 157 161 156 182
Line -16777216 false 158 178 202 165
Line -16777216 false 243 141 217 139
Line -16777216 false 217 139 210 145
Line -16777216 false 210 146 217 153
Line -16777216 false 218 153 244 149
Line -16777216 false 243 149 242 141

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
14
Polygon -1 true false 44 131 29 107 9 91 0 120 15 150 0 180 10 207 30 197 45 166
Polygon -1 true false 141 186 118 208 97 205 78 196 56 184 80 171
Polygon -1 true false 96 101 56 109 70 117 86 124 140 113 128 97
Polygon -7500403 true false 34 134 156 109 228 111 280 126 296 144 277 162 293 159 264 182 200 192 148 188 34 164
Circle -1 true false 261 133 20
Polygon -1 true false 262 183 247 205 221 216 194 211 207 190
Polygon -1 true false 247 116 238 85 181 95 182 111
Polygon -1 true false 222 152 186 142 191 162 185 174 222 167
Circle -16777216 true true 263 138 11
Line -16777216 true 186 142 190 158
Line -16777216 true 190 158 185 175
Line -16777216 true 187 174 222 167
Line -16777216 true 186 140 223 152
Line -16777216 true 223 153 222 167
Circle -16777216 false true 259 132 22
Line -16777216 true 35 134 156 108
Line -16777216 true 35 135 35 163
Line -16777216 true 35 164 151 188
Line -16777216 true 159 108 246 116
Line -16777216 true 246 116 277 124
Line -16777216 true 280 126 294 141
Line -16777216 true 296 144 279 159
Line -16777216 true 277 160 291 158
Line -16777216 true 156 189 199 194
Line -16777216 true 198 191 263 183
Line -16777216 true 263 183 290 162
Line -16777216 true 46 131 29 105
Line -16777216 true 28 106 10 88
Line -16777216 true 9 90 -1 121
Line -16777216 true 0 123 14 150
Line -16777216 true 14 150 0 173
Line -16777216 true -1 181 8 206
Line -16777216 true 29 198 46 166
Line -16777216 true 10 207 28 199
Line -16777216 true 86 124 58 110
Line -16777216 true 56 108 124 94
Line -16777216 true 128 96 139 112
Line -16777216 true 182 110 181 95
Line -16777216 true 182 94 238 85
Line -16777216 true 238 85 247 116
Line -16777216 true 76 172 56 182
Line -16777216 true 57 184 97 206
Line -16777216 true 96 205 116 208
Line -16777216 true 118 208 140 186
Line -16777216 true 205 190 192 212
Line -16777216 true 196 211 221 217
Line -16777216 true 222 217 248 206
Line -16777216 true 249 203 263 183

fish 2
false
14
Polygon -6459832 true false 56 133 34 127 12 105 21 126 23 146 22 165 10 194 32 177 55 173
Polygon -16777216 true true 124 211 106 224 84 223 60 207 43 194 65 181
Polygon -7500403 true false 50 131 154 91 229 95 264 123 291 146 271 155 291 153 266 190 206 220 147 222 48 176
Circle -1 true false 227 121 30
Circle -16777216 true true 241 127 12
Polygon -6459832 true false 166 221 144 237 195 237 206 219
Polygon -7500403 true false 102 189 109 203
Polygon -6459832 true false 215 182 181 192 171 177 169 164 152 142 154 123 170 119 223 163
Polygon -16777216 true true 228 95 205 77 137 75 75 108 105 111 154 92
Line -16777216 true 167 118 152 125
Line -16777216 true 168 118 221 162
Line -16777216 true 221 163 214 183
Line -16777216 true 213 183 182 192
Circle -16777216 false true 227 120 31
Line -16777216 true 152 126 151 141
Line -16777216 true 150 140 169 164
Line -16777216 true 170 165 170 176
Line -16777216 true 170 176 181 193
Line -16777216 true 166 221 146 235
Line -16777216 true 142 236 195 236
Line -16777216 true 197 239 206 218
Line -16777216 true 209 218 145 222
Line -16777216 true 210 218 267 189
Line -16777216 true 50 129 48 177
Line -16777216 true 47 176 147 223
Line -16777216 true 51 130 151 91
Line -16777216 true 151 90 226 94
Line -16777216 true 230 95 290 145
Line -16777216 true 290 146 273 153
Line -16777216 true 273 154 292 153
Line -16777216 true 52 130 35 127
Line -16777216 true 34 125 14 106
Line -16777216 true 11 106 21 129
Line -16777216 true 21 129 21 165
Line -16777216 true 21 163 8 193
Line -16777216 true 10 193 32 177
Line -16777216 true 32 177 48 174

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

flower budding
false
0
Polygon -7500403 true true 163 60 139 121 150 166 150 196 120 256 135 256 165 196 161 121 176 85
Polygon -7500403 true true 159 169 189 124 219 109 249 124 204 154
Polygon -7500403 true true 159 205 129 160 84 160 54 190 114 190
Polygon -7500403 true true 144 128 132 102 101 85 64 77 78 105 111 126 145 144

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

plant medium
false
0
Rectangle -7500403 true true 135 165 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 165 120 120 150 90 180 120 165 165

plant small
false
0
Rectangle -7500403 true true 135 240 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 240 120 195 150 165 180 195 165 240

salmon
false
0
Polygon -7500403 true true 283 153 287 147 271 146 287 142 285 135 247 119 190 107 104 117 54 133 39 134 20 114 12 116 19 142 12 171 20 175 40 158 69 154 64 164 80 161 86 156 132 160 209 164
Polygon -1 true false 209 164 168 169 145 161 177 161
Polygon -16777216 true false 196 108 186 97 175 92 161 99 149 102 128 112
Circle -1 true false 256 129 12
Polygon -16777216 true false 78 125 63 118 63 130
Circle -16777216 true false 258 130 6
Polygon -16777216 true false 232 146 207 143 202 148 201 153 207 158 234 153
Polygon -1 true false 85 156 79 160 62 164 67 154 84 155
Line -16777216 false 40 134 54 133
Line -16777216 false 55 132 99 116
Line -16777216 false 105 116 195 107
Line -16777216 false 18 112 10 115
Line -16777216 false 11 117 19 144
Line -16777216 false 19 144 10 168
Line -16777216 false 10 170 18 176
Line -16777216 false 20 175 39 157
Line -16777216 false 38 157 73 153
Line -16777216 false 75 154 145 160
Line -16777216 false 146 159 208 163
Line -16777216 false 210 165 285 152
Line -16777216 false 204 164 286 155
Line -16777216 false 285 154 285 148
Line -16777216 false 283 146 273 145
Line -16777216 false 274 145 286 144
Line -16777216 false 287 143 286 137
Line -16777216 false 287 137 252 118
Line -16777216 false 254 120 195 107
Line -16777216 false 66 155 58 163
Line -16777216 false 61 165 79 162
Line -16777216 false 80 161 87 157
Circle -16777216 false false 254 128 14

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="PH_100_3C_Tilapia_Basil_Winter_TE" repetitions="1000" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="20000"/>
    <metric>harvested-plants</metric>
    <enumeratedValueSet variable="number-of-fish">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-plant-columns">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fish-type">
      <value value="&quot;Tilapia&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="plant-type">
      <value value="&quot;Basil&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Season">
      <value value="&quot;Winter&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Climate">
      <value value="&quot;Temperate&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Restock?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
  <experiment name="GHGs_100_3C_Tilapia_Basil_Winter_TE" repetitions="1000" runMetricsEveryStep="false">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="20000"/>
    <metric>greenhouse-gas-emissions</metric>
    <enumeratedValueSet variable="number-of-fish">
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="number-of-plant-columns">
      <value value="3"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="fish-type">
      <value value="&quot;Tilapia&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="plant-type">
      <value value="&quot;Basil&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Season">
      <value value="&quot;Winter&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Climate">
      <value value="&quot;Temperate&quot;"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="Restock?">
      <value value="false"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
