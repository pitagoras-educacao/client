<template>
	<div :id="id" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
		<div class="relative p-4 w-full max-w-2xl max-h-full">
			<div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
				<div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t">
					<h3 class="text-base font-bold text-gray-800 uppercase">
						{{ title }}
					</h3>
					<button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" @click="closeModal">
						<svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
							<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
						</svg>
						<span class="sr-only">Close modal</span>
					</button>
				</div>
				<div class="p-4 md:p-5 space-y-4">
					<slot name="body"></slot>
				</div>
				<div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
					<slot name="footer"></slot>
				</div>
			</div>
		</div>
	</div>
</template>

<script lang="ts">
import { Modal } from 'flowbite';
import { defineComponent } from 'vue';


export default defineComponent({

	props: {
		id: String,
		title: String,
		active: Number,
	},

	data()
	{
		return { modal: {} as Modal };
	},

	methods: {
		
		openModal()
		{
			if (this.modal)
				this.modal.show();
		},

		closeModal()
		{
			if (this.modal)
				this.modal.hide();
		}

	},

	watch: {
	
		active()
		{
			if (this.active)
				this.openModal();
			else
				this.closeModal();
		}

	},

	mounted()
	{
		this.modal = new Modal(
			document.getElementById(this.id as string)
		);
	}

})

</script>
