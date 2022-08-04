# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta .location-name").text,
      :percent_funded => project.css("ul.project-stats .first.funded strong").text.gsub("%", "").to_i,
      :amount_funded => project.css("ul.project-stats .money").text.gsub("$","").to_i

    }
    # puts project
    # puts ""
    # puts ""
    # puts ""

  # binding.pry
  end
 projects
end

create_project_hash

# projects: kickstarter.css("li.project.grid_4")
# Title : project.css("h2.bbcard_name strong a").text
# Image: project.css("div.project-thumbnail a img").attribute("src").value
# Description: project.css("p.bbcard_blurb").text
# Location: project.css("ul.project-meta .location-name").text
# Funded%: project.css("ul.project-stats .first.funded strong").text.gsub("%", "").to_i
# Money: project.css("ul.project-stats .money").text
