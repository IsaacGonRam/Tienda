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

  def menu_principal
    puts "Select option number:"
    puts "1. Login"
    puts "2. Register"
    puts "Cualquier tecla para salir"
    option = gets.chomp.to_i
  end

  def crear_usuario
    puts "Escribe tu nombre"
    nombre = gets.chomp
    puts "Escribe tu correo"
    correo = gets.chomp
    puts "Tipo de usuario"
    tipo_usuario = gets.chomp
    puts "Escribe una contraseña"
    password = gets.chomp
    user = User.new(nombre, correo, tipo_usuario, password)
    CSV.open("usuarios.csv",'a') do |csv|
        csv << [user.nombre_usuario, user.correo, user.tipo_usuario, user.password]
    end 
  end

  def login
    puts "Digita tu correo electronico"
    email = gets.chomp
    puts "Escribe tu contraseña"
    contraseña = gets.chomp
    array_new= []
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
    case 
    when user_type == "Administrador"
      puts "Bienvenido Administrador"
      puts "------------------------"
      puts "Selecciona un numero de la opcion"
      puts "1. Logout"
      puts "2. Ver productos"
      puts "3. Crear productos"
      puts "4. Ver los usuarios"
      res = gets.chomp.to_i
      case 
      when res == 1
        puts "Cerraste sesión"
        menu_principal
      when res == 2
        ver_productos                       
      when res == 3
        agregar_productos
      when res == 4
        ver_usuarios
      end

    when user_type == "Cliente"
      puts "Bienvenido estimado cliente"
      puts "---------------------------" 
      puts "Selecciona un numero de la opcion"
      puts "1. Logout"
      puts "2. Ver productos"
      puts "3. Comprar"
      res = gets.chomp.to_i
      case 
      when res == 1
        puts "Cerraste sesión"
        menu_principal
      when res == 2
        ver_productos                       
      when res == 3
        comprar
      end
    when user_type == "Vendedor"
      puts "Bienvenido Vendedor"
      puts "-------------------"
      puts "Selecciona un numero de la opcion"
      puts "1. Logout"
      puts "2. Ver productos"
      puts "3. Crear productos"
      case 
      when res == 1
        puts "Cerraste sesión"
        menu_principal
      when res == 2
        ver_productos                       
      when res == 3
        agregar_productos
      end
    else
    puts "lo siento no te logeaste bien. Adios"
    end
  end

  def agregar_productos
    puts "Escribe el nombre del producto a agregar"
    prod = gets.chomp
    producto = Productos.new(prod)
    CSV.open("productos.csv",'a') do |csv|
        csv << [producto.name_toy]
    end
    puts "listo"  
  end

  def ver_productos
    array_new= []
    CSV.foreach("productos.csv") do |row|
      producto = Productos.new(row[0])
      array_new << producto
    end
    number = 1
    array_new.each do |prod|
        puts "#{number}. #{prod.name_toy} "
        number +=1
    end
  end

  def comprar
    ver_productos #funcion que despliega los productos
    puts "Elige el numero del juguete que quieres comprar"
    numero_producto = gets.chomp.to_i
    numero_producto -=1
    array_new= []
    CSV.foreach("list.csv") do |row|
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
    CSV.open("list.csv",'wb') do |csv|
      cosas_array.each do |prod|
        csv << [prod.name_toy]
      end  
    end
    puts "Compraste el juguete: #{prod_comprado.name_toy} "  
  end

  def ver_usuarios()
    array_new =[]
    CSV.foreach("usuarios.csv") do |row|
      user = User.new(row[0],row[1],row[2],row[3])
      array_new << user
    end
    puts "Estos son los usuarios"
    array_new.each do |usu|
      puts "Nombre: #{usu.nombre_usuario}. Email: #{usu.correo} . Tipo de usuario: #{usu.tipo_usuario}"
    end
  end

  def borrar_producto
    ver_productos #funcion que despliega los productos
    puts "Elige el numero del juguete que quieres comprar"
    numero_producto = gets.chomp.to_i
    numero_producto -=1
    array_new= []
    CSV.foreach("list.csv") do |row|
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
    CSV.open("list.csv",'wb') do |csv|
      cosas_array.each do |prod|
        csv << [prod.name_toy]
      end  
    end
    puts "borraste el juguete: #{prod_comprado.name_toy} "  
  end

end

puts
puts "Welcome to the online store: Compra tu juguete, (www.toys.com)" 
puts "--------------------------------------------------------------"
tiendita = Tienda.new

option = tiendita.menu_principal
case 
when option == 1
  tiendita.login
when option == 2
  tiendita.crear_usuario
end

