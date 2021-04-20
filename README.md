# crystal_ray_tracer

Reorganizing [jzakiya](https://forum.crystal-lang.org/u/jzakiya)'s existing code into a Crystal-lang 'shard' library.
For sake of use in https://github.com/edin/raytracer under the `crystal` sub-folder.
Also for re-use elsewhere, as this is a shard.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal_ray_tracer:
       github: your-github-user/crystal_ray_tracer
   ```

2. Run `shards install`

## Usage

```crystal
require "crystal_ray_tracer"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/crystal_ray_tracer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Jabari Zakiya](https://forum.crystal-lang.org/u/jzakiya) - Ported and optimized Ruby code to Crystal-lang (See: https://forum.crystal-lang.org/t/doing-raytracer-in-crystal/3029)
- [Daniel Huffman](https://github.com/your-github-user) - Repo creator and maintainer - Helping reorganize Crystal code
