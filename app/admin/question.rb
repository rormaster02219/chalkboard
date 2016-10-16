ActiveAdmin.register Question do

  permit_params :question, :choice_a,:choice_b,:choice_c,:choice_d,:answer,:module_test,:subject,:number,:module_test_name,:timer,:solution,:image, :image_solution, :choice_a_image, :choice_b_image, :choice_c_image, :choice_d_image
  
  form do |f|
    f.inputs  do
      f.input :question
      f.input :image, as: :file
      f.input :choice_a
      f.input :choice_a_image, as: :file
      f.input :choice_b
      f.input :choice_b_image, as: :file
      f.input :choice_c
      f.input :choice_c_image, as: :file
      f.input :choice_d
      f.input :choice_d_image, as: :file
      f.input :answer
      f.input :module_test
      f.input :subject
      f.input :number
      f.input :module_test_name
      f.input :timer
      f.input :solution
      f.input :image_solution, as: :file
    end            
    f.actions
    end  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
