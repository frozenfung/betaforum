module TopicsHelper

  def topics_filter_conditions(original_params, default)
    original_params.slice(:order, :gid).merge(default)
  end


end
