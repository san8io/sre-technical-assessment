# SRE Technical Assessment
* Paso 1: Creamos los recursos de red usando Terraform.
  - Ruta: terraform/network/
  - Comandos: terraform init, terraform apply
* Paso 2: Creamos una AMI usando Packer y Ansible dentro de la red creada en el paso anterior.
  - Ruta: packer/
  - Proveemos el ID de la subnet y ejecutamos el comando: packer build packer.json
* Paso 3: Aprovisionamos los demas componentes dentro de terraform.
  - Ruta: terraform/
  - Comandos: terraform init, terraform apply
* Nota 1: Utilizar access_key y secret_key para poder crear los recursos en AWS.
* Nota 2: Cambiar el dominio segun se requiera en la configuracion del sitio web nginx en la carpeta 'ansible' y en las variables del modulo 'dns'.
* Dominio utilizado: santechx.com
![DNS configuration](/images/go_daddy.png)
