module OrganisationsHelper
  def secret_or_note_member(organisation, member)
    organisation_personnage = OrganisationsPersonnages
      .where(organisation_id: organisation.id)
      .where(personnage_id: member.id).first
    if organisation_personnage.secret
      content_tag :span, 'Secret', class: 'label label-success'
    else
      content_tag :span, 'Publique', class: 'label label-default'
    end
  end
end
