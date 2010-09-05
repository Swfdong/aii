package aii.deva.core.neuro {

	public class Neuron {
		protected var data:Vector.<uint>;

		public function Neuron(size:uint = 24):void {
			data = new Vector.<uint>(size * size, true);
		}
	}
}