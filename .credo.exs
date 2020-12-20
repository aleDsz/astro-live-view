%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/"],
        excluded: ["test/", "lib/astro/surface_component.ex"]
      },
      strict: true,
      color: true
    }
  ]
}
