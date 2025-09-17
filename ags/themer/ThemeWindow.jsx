import { createState } from "ags";

export default function ThemeWindow() {
  const [count, setCount] = createState(0);

  function increment() {
    setCount((v) => v + 1);
  }

  const label = count((num) => num.toString());

  return (
    <box>
      <label label={label} />
      <button onClicked={increment}>Click to increment</button>
    </box>
  );
}
