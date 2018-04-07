ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
        column do
            panel 'Ultimos productos agregados' do
                ul do
                    Product.last(5).map do |product|
                        li link_to(product.name, admin_product_path(product))
                    end
                end
            end
        end 

        column do
            panel 'Usuarios' do
                ul do
                    li "Usuarios registrados: #{User.count}"
                    li "Administradores registrados: #{AdminUser.count}"
                end
            end
        end

    end # content
    panel "Gráfico" do
     render 'shared/chart'
    end
end
end
