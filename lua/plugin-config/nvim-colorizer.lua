local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify("No found colorizer")
  return
end

colorizer.setup()
