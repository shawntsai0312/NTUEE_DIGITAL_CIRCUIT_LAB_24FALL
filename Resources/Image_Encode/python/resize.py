from PIL import Image

def resize_image(width, height, input_path, output_path):
    with Image.open(input_path) as img:
        img = img.convert("RGBA")
        resized_img = img.resize((width, height))

        resized_img.save(output_path)
        
    return resize_image

# Example usage:
input = 'car.png'
output = input.replace('.png', '_resized.png')
width, height = 40, 40

resized_img = resize_image(width, height, input, output)