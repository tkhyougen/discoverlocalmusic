module LocalartistsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == "create"
      confirm_localartists_path
    elsif action_name == 'edit'
      localartist_path
    end
  end
end
