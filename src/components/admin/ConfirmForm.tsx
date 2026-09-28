"use client";

/** Formulaire (server action) qui demande confirmation avant envoi. */
export default function ConfirmForm({
  action,
  message,
  children,
  className,
  style,
}: {
  action: (fd: FormData) => void | Promise<void>;
  message: string;
  children: React.ReactNode;
  className?: string;
  style?: React.CSSProperties;
}) {
  return (
    <form
      action={action}
      className={className}
      style={style}
      onSubmit={(e) => {
        if (!window.confirm(message)) e.preventDefault();
      }}
    >
      {children}
    </form>
  );
}
