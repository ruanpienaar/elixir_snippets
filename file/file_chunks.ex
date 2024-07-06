# TODO: delete chunks once successful

defmodule Util.FileChunks do
  require Logger

  # 1.5G 128-byte files	./chunks on settings File.stream!(filename, chunk_bytes, [])  AND  File.write -> :binary, :raw, :sync, :write
  # 396M 512-bytes files ./chunks on settings File.stream!(filename, chunk_bytes, [{:read_offset, 1024}]) AND File.write -> :binary, :raw, :sync, :write
  # 198M 1024-bytes files ./chunks on settings File.stream!(filename, chunk_bytes, [{:read_offset, 1024}]) AND File.write -> :binary, :raw, :sync, :write

  @chunks "chunks"
  # @reassemble "reassemble"
  @lastchunk ".lastchunk"
  @chunkstart 0

  def clear_out_dir(dir) do
    :ok = delete_and_recreate_dir(dir)
  end

  # Try :delayed_write
  def split_file(filename, chunk_bytes, chunk_location) do
    chunk_count =
      read_file_chunks(filename, chunk_bytes)
      |> Enum.reduce(
        @chunkstart,
        fn [chunk], chunk_number ->
          :ok =
            File.write(
              chunk_file(chunk_location, chunk_number),
              chunk,
              [:binary, :raw, :sync, :write]
            )

          chunk_number + 1
        end
      )

    last_chunk = chunk_count - 1
    :ok = create_info_file(filename, last_chunk)
    {:ok, chunk_count}
  end

  def reassemble_file(filename, chunks_path, reassemble_path) do
    chunk_count = String.to_integer(File.read!(make_info_filename(filename)))
    reassemble_filename = Path.join([reassemble_path, Path.basename(filename)])

    {:ok, fd} =
      File.open(
        reassemble_filename,
        [:write, :binary, :sync]
      )

    Enum.each(
      @chunkstart..chunk_count,
      fn chunk_number ->
        chunk_filename = chunk_filename(chunks_path, chunk_number)
        chunk_data = File.read!(chunk_filename)
        :ok = :file.write(fd, chunk_data)
        [chunk_number]
      end
    )
  end

  ## ----

  defp delete_and_recreate_dir(chunk_location) do
    :ok = quiet_delete_dir_r(chunk_location(chunk_location))
    :ok = mkdir_if_missing(chunk_location(chunk_location))
  end

  # Dumb: why do i need to export functions to keep the compiler happy?

  def chunk_location(location) do
    Path.join([location, @chunks])
  end

  def chunk_file(chunk_location, chunk_number) do
    Path.join([
      chunk_location(chunk_location),
      Integer.to_string(chunk_number)
    ])
  end

  defp make_info_filename(filename) do
    filename <> @lastchunk
  end

  def create_info_file(filename, chunk_count) do
    :ok =
      File.write(
        make_info_filename(filename),
        Integer.to_string(chunk_count),
        [:sync, :write]
      )
  end

  defp chunk_filename(chunks_path, chunk_number) do
    # TODO: path join
    Path.join([chunks_path, Integer.to_string(chunk_number)])
  end

  defp quiet_delete_dir_r(dirname) do
    case :file.del_dir_r(dirname) do
      :ok ->
        :ok

      {:error, :enoent} ->
        :ok
    end
  end

  defp mkdir_if_missing(dirname) do
    case File.mkdir(dirname) do
      :ok ->
        :ok

      {:error, :eexist} ->
        :ok
    end
  end

  defp read_file_chunks(filename, chunk_bytes) do
    file_stream = File.stream!(filename, chunk_bytes, [])
    Stream.chunk_every(file_stream, 1)
  end
end
