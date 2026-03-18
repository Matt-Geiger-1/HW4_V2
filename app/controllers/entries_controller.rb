# Handles creation of journal entries
class EntriesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["entry"]["title"]
    @entry["description"] = params["entry"]["description"]
    @entry["occurred_on"] = params["entry"]["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = current_user["id"]

    uploaded_file = params["entry"]["image"]
    if uploaded_file != nil
      filename = SecureRandom.hex + "_" + uploaded_file.original_filename
      path = Rails.root.join("public", "uploads", filename)

      File.open(path, "wb") do |file|
        file.write(uploaded_file.read)
      end

      @entry["image"] = filename
    end

    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
