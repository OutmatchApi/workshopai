eval "$(conda shell.bash hook)"

conda activate diffusers

# Comment this out if you've already done it once:
# huggingface-cli login

# python heictojpg.py "./data/dog"

accelerate launch train_dreambooth.py \
  --pretrained_model_name_or_path="CompVis/stable-diffusion-v1-4"  \
  --instance_data_dir="./finaldatadirectory/15346d1d-22aa-4aaa-a3d2-69519fae432f" \
  --output_dir="./outputmodels/5fa729b5-89c9-4f90-bb93-5c86dd082ad9" \
  --instance_prompt="photo of sks dog" \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=1 \
  --learning_rate=5e-6 \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --max_train_steps=800

# python inference.py "fine-tuned-model-output/800" "a photo of sks dog wearing sunglasses"