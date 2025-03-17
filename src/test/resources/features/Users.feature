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