"use client";
import { KeyboardEvent, useRef } from "react";
import scss from "./CodeEditor.module.scss";

type CodeEditorProps = {
  value: string;
  onChange: (value: string) => void;
  disabled?: boolean;
};

const symbols = ["{", "}", "(", ")", "[", "]", ";", "=", "=>", "<", ">", "!", "+", "-", "\"", ".", ","];

const CodeEditor = ({ value, onChange, disabled }: CodeEditorProps) => {
  const ref = useRef<HTMLTextAreaElement>(null);
  const lines = Math.max(value.split("\n").length, 8);

  const insert = (text: string) => {
    const area = ref.current;
    if (!area || disabled) return;
    const start = area.selectionStart;
    const end = area.selectionEnd;
    const next = value.slice(0, start) + text + value.slice(end);
    onChange(next);
    requestAnimationFrame(() => {
      area.focus();
      area.selectionStart = area.selectionEnd = start + text.length;
    });
  };

  const onKeyDown = (e: KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === "Tab") {
      e.preventDefault();
      insert("  ");
    }
    if (e.key === "Enter") {
      const area = e.currentTarget;
      const before = value.slice(0, area.selectionStart);
      const line = before.slice(before.lastIndexOf("\n") + 1);
      let indent = line.match(/^ */)?.[0] ?? "";
      if (before.trimEnd().endsWith("{")) indent += "  ";
      e.preventDefault();
      insert("\n" + indent);
    }
  };

  return (
    <div className={scss.container}>
      <div className={scss.code}>
        <div className={scss.numbers}>
          {Array.from({ length: lines }, (_, i) => (
            <span key={i}>{i + 1}</span>
          ))}
        </div>
        <textarea
          ref={ref}
          value={value}
          spellCheck={false}
          autoCapitalize="off"
          autoComplete="off"
          autoCorrect="off"
          disabled={disabled}
          aria-label="Редактор JavaScript кода"
          style={{ height: `${lines * 22 + 28}px` }}
          onChange={(e) => onChange(e.target.value)}
          onKeyDown={onKeyDown}
        />
      </div>
      {!disabled && (
        <div className={scss.symbols}>
          <button type="button" onPointerDown={(e) => e.preventDefault()} onClick={() => insert("  ")}>
            Tab
          </button>
          {symbols.map((el) => (
            <button
              type="button"
              key={el}
              onPointerDown={(e) => e.preventDefault()}
              onClick={() => insert(el)}
            >
              {el}
            </button>
          ))}
        </div>
      )}
    </div>
  );
};

export default CodeEditor;
