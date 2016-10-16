ActiveAdmin.register Attendee do

  
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
  
  permit_params :student_id, :classroom_id, :status, :subject

  form do |f|
    f.inputs  do
      f.input :student_id
      f.input :classroom_id
      f.input :status
      f.input :subject
    end
    f.actions
    end

end
