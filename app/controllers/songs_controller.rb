class SongsController < ApplicationController
  before_action :get_song, only: %i[show edit]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = 'Song deleted.'
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end

  def get_song
    @song = Song.find(params[:id])
  end
end
