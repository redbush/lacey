RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  config.main_app_name = ['Lacey Laughter', 'Admin']

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

  config.excluded_models = []

  config.model 'Admin' do
    list do
      field :email
    end
    edit do
      field :email
      field :password
      field :password_confirmation
    end
  end

  config.model 'SiteProperty' do
    label 'Site Properties'
    list do
      field :key
    end
  end

  config.model 'Project' do
    label 'Projects'
    list do
      field :company
      field :order
    end
  end

  config.model 'ContentModule' do
    label 'Content Modules'
    list do
      field :title
      field :project do
        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          value.company
        end
      end
      field :order
    end
    edit do
      field :project_id, :enum do
        enum_method do
          :project_id_enum
        end
      end
      field :title
      field :description
      field :order
    end
  end

  config.model 'Photo' do
    label 'Photos'
    list do
      field :photo
      field :content_module
      field :order
    end
  end
end
