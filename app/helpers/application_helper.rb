module ApplicationHelper

  #def formatted_date(date)
  #end


  #Nicer way of displaying error messages, hiding them away from application layout in view
  def flash_messages
    flashes = ""
    flash.each do |type, value|
      flashes += content_tag(:div, value, class: flash_class(type.to_sym))
    end
    content_tag(:div, flashes.html_safe)
  end

  def flash_class(type)
    case type
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :alert then "alert alert-danger"
    end
  end


  def generate_gmap4rails_markers(objects)
    Gmap4rails.build_markers(objects) do |campaign, marker|
      object.decorate.gen_marker(marker)
    end
  end

  #Note on link_to_add_fields parameters:
  #name         => Label of button
  # f           => form object
  # association => nested_attributes e.g. reward_levels
  def link_to_add_fields(name, f, association)

    new_object  = f.object.send(association).new
    id          = new_object.object_id

    # f.fields_for :reward_levels
    fields = f.fields_for(association, new_object, child_index: id) do |rl|
      render(association.to_s.singularize + "_fields", f: rl)
    end
    link_to(name, "javascript:void(0)", class: "add_fields", data: {id: id, field: fields.gsub("\n", "")})
  end

end
