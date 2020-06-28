RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model Article do
    list do
      field :id
      field :title
      field :status
      field :created_at
      field :updated_at
    end
    edit do
      field :category
      field :title
      field :image
      field :highlight, :wysihtml5 do
        config_options toolbar: { fa: true },
                       html: true,
                       parserRules: { tags: { p: 1 } }
      end
      field :content, :wysihtml5 do
        config_options toolbar: { fa: true },
                       html: true,
                       parserRules: { tags: { p: 1 } }
      end
      field :status
      field :published_at
      field :admin
      field :tags
    end
  end

  config.actions do
    dashboard do
      only ["Admin", "Article", "Category", "Comment"]
    end
    index do
      only ["Admin", "Article", "Category", "Comment"]
    end
    new do
      only ["Admin", "Article", "Category", "Comment"]
    end
    export do
      only ["Admin", "Article", "Category", "Comment"]
    end
    bulk_delete do
      only ["Admin", "Article", "Category", "Comment"]
    end
    show do
      only ["Admin", "Article", "Category", "Comment"]
    end
    edit do
      only ["Admin", "Article", "Category", "Comment"]
    end
    delete do
      only ["Admin", "Article", "Category", "Comment"]
    end
    show_in_app do
      only ["Admin", "Article", "Category", "Comment"]
    end
  end
end
