require_relative 'store_model.rb'
require_relative 'store_view.rb'

class Controller
  attr_accessor :store_model, :store_view
  def initialize
    @tienda = Tienda.new
    @view = View.new
    @view.welcome
    all_programa
  end

  def all_programa
    option = @view.menu_principal
    case 
    when option == 1
      login
    when option == 2
      crear_usuario
    end
  end

  def crear_usuario
    input = @view.crear_usuario
    @tienda.crear_usuario(input)
    @view.action
    all_programa
  end

  def login
    log = @view.login
    tipo_usuario = @tienda.login(log)
    case 
    when tipo_usuario == "Administrador" #caso administrador
      while (res_menu = @view.menu_administrador) != 1
        if res_menu == 2
          ver_productos
        elsif res_menu == 3
          agregar_productos
        elsif res_menu == 4
          ver_usuarios
        end
      end
      if res_menu == 1
        all_programa
      end
    #fin de caso administrador  
    when tipo_usuario == "Cliente"
      while (res_menu = @view.menu_cliente) != 1
        if res_menu == 2
          ver_productos
        elsif res_menu == 3
          comprar
        end
      end
      if res_menu == 1
        all_programa
      end
    when tipo_usuario == "Vendedor"
      while (res_menu = @view.menu_vendedor) != 1
        if res_menu == 2
          ver_productos
        elsif res_menu == 3
          agregar_productos
        end
      end
      if res_menu == 1
        all_programa
      end
    else
      @view.log_mal
      all_programa #empezar de nuevo
    end

  end

  def agregar_productos
    producto = @view.agregar_productos
    @tienda.agregar_productos(producto)
    @view.action
  end

  def ver_productos
    all = @tienda.ver_productos
    @view.ver_productos(all)
  end

  def comprar
    ver_productos
    compra = @view.comprar
    mensaje_compra = @tienda.comprar(compra)
    @view.producto_comprado(mensaje_compra)
  end

  def ver_usuarios()
    all_users = @tienda.ver_usuarios
    @view.ver_usuarios(all_users)
  end

  def borrar_producto
    ver_productos
    el_delete = @view.borrar_producto
    el_otro_delete = @tienda.borrar_producto(el_delete)
    @view.producto_borrado(el_otro_delete)
  end

end

Controller.new