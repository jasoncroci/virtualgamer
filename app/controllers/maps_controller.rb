class MapsController < ApplicationController
  before_filter :find_encounter

	def new
    @map = @encounter.build_map
	end

  private

  def find_encounter
    @encounter = Encounter.find(params[:encounter_id])
  end

end
