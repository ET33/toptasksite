# encrypt utf-8

namespace :app do
    desc "Encripta senhas do banco"
    task migrar_senha: :environment do
        unless User.attribute_names.include? "password"    
            puts "Senhas já migradas, finalizando."
            return
        end
        
        User.find_each do |user|
            puts "MIGRANDO ##{user[:id]} - #{user[:name]}"      
            if not user.valid? or user.attributes["password"].blank?
              puts "Usuario invalido #{user[:id]}" 
              next
            end

            unencripted_password = user.attributes["password"]

            user.password = unencripted_password
            user.password_confirmation = unencripted_password
            user.save!
        end
    end
end