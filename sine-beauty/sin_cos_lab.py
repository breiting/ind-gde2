import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

# Initial values
A0 = 1.0
B0 = 1.0
C0 = 0.0
D0 = 0.0
theta0 = 0.0

x_wave = np.linspace(0, 2 * np.pi, 1000)

fig = plt.figure(figsize=(14, 6))
plt.subplots_adjust(bottom=0.35)

ax_circle = fig.add_subplot(121)
ax_wave = fig.add_subplot(122)

# ------------------------
# Sliders
# ------------------------
ax_A = plt.axes([0.1, 0.25, 0.8, 0.03])
ax_B = plt.axes([0.1, 0.2, 0.8, 0.03])
ax_C = plt.axes([0.1, 0.15, 0.8, 0.03])
ax_D = plt.axes([0.1, 0.1, 0.8, 0.03])
ax_theta = plt.axes([0.1, 0.05, 0.8, 0.03])

sA = Slider(ax_A, "Amplitude (A)", -3.0, 3.0, valinit=A0)
sB = Slider(ax_B, "Frequency (B)", 0.1, 5.0, valinit=B0)
sC = Slider(ax_C, "Phase (C)", -np.pi, np.pi, valinit=C0)
sD = Slider(ax_D, "Vertical (D)", -3.0, 3.0, valinit=D0)
sTheta = Slider(ax_theta, "Angle θ", 0.0, 2 * np.pi, valinit=theta0)

# Kräftige Farben
color_sin = "#1F77B4"  # kräftiges Blau
color_cos = "#FF7F0E"  # kräftiges Orange
color_circle = "#2C3E50"  # dunkles Grau für Kreis
color_proj_sin = "#1F77B4"
color_proj_cos = "#FF7F0E"
color_grid = "#B0B0B0"


def update(val):
    A = sA.val
    B = sB.val
    C = sC.val
    D = sD.val
    theta = sTheta.val

    ax_circle.clear()
    ax_wave.clear()

    # =========================
    # UNIT CIRCLE
    # =========================
    circle = plt.Circle((0, 0), 1, fill=False, linewidth=2, color=color_circle)
    ax_circle.add_patch(circle)

    x_c = np.cos(theta)
    y_c = np.sin(theta)

    # radius
    ax_circle.plot([0, x_c], [0, y_c], linewidth=2, color=color_circle)

    # projections
    ax_circle.plot(
        [x_c, x_c], [0, y_c], linestyle="--", color=color_proj_sin
    )  # vertical (sin)
    ax_circle.plot(
        [0, x_c], [y_c, y_c], linestyle="--", color=color_proj_cos
    )  # horizontal (cos)

    ax_circle.scatter(x_c, y_c, s=100, color=color_proj_sin)
    ax_circle.scatter(x_c, 0, s=100, color=color_proj_cos)
    ax_circle.text(x_c / 2, y_c / 2, "θ", fontsize=12)

    ax_circle.set_aspect("equal")
    ax_circle.set_xlim(-1.5, 1.5)
    ax_circle.set_ylim(-1.5, 1.5)
    ax_circle.axhline(0, linewidth=1, color=color_grid)
    ax_circle.axvline(0, linewidth=1, color=color_grid)
    ax_circle.set_title(
        "Unit Circle\nVertical = sin(θ) | Horizontal = cos(θ)", fontsize=12
    )

    # =========================
    # WAVES
    # =========================
    y_sin = A * np.sin(B * x_wave + C) + D
    y_cos = A * np.cos(B * x_wave + C) + D

    ax_wave.plot(x_wave, y_sin, label="sin", linewidth=2, color=color_sin)
    ax_wave.plot(x_wave, y_cos, label="cos", linewidth=2, color=color_cos)

    # current points
    y_sin_p = A * np.sin(B * theta + C) + D
    y_cos_p = A * np.cos(B * theta + C) + D

    ax_wave.scatter(theta, y_sin_p, s=80, color=color_sin)
    ax_wave.scatter(theta, y_cos_p, s=80, color=color_cos)

    # vertikale Führungslinie
    ax_wave.axvline(theta, linestyle="--", color=color_grid)

    # Horizontale gridlines
    ax_wave.axhline(0, linestyle="--", color=color_grid, linewidth=1)

    # Vertikale gridlines bei π-Teilungen
    for xi in [0, np.pi / 2, np.pi, 3 * np.pi / 2, 2 * np.pi]:
        ax_wave.axvline(xi, linestyle="--", color=color_grid, linewidth=1)

    ax_wave.set_xlim(0, 2 * np.pi)
    ax_wave.set_ylim(-4, 4)
    ax_wave.set_xticks([0, np.pi / 2, np.pi, 3 * np.pi / 2, 2 * np.pi])
    ax_wave.set_xticklabels(["0", "π/2", "π", "3π/2", "2π"])

    period = 2 * np.pi / B
    ax_wave.set_title(f"Sine & Cosine   Period = {period:.2f}", fontsize=12)
    ax_wave.legend()

    fig.canvas.draw_idle()


sA.on_changed(update)
sB.on_changed(update)
sC.on_changed(update)
sD.on_changed(update)
sTheta.on_changed(update)

update(None)
plt.show()
