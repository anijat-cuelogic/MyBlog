RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)
  config.authorize_with :cancan

  config.model User do
    object_label_method  :name
    list do
      field :name
      field :email
      field :roles
    end
    edit do
      field :name
      field :email
      field :password
      field :password_confirmation
      field :roles
    end
  end

  config.model Post do
    object_label_method  :title
    list do
      field :title
      field :description
      field :author_id
    end
    edit do
      field :title
      field :description
      field :author_id
    end
  end

  config.model Comment do
    object_label_method  :commented_by
    list do
      field :description
      field :commented_by
      field :post_id
      field :spam
    end
    edit do
      field :description
      field :commented_by
      field :post_id
      field :spam
    end
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
