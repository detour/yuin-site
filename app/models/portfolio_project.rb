class PortfolioProject < Project
  default_scope :order => 'project_date DESC', 
                :conditions => ['is_portfolio=? and published=?', true, true]
end