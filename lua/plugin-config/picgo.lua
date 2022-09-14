local status_ok, picgo = pcall(require, "picgo")
if not status_ok then
  vim.notify("No found picgo")
  return
end

picgo.setup({
    -- method to informe
    -- 1. notify
    -- 2. echo
    notice = "notify",
    -- Whether the generated markdown link saves the upload name of the image
    -- boolean
    image_name = false,
    -- debug mode
    debug = false,
})
