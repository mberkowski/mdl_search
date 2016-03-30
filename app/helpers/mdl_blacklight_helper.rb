module MdlBlacklightHelper
  include Blacklight::LayoutHelperBehavior

 ##
  # Classes used for sizing the sidebar content of a Blacklight page
  # @return [String]
  def sidebar_classes
    'col-md-12 col-sm-12 col-lg-3'
  end
end
