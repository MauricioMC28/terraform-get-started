output "container_id" {
    description = "ID del contenedor de Docker"
    value = docker_container.nginx.id
}

output "image_id" {
    description = "ID de la imagen de Docker"
    value = docker_image.nginx.id
}