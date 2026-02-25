import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

# Initial parameters
A0 = 1.0
B0 = 1.0
C0 = 0.0
D0 = 0.0
theta0 = 0.0

x_wave = np.linspace(0, 2 * np.pi, 1000)

fig = plt.figure(figsize=(12, 6))
plt.subplots_adjust(bottom=0.35)

# Layout: circle left, wave right
ax_circle = fig.add_subplot(121)
ax_wave = fig.add_subplot(122)

# Sliders
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


def update(val):
    A = sA.val
    B = sB.val
    C = sC.val
    D = sD.val
    theta = sTheta.val

    ax_circle.clear()
    ax_wave.clear()

    # ---- UNIT CIRCLE ----
    circle = plt.Circle((0, 0), 1, fill=False)
    ax_circle.add_patch(circle)

    x_c = np.cos(theta)
    y_c = np.sin(theta)

    ax_circle.plot([0, x_c], [0, y_c])  # radius
    ax_circle.scatter(x_c, y_c, s=100)

    ax_circle.axhline(0, linewidth=1)
    ax_circle.axvline(0, linewidth=1)

    ax_circle.set_aspect("equal")
    ax_circle.set_xlim(-1.5, 1.5)
    ax_circle.set_ylim(-1.5, 1.5)
    ax_circle.set_title("Unit Circle")

    # ---- WAVE ----
    y_wave = A * np.sin(B * x_wave + C) + D
    ax_wave.plot(x_wave, y_wave, linewidth=2)

    # current projected point
    y_proj = A * np.sin(B * theta + C) + D

    ax_wave.scatter(theta, y_proj, s=100)
    ax_wave.axvline(theta, linestyle="--")

    ax_wave.set_xlim(0, 2 * np.pi)
    ax_wave.set_ylim(-4, 4)

    ax_wave.set_xticks([0, np.pi / 2, np.pi, 3 * np.pi / 2, 2 * np.pi])
    ax_wave.set_xticklabels(["0", "π/2", "π", "3π/2", "2π"])

    period = 2 * np.pi / B
    ax_wave.set_title(f"Sine Wave   Period = {period:.2f}")

    fig.canvas.draw_idle()


sA.on_changed(update)
sB.on_changed(update)
sC.on_changed(update)
sD.on_changed(update)
sTheta.on_changed(update)

update(None)

plt.show()
