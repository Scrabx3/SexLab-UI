/**
 * The NumericStepper component displays a single number in the range assigned to it, and supports the ability to increment and decrement the value based on an arbitrary step size.

	<b>Inspectable Properties</b>
	A MovieClip that derives from the NumericStepper component will have the following inspectable properties:<ul>
	<li><i>visible</i>: Hides the component if set to false.</li>
	<li><i>disabled</i>: Disables the component if set to true.</li>
	<li><i>value</i>: The numeric value displayed by the NumericStepper.</li>
	<li><i>minimum</i>: The minimum value of the NumericStepper’s range.</li>
	<li><i>maximum</i>: The maximum value of the NumericStepper’s range.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overridden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overridden from the game engine using GFx FunctionObjects.</li></ul>

	<b>States</b>
	The NumericStepper component supports three states based on its focused and disabled properties. <ul>
	<li>default or enabled state.</li>
	<li>focused state, that highlights the textField area.</li>
	<li>disabled state.</li></ul>

	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>

	The events generated by the NumericStepper component are listed below. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component's visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component's visible property has been set to false at runtime.</li>
	<li><i>change</i>: The NumericStepper’s value has changed.</li>
	<li><i>stateChange</i>: The NumericStepper’s focused or disabled property has changed.<ul>
		<li><i>state</i>: Name of the new state. String type. Values "default", "focused" or "disabled".</li></ul></li></ul>
 */


import gfx.controls.Button;
import gfx.core.UIComponent;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import gfx.utils.Constraints;


[InspectableList("disabled", "visible", "maximum", "minimum", "value", "enableInitCallback", "soundMap")]
class gfx.controls.NumericStepper extends UIComponent
{
	/* PUBLIC VARIABLES */

	/** The amount the value is incremented or decremented. */
	[Inspectable(defaultValue="1")]
	public var stepSize: Number = 1;
	/** Mapping between events and sound process **/
	[Inspectable(type="Object", defaultValue="theme:default,focusIn:focusIn,focusOut:focusOut,change:change")]
	public var soundMap: Object = { theme: "default", focusIn: "focusIn", focusOut: "focusOut", change: "change" };


	/* PRIVATE VARIABLES */

	private var _labelFunction: Function;
	private var _maximum: Number = 10;
	private var _minimum: Number = 0;
	private var _stepSize: Number;
	private var _value: Number = 0;
	private var constraints: Constraints;


	/* STAGE ELEMENTS */

	/** An optional Button used to increment the {@code value}. */
	public var nextBtn: Button;
	/** An optional Button used to decrement the {@code value}. */
	public var prevBtn: Button;
	/** The TextField label used to display the {@code value}. Note that when state changes are made, the textField instance may change, so changes made to it externally may be lost. */
	public var textField: TextField;


	/* INITIALIZATION */

	/**
	 * The constructor is called when a NumericStepper or a sub-class of NumericStepper is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend NumericStepper, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function NumericStepper()
	{
		super();
		tabChildren = false;
		focusEnabled = tabEnabled = !_disabled;
	}


	/* PUBLIC FUNCTIONS */

	/**
	 * The maximum allowed value. The {@code value} property will always be less than or equal to the {@code maximum}.
	 */
	[Inspectable(defaultValue="10")]
	public function get maximum(): Number
	{
		return _maximum;
	}


	public function set maximum(value: Number): Void
	{
		_maximum = value;
		value = _value;
	}


	/**
	 * The minimum allowed value. The {@code value} property will always be greater than or equal to the {@code minimum}.
	 */
	[Inspectable(defaultValue="0")]
	public function get minimum(): Number
	{
		return _minimum;
	}


	public function set minimum(value: Number): Void
	{
		_minimum = value;
		value = _value;
	}


	/**
	 * The value of the numeric stepper. The {@code value} property will always be kept between the {@code minimum} and {@code maximum}.
	 * @see #minimum
	 * @see #maximum
	 */
	[Inspectable(name="value", defaultValue="0")]
	public function get value(): Number
	{
		return _value;
	}


	public function set value(v: Number): Void
	{
		v = lockValue(v);
		if (v == _value) {
			return;
		}

		_value = v;
		if (initialized) {
			dispatchEventAndSound({type: "change"});
		}

		invalidate();
	}


