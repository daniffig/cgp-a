class Admin::ProductPolicy < AdminPolicy
  class Scope < Scope
    def resolve
      if user.administrador_sistema? || user.consulta?
        scope
      else
        scope.none
      end
    end
  end

  def show?
    user.administrador_sistema? || user.consulta?
  end

  def index?
    user.administrador_sistema? || user.consulta?
  end

  def new?
    user.administrador_sistema?
  end

  def create?
    new?
  end

  def edit?
    user.administrador_sistema?
  end

  def update?
    edit?
  end

  def destroy?
    user.administrador_sistema?
  end

end
