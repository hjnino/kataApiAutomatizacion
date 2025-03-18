Feature: User API Tests

  Scenario: Obtener todos los usuarios
    Given El usuario tiene URL del API de usuarios
    When Consulta la url  GET "/users"
    Then El codigo de estado retorna un codigo 200 OK
    And Debe contener una arreglo de usuario con 1

  Scenario: Obtener el usuario con el id 2
    Given El usuario tiene URL del API de usuarios
    When Consulta la url  GET "/users/2"
    Then El codigo de estado retorna un codigo 200 OK
    And Debe contener una objeto de un usuario con 2 con email "morrison@gmail.com"

  Scenario: Crear usuario nuevo
    Given El usuario tiene URL del API de usuarios
    When El usuario desea crear un nuevo usuario con los datos "new_user" "new_user@example.com" y "nueva$%Calve" y el metodo POST
    Then El codigo de estado retorna un codigo 200 OK
    And Debe contener una objeto de un usuario con 11 o 1

  Scenario: Actualizar usuario
    Given El usuario tiene URL del API de usuarios
    When El usuario actualice los datos "Update_User" "Update@correo.com" y "Clave%Actualizada" y el metodo PUT URL "/users/5"
    Then El codigo de estado retorna un codigo 200 OK
    And Debe contener una objeto de un usuario con "Update_User" "Update@correo.com" y "Clave%Actualizada"

  Scenario: Eliminar usuario
    Given El usuario tiene URL del API de usuarios
    When Consulta la url  DELETE "/users/3"
    Then El codigo de estado retorna un codigo 200 OK
    And Debe contener una objeto de un usuario con donde su ID se a igual a 3.

  Scenario: Obtener datos con usuario errado
    Given El usuario tiene URL del API de usuarios
    When Consulta la url  GET "/users/s"
    Then Retorna un codigo 400 Error

  Scenario: Intentar crear usuario con datos errados
    Given El usuario tiene URL del API de usuarios
    When Cree usuario con datos errados "new_User" "new@correo.co" y "newClave%Actualizada" y el metodo POST URL "/users/s"
    Then Retorna codigo de respuesta 404 Error

  Scenario: Actualizar usuario inexistente
    Given El usuario tiene URL del API de usuarios
    When Actualice usuario no existente con los datos "Update_User" "Update@correo.com" "Clave%Actualizada" y el metodo PUT URL "/users/s"
    Then Retorna un codigo 400 Error

  Scenario: Eliminar usuario inexistente
    Given El usuario tiene URL del API de usuarios
    When Consulta la url  DELETE "/users/e"
    Then Retorna un codigo 400 Error











