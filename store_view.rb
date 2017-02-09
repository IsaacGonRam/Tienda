class View

  def welcome
    puts
    puts "Welcome to the online store: Compra tu juguete, (www.toys.com)" 
    puts "--------------------------------------------------------------"
  end

  def menu_principal
    puts
    puts "Select option number:"
    puts "1. Login"
    puts "2. Register"
    puts "Cualquier tecla para salir"
    option = gets.chomp.to_i
    option
  end

  def action
    puts "Se realizo la acción con exito"
  end

  def crear_usuario
    user_input = []
    puts "Escribe tu nombre"
    user_input << gets.chomp
    puts "Escribe tu correo"
    user_input << gets.chomp
    puts "Tipo de usuario"
    user_input << gets.chomp
    puts "Escribe una contraseña"
    user_input << gets.chomp
    user_input
  end

  def login
    user_login = []
    puts "Digita tu correo electronico"
    user_login << gets.chomp
    puts "Escribe tu contraseña"
    user_login << gets.chomp
    user_login 
  end

  def agregar_productos
    puts "Escribe el nombre del producto a agregar"
    prod = gets.chomp
    prod
  end

  def ver_productos(arreglo_productos)
    puts "*ESTOS SON LOS PRODUCTOS*"
    number = 1
    puts
    arreglo_productos.each do |prod|
        puts "#{number}. #{prod.name_toy} "
        number +=1
    end
  end

  def comprar
    puts "Elige el numero del juguete que quieres comprar"
    numero_producto = gets.chomp.to_i
    numero_producto
  end

  def producto_comprado(prod_comprado)
    puts "Compraste el juguete: #{prod_comprado.name_toy} "  #dudas
  end

  def ver_usuarios(array_users)
    puts
    puts "Estos son los usuarios"
    array_users.each do |usu|
    puts "Nombre: #{usu.nombre_usuario}. Email: #{usu.correo} . Tipo de usuario: #{usu.tipo_usuario}"
    end
  end

  def borrar_producto
    puts "Elige el numero del juguete que quieres comprar"
    numero_producto = gets.chomp.to_i
    numero_producto
  end

  def producto_borrado(delete)
    puts
    puts "Compraste el juguete: #{delete.name_toy} "
  end

  def logout
    puts "Se cerro con exito tu sesión"
  end

  def menu_administrador
    puts
    puts "Bienvenido Administrador"
    puts "------------------------"
    puts "Selecciona un numero de la opcion"
    puts "1. Logout"
    puts "2. Ver productos"
    puts "3. Crear productos"
    puts "4. Ver los usuarios"
    res = gets.chomp.to_i
    res
  end

  def menu_cliente
    puts "Bienvenido estimado cliente"
    puts "---------------------------" 
    puts "Selecciona un numero de la opcion"
    puts "1. Logout"
    puts "2. Ver productos"
    puts "3. Comprar"
    res = gets.chomp.to_i
    res
  end

  def menu_vendedor
    puts "Bienvenido Vendedor"
    puts "-------------------"
    puts "Selecciona un numero de la opcion"
    puts "1. Logout"
    puts "2. Ver productos"
    puts "3. Crear productos"
    res = gets.chomp.to_i
    res
  end

  def log_mal
    puts "lo siento no te logeaste bien. Adios"
  end

end