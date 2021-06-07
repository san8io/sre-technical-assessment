# SRE Technical Assessment
* Paso 1:
  - Configuramos los recursos de red usando Terraform.
* Paso 2:
  - Creamos una AMI usando Packer y Ansible dentro de la red creada en el paso anterior.
* Paso 3:
  - Levantamos la instancia EC2 dentro de la red con la AMI.
* Nota: Utilizar access_key y secret_key para poder crear los recursos en AWS.

