class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    @faction = nil
    if Random.rand(2) == 0
      list = Personnage::TRADITION_DESCRIPTION
      pick = Random.rand(list.count)
    else
      list = Personnage::CLAN_DESCRIPTION
      pick = Random.rand(list.count - 2)
    end

    list.each_with_index do |l, i|
      if i == pick
        @faction = l[1]
        @faction_name = l[0]
      end
    end
    @image_link = I18n.transliterate(@faction_name.split(" ").join("_").split("'").join("")).downcase
    @version = VersionComment.last_version.first
    super
  end
end
