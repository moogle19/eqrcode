contents = [
  "https://github.com",
  "random content",
  "0124567890",
  "some very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very, very long string"
]

Benchee.run(
  %{
    "raw_encode" => fn -> Enum.map(contents, fn content -> EQRCode.encode(content) end) end,
    # "svg_encode" => fn -> Enum.map(contents, fn content -> content |> EQRCode.encode() |> EQRCode.svg() end) end,
    # "png_encode" => fn -> Enum.map(contents, fn content -> content |> EQRCode.encode() |> EQRCode.png() end) end,
  },
  time: 30,
  memory_time: 10,
  reduction_time: 10,
  profile_after: true
)
