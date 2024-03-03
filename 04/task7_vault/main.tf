
data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}
output "vault_example" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data.data) 
}

resource "vault_generic_secret" "example_write" {
  # This is the path in Vault where the secret will be stored.
  path = "secret/example_write"

  # If the path already contains a secret, this argument 
  # specifies whether to overwrite it. By default, it's false.
  disable_read = false

  # The data to store at the given path, as key-value pairs.
  data_json = jsonencode({
    password = "my-password1"
    username = "my-username1"
  })
}

output "secret_path" {
  value = vault_generic_secret.example_write.path
}

output "secret_data" {
  value = nonsensitive(jsondecode(vault_generic_secret.example_write.data_json))
}