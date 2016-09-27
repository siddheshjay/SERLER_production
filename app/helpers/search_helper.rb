module SearchHelper
  def sort_link(title, column)
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, "#", :"data-sort" => column, :"data-direction" => direction, :class => css_class
  end
end
