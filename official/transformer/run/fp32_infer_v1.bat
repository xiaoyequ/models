# Ensure that PYTHONPATH is correctly defined as described in
# https://github.com/tensorflow/models/tree/master/official#requirements
# works for TensorFlow r1.15
# PYTHONPATH=/nfs/pdx/home/cuixiaom/TensorFlow/py3mklr1.15/

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

OUTPUT_DIR=$ROOTDIR/Output/Transformer/Results

cd $TRANFORMERV1DIR

# Translate some text using the trained model
python3 translate.py --model_dir=$MODEL_DIR --vocab_file=$VOCAB_FILE \
    --param_set=$PARAM_SET --text="hello world"

# Compute model's BLEU score using the newstest2014 dataset.
#python3 translate.py --model_dir=$MODEL_DIR --vocab_file=$VOCAB_FILE \
#    --param_set=$PARAM_SET --file=$DATA_DIR/newstest2014_quick.en --file_out=$OUTPUT_DIR/translation.en
#python3 compute_bleu.py --translation=$OUTPUT_DIR/translation.en --reference=$DATA_DIR/newstest2014_quick.de
