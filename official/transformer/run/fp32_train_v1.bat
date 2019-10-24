# Ensure that PYTHONPATH is correctly defined as described in
# https://github.com/tensorflow/models/tree/master/official#requirements
# works for TensorFlow python3.6 mkl r1.15

# Export variables
PARAM_SET=big

ROOTDIR=/nfs/pdx/home/cuixiaom
LOCALDIR=/localdisk/cuixiaom
export SRCDIR=$ROOTDIR/Src/xiaoyequ/models
export TRANFORMERV1DIR=$SRCDIR/official/transformer
export PYTHONPATH="$PYTHONPATH:$SRCDIR"
DATA_DIR=$ROOTDIR/Data/transformer/data
MODEL_DIR=$ROOTDIR/Output/Transformer/model_$PARAM_SET
VOCAB_FILE=$DATA_DIR/vocab.ende.32768

cd $TRANFORMERV1DIR

# Train the model for 10 epochs, and evaluate after every epoch.
python3 transformer_main.py --data_dir=$DATA_DIR --model_dir=$MODEL_DIR --param_set=$PARAM_SET \
    --vocab_file=$VOCAB_FILE \
    --bleu_source=$DATA_DIR/newstest2014.en --bleu_ref=$DATA_DIR/newstest2014.de
