module CategoriesHelper
  def get_cgry_parent_name(cgry)
    if cgry.present?
      @parent = cgry.parent
      if cgry.depth == 0
        return -1
      else
        return @parent.name
      end
    end
  end

  def nested_set_options(class_or_item, mover = nil)
    if class_or_item.is_a? Array
      items = class_or_item.reject { |e| !e.root? }
    else
      class_or_item = class_or_item.roots if class_or_item.respond_to?(:scope)
      items = Array(class_or_item)
    end
    result = [['-----','']]
    items.each do |root|
      result += root.class.associate_parents(root.self_and_descendants).map do |i|
        if mover.nil? || mover.new_record? || mover.move_possible?(i)
          [yield(i), i.primary_id]
        end
      end.compact
    end
    result
  end

  def cgry_set_options(class_or_item)
    if class_or_item.is_a? Array
      items = class_or_item.reject { |e| !e.root? }
    else
      class_or_item = class_or_item.roots if class_or_item.respond_to?(:scope)
      items = Array(class_or_item)
    end
    result = []
    items.each do |root|
      result += root.class.associate_parents(root.self_and_descendants).map do |i|
        if 1
          [yield(i), i.primary_id]
        end
      end.compact
    end
    result
  end

end
