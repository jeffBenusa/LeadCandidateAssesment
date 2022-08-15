import Glide from '@glidejs/glide'

const params = {
    type: 'carousel',
    perView: 1,
    focusAt: 'center',
    autoplay: 2500
}

new Glide('.glide', params).mount()