	/**
	 * Disable this component. Focus (along with keyboard events) and mouse events will be suppressed if disabled.
	 */
	[Inspectable(defaultValue="false", verbose="1")]
	public function get disabled(): Boolean
	{
		return _disabled;
	}


	public function set disabled(value: Boolean): Void
	{
		if (_disabled == value) {
			return;
		}

		super.disabled = value;
		focusEnabled = tabEnabled = !_disabled;
		gotoAndPlay(_disabled ? "disabled" : (_focused ? "focused" : "default"));
		if (!initialized) {
			return;
		}

		updateAfterStateChange();
		prevBtn.disabled = nextBtn.disabled = _disabled;
	}


	/**
	 * The function used to determine the label.
	 */
	public function get labelFunction(): Function
	{
		return _labelFunction;
	}


	public function set labelFunction(value: Function): Void
	{
		_labelFunction = value;
		updateLabel();
	}


	/**
	 * Increment the {@code value} of the NumericStepper, using the {@code stepSize}.
	 */
	public function increment(): Void
	{
		onNext(null);
	}


	/**
	 * Decrement the {@code value} of the NumericStepper, using the {@code stepSize}.
	 */
	public function decrement(): Void
	{
		onPrev(null);
	}


	public function handleInput(details: InputDetails, pathToFocus: Array): Boolean
	{
		var keyPress:Boolean =(details.value == "keyDown" || details.value == "keyHold");
		switch (details.navEquivalent) {
			case NavigationCode.RIGHT:
				if (_value < _maximum) {
					if (keyPress) {
						onNext(null);
					}
					return true;
				}
				break;
			case NavigationCode.LEFT:
				if (_value > _minimum) {
					if (keyPress) {
						onPrev(null);
					}
					return true;
				}
				break;

			case NavigationCode.HOME:
				if (!keyPress) {
					value = _minimum;
				}
				return true;
			case NavigationCode.END:
				if (!keyPress) {
					value = _maximum;
				}
				return true;
		}
		return false;
	}


	/** @exclude */
	public function toString(): String
	{
		return "[ Scaleform NumericStepper: " + _name + "]";
	}


	/* PRIVATE FUNCTIONS */

	private function configUI(): Void
	{
		nextBtn.addEventListener("click", this ,"onNext");
		prevBtn.addEventListener("click", this, "onPrev");
		nextBtn.focusTarget = prevBtn.focusTarget = this;
		nextBtn.tabEnabled = prevBtn.tabEnabled = false;
		nextBtn.autoRepeat = prevBtn.autoRepeat = true;
		prevBtn.disabled = nextBtn.disabled = _disabled;

		constraints = new Constraints(this,true);
		constraints.addElement(textField, Constraints.LEFT | Constraints.RIGHT);
		super.configUI();
	}


	private function draw(): Void
	{
		if (sizeIsInvalid) {
			_width = __width;
			_height = __height;
		}

		if (constraints != null) {
			constraints.update(__width, __height);
		}

		updateLabel();
	}


	private function changeFocus(): Void
	{
		gotoAndPlay(_disabled ? "disabled" : _focused ? "focused" : "default");
		updateAfterStateChange();
		prevBtn.displayFocus = nextBtn.displayFocus = (_focused != 0);
	}


	private function updateAfterStateChange(): Void
	{
		if (constraints != null) {
			constraints.update(__width, __height);
		}

		updateLabel();
		dispatchEvent({type: "stateChange", state: _disabled ? "disabled" : _focused ? "focused" : "default"});
	}


	private function onNext(evtObj: Object): Void
	{
		value = _value + stepSize;
	}


	private function onPrev(evtObj: Object): Void
	{
		value = _value - stepSize;
	}


	// Lock the value to the step size and min/max
	private function lockValue(value: Number): Number
	{
		var newVal:Number = Math.max(_minimum, Math.min(_maximum, stepSize * Math.round(value / stepSize)));
		return newVal;
	}


	private function updateLabel(): Void
	{
		var label:String = _value.toString();
		if (_labelFunction != null) {
			label = _labelFunction(_value);
		}
		textField.text = label;
	}
}
