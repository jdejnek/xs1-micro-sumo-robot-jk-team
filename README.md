## XS1 Micro Sumo Robot

Meet the XS1 Micro Sumo — a tiny gladiator built from sensors, motors, and a stubborn will to push other robots out of the ring.

## Where to start

For ease of use, consider installing the Arduino IDE

`brew install --cask arduino-ide`

### The obvious next steps
#### Option A: Using the Arduino IDE
- Get familiar with the main code: `XS1-Micro-Sumo-Robot-Code.ino`.
- Open the sketch in the Arduino IDE, select the **Arduino Leonardo** board, and upload.
- Use the Serial Plotter to calibrate sensor thresholds.

#### Option B: Using Command Line (Recommended for Experts)
If you have `arduino-cli` installed, you can use the provided automation scripts:
- `./flash.sh`: Compiles and flashes the robot.
- `./sensor.sh`: Opens the serial monitor to view sensor data.

### Starting the Robot
Since this robot configuration has **no physical buttons**, it is programmed to start via a sensor trigger:
1. Power on the robot. It will enter a wait state.
2. **Hold your hand in front of the opponent sensors** (Front, Left, or Right) for about 1 second.
3. The LEDs will begin blinking for the 5-second countdown.
4. The match begins!

### Physics & Stopping
The code in `XS1-Micro-Sumo-Robot-Code.ino` includes advanced stopping and recovery logic:
- **Active Braking**: Brief motor locking before reversing to kill forward momentum at the edge.
- **Max Torque Retreat**: Uses full speed for edge recovery regardless of current base speed.
- **Recovery Flip**: Detects when the robot has fallen over (via high line sensor contrast) and executes a lunge maneuver to right itself.
- **Rear Detection (Searching)**: If no opponent is seen for 2 seconds, it performs a 180° spin to find opponents attacking from the rear.
- **Auto-Stop**: If the robot detects absolutely nothing for more than **5 seconds**, it will automatically stop its motors to avoid unnecessary movement or damage.
- **Debounced Detection**: Prevents false triggers from scratches while maintaining fast response.

And the get creative!

## Reference

For more details about the robot and its sensors, see the original walkthrough:

https://blog.jsumo.com/xs1-micro-sumo-arduino-code-explanation-of-the-robot-code/
