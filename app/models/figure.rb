class Figure < ActiveRecord::Base
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles

  def self.create_from_web(p)
    new_landmark = p[:landmark][:name]
    new_title = p[:title][:name]   
    
    f = Figure.create(p[:figure])

    unless new_landmark.empty?
      l = Landmark.find_or_create_by(name: new_landmark) 
      l.figure = f
      l.save
    end

    unless new_title.empty?
      t = Title.find_or_create_by(name: new_title)
      f.figure_titles.create(title: t)
    end

    return f
  end

  def self.update_from_web(p)
    new_landmark = p[:landmark][:name]
    new_title = p[:title][:name]   
    
    f = Figure.find(p[:id])
    f.update!(p[:figure])

    unless new_landmark.empty?
      l = Landmark.find_or_create_by(name: new_landmark) 
      l.figure = f
      l.save
    end

    unless new_title.empty?
      t = Title.find_or_create_by(name: new_title)
      f.figure_titles.create(title: t)
    end

    return f   
  end



end