class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "Mensagem enviada!"
    else
      redirect_to new_contact_path, notice: "Erro no sistema alguém me desconfigurou... (tente novamente)"
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :mensagem)
    end
end