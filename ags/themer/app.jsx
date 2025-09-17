import app from "ags/gtk4/app";
import style from "./style.scss";
import ThemeWindow from "./ThemeWindow";

app.start({
  css: style,
  main() {
    ThemeWindow();
  },
});
