require 'csv'

class User
  attr_accessor :nombre_usuario, :correo, :tipo_usuario, :password
  def initialize(nombre_usuario, correo, tipo_usuario , password)
    @nombre_usuario = nombre_usuario
    @correo = correo
    @tipo_usuario = tipo_usuario
    @password = password
  end
end

class Vendedor < User
end

class Administrador < User
end

class Cliente < User
end

class Productos
  attr_accessor :name_toy
  def initialize(name_toy)
    @name_toy = name_toy
  end
end

class Tienda
  
  def initialize
  end

  def crear_usuario(array)

    user = User.new(array[0], array[1], array[2], array[3])
    CSV.open("usuarios.csv",'a') do |csv|
        csv << [user.nombre_usuario, user.correo, user.tipo_usuario, user.password]
    end 
  end

  def login(array)
    array_new = []
    email = array[0]
    contraseña = array[1]
    CSV.foreach("usuarios.csv") do |row|
      user = User.new(row[0],row[1],row[2],row[3])
      array_new << user
    end
    user_type = ""
    array_new.each do |valor|
      if valor.correo == email && valor.password == contraseña
        user_type = valor.tipo_usuario
      end    
    end
    user_type
  end

  def agregar_productos(new_toy)
    producto = Productos.new(new_toy)
    CSV.open("productos.csv",'a') do |csv|
        csv << [producto.name_toy]
    end
  end

  def ver_productos
    array_new= []
    CSV.foreach("productos.csv") do |row|
      producto = Productos.new(row[0])
      array_new << producto
    end
    array_new
  end

  def comprar(numero_producto)
    numero_producto -=1
    array_new= []
    CSV.foreach("productos.csv") do |row|
      producto = Productos.new(row[0])
      array_new << producto
    end
    cosas_array= [] 
    prod_comprado=[]
    array_new.each.with_index do |value,index|
      if index != numero_producto
        cosas_array << value
      else
        prod_comprado = value
      end
    end
    CSV.open("productos.csv",'wb') do |csv|
      cosas_array.each do |prod|
        csv << [prod.name_toy]
      end  
    end
    prod_comprado
  end

  def ver_usuarios
    array_new =[]
    CSV.foreach("usuarios.csv") do |row|
      user = User.new(row[0],row[1],row[2],row[3])
      array_new << user
    end
    array_new
  end

  def borrar_producto(numero_producto)
    numero_producto -=1
    array_new= []
    CSV.foreach("productos.csv") do |row|
      producto = Productos.new(row[0])
      array_new << producto
    end
    cosas_array= [] 
    prod_comprado=[]
    array_new.each.with_index do |value,index|
      if index != numero_producto
        cosas_array << value
      else
        prod_comprado = value
      end
    end
    CSV.open("productos.csv",'wb') do |csv|
      cosas_array.each do |prod|
        csv << [prod.name_toy]
      end  
    end
    prod_comprado
  end

end