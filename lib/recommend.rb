class Recommend
  def initializers
    include BabyFace
    baby_face_for features: [:max_temp, :min_temp, :season,
                             :tops_category, :tops_color1, :tops_color2, :tops_design,
                             :jacket_category, :jacket_color1, :jacket_color2, :jacket_design,
                             :waist_category, :waist_color1, :waist_color2, :waist_design,
                             :shoes_category, :shoes_color1, :shoes_color2, :shoes_design,
                             :cap_category, :cap_color1, :cap_color2, :cap_design
                            ],
                  categories: [:sense]
    puts "ほげ"
  end
end
