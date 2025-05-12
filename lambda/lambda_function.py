import boto3
import json

polly_client = boto3.client('polly')

def lambda_handler(event, context):
    text_to_speak = event.get('text', 'Hello from AWS Polly!')
    
    try:
        response = polly_client.synthesize_speech(
            Text=text_to_speak,
            OutputFormat='mp3',
            VoiceId='Joanna'
        )
        
        audio_stream = response['AudioStream']
        
        # You can upload it to S3 or return the stream (just an example here)
        return {
            'statusCode': 200,
            'body': 'Speech synthesis successful!',
            'headers': {'Content-Type': 'audio/mp3'},
            'audio_stream': audio_stream.read()
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': f"Error: {str(e)}"
        }