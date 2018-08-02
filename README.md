# Google Cloud IAM Chef Cookbook

This cookbook provides the built-in types and services for Chef to manage
Google Cloud IAM resources, as native Chef types.

## Requirements

### Platforms

#### Supported Operating Systems

This cookbook was tested on the following operating systems:

* RedHat 6, 7
* CentOS 6, 7
* Debian 7, 8
* Ubuntu 12.04, 14.04, 16.04, 16.10
* SLES 11-sp4, 12-sp2
* openSUSE 13
* Windows Server 2008 R2, 2012 R2, 2012 R2 Core, 2016 R2, 2016 R2 Core

## Example

```ruby
giam_service_account 'test-account@graphite-playground.google.com.iam.gserviceaccount.com' do
  action :create
  display_name 'My Chef test key'
  project ENV['PROJECT']
  credential 'mycred'
end

giam_service_account_key 'test-name' do
  action :create
  service_account 'test-account@graphite-playground.google.com.iam.gserviceaccount.com'
  path '/home/alexstephen/test_key.json'
  key_algorithm 'KEY_ALG_RSA_2048'
  private_key_type 'TYPE_GOOGLE_CREDENTIALS_FILE'
  project ENV['PROJECT']
  credential 'mycred'
end
```

## Credentials

All Google Cloud Platform cookbooks use an unified authentication mechanism,
provided by the `google-gauth` cookbook. Don't worry, it is automatically
installed when you install this module.

### Example

```ruby
gauth_credential 'mycred' do
  action :serviceaccount
  path ENV['CRED_PATH'] # e.g. '/path/to/my_account.json'
  scopes [
    'https://www.googleapis.com/auth/iam'
  ]
end

```

For complete details of the authentication cookbook, visit the
[google-gauth][] cookbook documentation.

## Resources

* [`giam_service_account`](#giam_service_account) -
    A service account in the Identity and Access Management API.
* [`giam_service_account_key`](#giam_service_account_key) -
    A service account in the Identity and Access Management API.


### giam_service_account
A service account in the Identity and Access Management API.


#### Example

```ruby
giam_service_account 'test-account@graphite-playground.google.com.iam.gserviceaccount.com' do
  action :create
  display_name 'My Chef test key'
  project ENV['PROJECT']
  credential 'mycred'
end

```

#### Reference

```ruby
giam_service_account 'id-for-resource' do
  display_name     string
  email            string
  name             string
  oauth2_client_id string
  unique_id        string
  project_id       string
  project          string
  credential       reference to gauth_credential
end
```

#### Actions

* `create` -
  Converges the `giam_service_account` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `giam_service_account` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `name` -
  The name of the service account.

* `project_id` -
  Output only. Id of the project that owns the service account.

* `unique_id` -
  Output only. Unique and stable id of the service account

* `email` -
  Output only. Email address of the service account.

* `display_name` -
  User specified description of service account.

* `oauth2_client_id` -
  Output only. OAuth2 client id for the service account.

#### Label
Set the `sa_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

### giam_service_account_key
A service account in the Identity and Access Management API.


#### Example

```ruby
giam_service_account 'test-account@graphite-playground.google.com.iam.gserviceaccount.com' do
  action :create
  display_name 'My Chef test key'
  project ENV['PROJECT']
  credential 'mycred'
end

giam_service_account_key 'test-name' do
  action :create
  service_account 'test-account@graphite-playground.google.com.iam.gserviceaccount.com'
  path '/home/alexstephen/test_key.json'
  key_algorithm 'KEY_ALG_RSA_2048'
  private_key_type 'TYPE_GOOGLE_CREDENTIALS_FILE'
  project ENV['PROJECT']
  credential 'mycred'
end

```

#### Reference

```ruby
giam_service_account_key 'id-for-resource' do
  fail_if_mismatch  boolean
  key_algorithm     'KEY_ALG_UNSPECIFIED', 'KEY_ALG_RSA_1024' or 'KEY_ALG_RSA_2048'
  key_id            string
  name              string
  path              string
  private_key_data  string
  private_key_type  'TYPE_UNSPECIFIED', 'TYPE_PKCS12_FILE' or 'TYPE_GOOGLE_CREDENTIALS_FILE'
  public_key_data   string
  service_account   reference to giam_service_account
  valid_after_time  time
  valid_before_time time
  project           string
  credential        reference to gauth_credential
end
```

#### Actions

* `create` -
  Converges the `giam_service_account_key` resource into the final
  state described within the block. If the resource does not exist, Chef will
  attempt to create it.
* `delete` -
  Ensures the `giam_service_account_key` resource is not present.
  If the resource already exists Chef will attempt to delete it.

#### Properties

* `name` -
  Output only. The name of the key.

* `private_key_type` -
  Output format for the service account key.

* `key_algorithm` -
  Specifies the algorithm for the key.

* `private_key_data` -
  Output only. Private key data. Base-64 encoded.

* `public_key_data` -
  Output only. Public key data. Base-64 encoded.

* `valid_after_time` -
  Output only. Key can only be used after this time.

* `valid_before_time` -
  Output only. Key can only be used before this time.

* `service_account` -
  The name of the serviceAccount.

* `path` -
  The full name of the file that will hold the service account private
  key. The management of this file will depend on the value of
  sync_file parameter.
  File path must be absolute.

* `key_id` -
  Used to ensure the deletion of the key in the absence of a key file.

* `fail_if_mismatch` -
  If set to 'true' protects the target file from being rewritten with a
  new private key. By default the file is always ensured to have a valid
  private key on final state.

#### Label
Set the `sak_label` property when attempting to set primary key
of this object. The primary key will always be referred to by the initials of
the resource followed by "_label"

[google-gauth]: https://supermarket.chef.io/cookbooks/google-gauth
