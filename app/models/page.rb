class Page < ActiveRecord::Base
  def self.about
    pages = Page.find(:all, :conditions => ['unique_name=?', 'about'])
    if pages.blank?
      page = Page.create(:unique_name => 'about',
                         :name => 'about',
                         :content => 'Please edit me')
    else
      page = pages[0]
    end
    return page
  end
  
  def self.resume
    pages = Page.find(:all, :conditions => ['unique_name=?', 'resume'])
    if pages.blank?
      page = Page.create(:unique_name => 'resume',
                         :name => 'resume',
                         :content => 'Please edit me')
    else
      page = pages[0]
    end
    return page
  end
  
  def self.contact
    pages = Page.find(:all, :conditions => ['unique_name=?', 'contact'])
    if pages.blank?
      page = Page.create(:unique_name => 'contact',
                         :name => 'contact',
                         :content => 'Please edit me')
    else
      page = pages[0]
    end
    return page
  end
end