# terraforming-gke

Gemerate Terraform HCL files from existng GKE resources

## Prerequisites

- You have been already logged on to GCP on your machine

## Installation

Add this line to your application's Gemfile:

```bash
git clone
cd terraforming-gke
bundle install -j4 --without test development
bundle exec exe/terraforming-gke
```

## Usage

### GKE cluster ([`google_container_cluster`](https://www.terraform.io/docs/providers/google/r/container_cluster.html))

```bash
bundle exec exe/terraforming-gke cluster \
  --project <project> \
  --zone <zone>
```

### GKE node pool ([`google_container_node_pool`](https://www.terraform.io/docs/providers/google/r/container_node_pool.html))

```bash
bundle exec exe/terraforming-gke node_pool \
  --project <project> \
  --zone <zone> \
  --cluster <cluster>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dtan4/terraforming-gke.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
