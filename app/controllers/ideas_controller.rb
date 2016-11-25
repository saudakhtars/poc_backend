# == Schema Information
#
# Table name: ideas
#
#  id                            :integer          not null, primary key
#  name                          :string
#  description                   :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  questions                     :hstore
#  disabled_goals                :hstore
#  presentation_banner           :string
#  public                        :boolean          default(FALSE), not null
#  tagline                       :string
#  public_problem                :boolean          default(FALSE)
#  public_solution               :boolean          default(FALSE)
#  type_temp                     :string
#  community_id                  :integer
#  presentation_banner_processed :boolean          default(FALSE)
#  video_pitch                   :string
#  location                      :string(64)
#  category                      :string           default("")
#  public_location               :boolean          default(FALSE)
#  public_category               :boolean          default(FALSE)
#  custom_fields                 :jsonb
#  public_video_pitch            :boolean          default(FALSE)
#  followers_count               :integer          default(0)
#
# Indexes
#
#  index_ideas_on_community_id     (community_id)
#  index_ideas_on_followers_count  (followers_count)
#  index_ideas_on_location         (location)
#

class IdeasController < ApplicationController

  def index
    @ideas = [
    {
      "photo": "assets/img/Carter-Wigell.png",
      "name":"Deepika Nikode",
      "banner": "assets/img/img01.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/charlie-smith.png",
      "name": "Charlie Smith",
      "banner": "assets/img/img02.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/bindi-karia.png",
      "name": "Bindi Karia",
      "banner": "assets/img/img03.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/aber.png",
      "name": "Aber Whitcomb",
      "banner": "assets/img/img04.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/Julie-Trell.png",
      "name": "Julie Trell",
      "banner": "assets/img/img05.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/Ray-Arata.png",
      "name": "Ray Arata",
      "banner": "assets/img/img07.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    },
    {
      "photo": "assets/img/user06.png",
      "name": "Chrlie Smith",
      "banner": "assets/img/img06.png",
      "title":"Frozen Pizza",
      "description":"If you'd like to contribute, you must follow our contributing guidelines. You can look through the issues (which should be up-to-date on)",
      "likescount":10,
      "commentscount":15
    }
]
    respond_to do |format|
      format.json { render json: @ideas }
    end
  end

  def new
    @idea = Idea.for_community(current_community).new
  end

  def create
    service = IdeaCreateService.new(idea_params, current_user, current_community)
    if service.insert_idea
      respond_redirect(idea_path(service.idea), service.idea)
    else
      @idea = service.idea
      respond_error('new', @idea)
    end
  end

  private

  def idea_params
    params.require(:idea).permit(
      :name, :description, :presentation_banner, :public, :tagline, :collection_id, :public_problem,
      :remove_presentation_banner, :event_id, :video_pitch, :category, :public_solution, :location,
      :public_category, :public_location, :public_video_pitch,
      questions: Idea::QUESTIONS, custom_fields: custom_field_params_hash
    )
  end
end
