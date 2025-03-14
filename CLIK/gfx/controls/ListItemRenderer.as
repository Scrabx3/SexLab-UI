/**
 * The ListItemRenderer derives from the CLIK Button class and extends it to include list-related properties that are useful for its container components.  However, it is not designed to be a standalone component, instead it is only used in conjunction with the ScrollingList, TileList and DropdownMenu components.


	<b>Inspectable Properties</b>
	Since the ListItemRenderer’s are controlled by a container component and never configured manually by a user, they contain only a small subset of the inspectable properties of the Button.

	<li><i>label</i>: Sets the label of the ListItemRenderer.</li>
	<li><i>visible</i>: Hides the button if set to false.</li>
	<li><i>disabled</i>: Disables the button if set to true.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overridden from the game engine using GFx FunctionObjects.</li>
	<li><i>soundMap</i>: Mapping between events and sound process. When an event is fired, the associated sound process will be fired via _global.gfxProcessSound, which should be overridden from the game engine using GFx FunctionObjects.</li></ul>

	<b>States</b>
	Since it can be selected inside a container component, the ListItemRenderer requires the selected set of keyframes to denote its selected state. This component’s states include <ul>
	<li>an up or default state.</li>
	<li>an over state when the mouse cursor is over the component, or when it is focused.</li>
	<li>a down state when the button is pressed.</li>
	<li>a disabled state.</li>
	<li>a selected_up or default state.</li>
	<li>a selected_over state when the mouse cursor is over the component, or when it is focused.</li>
	<li>a selected_down state when the button is pressed.</li>
	<li>a selected_disabled state.</li></ul>

	These are the minimal set of keyframes that should be in a ListItemRenderer. The extended set of states and keyframes supported by the Button component, and consequently the ListItemRenderer component, are described in the Getting Started with CLIK Buttons document.

	<b>Events</b>
	All event callbacks receive a single Object parameter that contains relevant information about the event. The following properties are common to all events. <ul>
	<li><i>type</i>: The event type.</li>
	<li><i>target</i>: The target that generated the event.</li></ul>

	The events generated by the ListItemRenderer component are the same as the Button component. The properties listed next to the event are provided in addition to the common properties.<ul>
	<li><i>show</i>: The component's visible property has been set to true at runtime.</li>
	<li><i>hide</i>: The component's visible property has been set to false at runtime.</li>
	<li><i>focusIn</i>: The component has received focus.</li>
	<li><i>focusOut</i>: The component has lost focus.</li>
	<li><i>select</i>: The component's selected property has changed.<ul>
		<li><i>selected</i>: The selected property of the Button. Boolean property. </li></ul></li>
	<li><i>stateChange</i>: The button's state has changed.<ul>
		<li><i>state</i>: The Button's new state. String type, Values "up", "over", "down", etc. </li></ul></li>
	<li><i>rollOver</i>: The mouse cursor has rolled over the button.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>rollOut</i>: The mouse cursor has rolled out of the button.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3. /li></ul></li>
	<li><i>press</i>: The button has been pressed.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>doubleClick</i>: The button has been double clicked. Only fired when the {@link Button.doubleClickEnabled} property is set.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>click</i>: The button has been clicked.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>dragOver</i>: The mouse cursor has been dragged over the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>dragOut</i>: The mouse cursor has been dragged out of the button (while the left mouse button is pressed).<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li>
	<li><i>releaseOutside</i>: The mouse cursor has been dragged out of the button and the left mouse button has been released.<ul>
		<li><i>controllerIdx</i>: The index of the mouse cursor used to generate the event (applicable only for multi-mouse-cursor environments). Number type. Values 0 to 3.</li></ul></li></ul>
 */


import gfx.controls.Button;
import gfx.controls.CoreList;


[InspectableList("disabled", "visible", "labelID", "disableConstraints", "enableInitCallback")]
class gfx.controls.ListItemRenderer extends Button
{
	/* PUBLIC VARIABLES */

	/** The current index of the data that the itemRenderer contains. */
	public var index: Number;
	/** The component instance that owns this renderer. */
	public var owner: CoreList;
	/** Determines if the item renderer can be interacted with.
	 * @todo Non-selectable items are skipped when scrolling through the list
	 */
	public var selectable: Boolean = true;

    /** Whether or not this component should fire a callback to the engine after initialization */
	/** ListItemRenderers are usually set by the list itself via the data provider, and thus should not have their init callbacks be set by default. */
	[Inspectable(defaultValue="false", verbose=1)]
	public var enableInitCallback: Boolean = false;


	/* INITIALIZATION */

	/**
	 * The constructor is called when a ListItemRenderer or a sub-class of ListItemRenderer is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend ListItemRenderer, ensure that a {@code super()} call is made first in the constructor.
	 */
	public function ListItemRenderer()
	{
        super();
        soundMap = { }; // Remove the soundMap for ListItemRenderer. Lists will handle dispatching sound events for their renderers.
    }


	/* PUBLIC FUNCTIONS */

	/**
	 * Set the selected state of the Button. Buttons can have two sets of mouse states, a selected and unselected. When a Button's {@code toggle} property is {@code true} the selected state will be changed when the button is clicked, however the selected state can be set using ActionScript even if the toggle property is false.
	 */
	[Inspectable(defaultValue="false")]
	public function get selected(): Boolean
	{
		return _selected;
	}


	public function set selected(value: Boolean): Void
	{
		super.selected = value;

        var bDisplayFocus: Boolean = false;
        var ownerFocusTarget: Object;
        if (value && owner) {
            bDisplayFocus = owner.focused > 0;
            if (!bDisplayFocus) {
				ownerFocusTarget = owner.focusTarget;	// if the owner wasn't focused, check whether it had a focus target (eg. scrolling list for drop down menu).
			}

            if (ownerFocusTarget && ownerFocusTarget.focused) {
				bDisplayFocus = true;
			}
        }

        displayFocus = (value && bDisplayFocus);
	}


	/**
	 * Set the list data relevant to the itemRenderer.  Each time the item changes, or is redrawn by the {@code owner}, the itemRenderer is updated using this method.
	 * @param index The index of the data the itemRenderer represents.
	 * @param label The calculated label the itemRenderer should display.
	 * @param selected The selected state of the itemRenderer.
	 */
	public function setListData(index: Number, label: String, selected: Boolean): Void
	{
		this.index = index;
		if (label == null) {
			this.label = "Empty";
		} else {
			this.label = label;
		}
		state = "up";
		this.selected = selected;
	}


	/**
	 * Sets data from the {@code dataProvider} to the renderer.
	 * @param data The data associated with this itemRenderer.
	 */
	public function setData(data: Object): Void
	{
		this.data = data;
	}


	/** @exclude */
	public function toString(): String
	{
		return "[Scaleform ListItemRenderer " + _name + "]";
	}


	/* PRIVATE FUNCTIONS */

	private function configUI(): Void
	{
		super.configUI();
		focusTarget = owner; // The component sets the focusTarget to its owner instead of vice-versa.  This allows sub-classes to override this behaviour.
	}
}
