class UniqueCategoryValidator < ActiveModel::Validator
  def validate(record)
    category_ids = record.sub_categories.pluck(:category_id)
    if category_ids.uniq.length != category_ids.length
      record.errors[:category] << 'Can only belong to only one category'
    end
  end
end
