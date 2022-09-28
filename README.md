# AWS EKS: roles y políticas
 
Este repositorio posee la configuración necesaria para poder definir roles con sus respectivas políticas en AWS.
 
Estas políticas tienen los permisos mínimos para poder delegar el acceso a un usuario, que puede ser un usuario de otra cuenta AWS, y este sea capaz de crear un cluster de EKS.
 
Mediante infraestructura como código (IaC) se definen los roles y políticas requeridas.
 
## Requerimientos
 
* Tener instalado
 [AWS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) y [configurado un perfil](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html) para poder comunicarse con su cuenta de AWS
* Tener instalado [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
 
## Crear permisos
 
Para crear los roles y políticas se deben seguir los siguientes pasos:
* Editar el archivo terraform.tfvars y modificar las siguientes variables:
  * **trusted_role_arns**: esta variable debe ser un arreglo con los ARNS de las cuentas de AWS a las cuales se les concederá el acceso.
    * El ARN de una cuenta de AWS se forma de la siguiente manera: arn:aws:iam::AWS_ACCOUNTID:root
    * ¿No conoce su AWS ACCOUNT ID? ejecutar el siguiente commando: ```aws sts get-caller-identity```
* La receta soporta la creación de 3 roles (ver archivo terraform-eks-permissions.tf):
 * admin_role: este rol nos da la posibilidad de crear un rol con permisos de administrador. Este repositorio se encuentra configurado para crear este Rol, rol de administrador de EKS.
 * poweruser_role: este rol nos da la posibilidad de crear un rol con permisos de superusuario, sin llegar a ser un administrador.
	* Deshabilitado por defecto.
 * readonly_role: este rol nos da la posibilidad de crear un rol con permisos mínimos, generalmente de solo lectura, y otorgar mínimos accesos a los usuarios.
	* Deshabilitado por defecto.
 * Para cada uno de estos usuarios se debe definir de todas maneras las políticas que se asignan mediante la variable "ROLE_role_policy_arns"
	* el rol admin_role se encuentra definido con las politicas que le corresponen. Ver archivo terraform-eks-permissions.tf.
* Ver los recursos que se aplicaran:
  ```
  terraform plan
  ```
* Crear los recursos definidos:
  ```
  terraform apply
  ```
 > Con el comando **terraform apply** nos indicará la misma salida que el comando **terraform plan** y nos pedirá la confirmación para aplicar los recursos.
 
Una vez aplicados los cambios se debe enviar el/los usuario/s para el que se creó este rol el ARN del mismo.
El ARN se puede obtener, sin necesidad de acceder a la consola de AWS, siguiendo las siguientes opciones:
* Output de Terraform: ejecutar el comando ```terraform output```
  * Se obtendra una variable llamada **terraform-eks-admin-role-arn** con su respectivo valor.
* CLI de AWS: aws iam get role –role-name role-name
  * ```aws iam get-role --role-name eks-terraform-admin-role | jq .Role.Arn ```


## Referencias
 
 Para más información acerca de los módulos que se utilizan se puede seguir la documentación de dichos módulos:
 * Definición de roles: se utiliza el modulo de Terraform https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-assumable-roles
 * Definición de politicas: se utiliza el modulo de Terraform https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-policy
