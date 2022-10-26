#!/usr/bin/pyth

import os, sys
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import cmac
from cryptography.hazmat.backends import default_backend
# import relevant cryptographic primitives

AES_BLOCK_LENGTH = 16 # bytes
AES_KEY_LENGTH = 32 # bytes



# Insecure CBCMAC.
def cbcmac(key, msg):
  if not _validate_key_and_msg(key, msg): return False
  IV=b'}Me\xc7\x13\xfdq\xc9\xc7zU+\xd5;l\xe7'#  IV usado na primeira situação 

  # Implement CBCMAC with either a random IV, or with a tag consisting of all
  # ciphertext blocks.
  sms = bytes([_a ^ _b for _a, _b in zip(msg[:16], IV)])#XOR do primeiro bloco da mensagem com IV
  cipher = Cipher(algorithms.AES(key), modes.CBC(IV), backend=default_backend())#encriptar o primeiro bloco da mensagem, que corresponde aos primeiros 16 bytes
  encryptor = cipher.encryptor()
  t = encryptor.update(sms)
  
  
  sms1 = bytes([_a ^ _b for _a, _b in zip(t, msg[-16:])])#XOR do resultado anterior com os último 16 bytes da mensagem
  encryptor1 = cipher.encryptor()#encriptar o segundo bloco da mensagem, que corresponde aos últimos 16 bytes
  tag = encryptor1.update(sms1)#tag final
  
  return tag
  # return tag

def verify(key, msg, tag):
  if not _validate_key_and_msg(key, msg): return False

  IV1 = b'Y\xe7\x12@\xbd]\x181\x94d?\x84\xf0\x83C '#IV na nova situação
  IV=b'}Me\xc7\x13\xfdq\xc9\xc7zU+\xd5;l\xe7'#IV usado na primeira situação
  
  # If parameters are valid, then recalculate the mac.
  # Implement this recalculation.
  sms = bytes([_a ^ _b for _a, _b in zip(msg[:16], IV1)])#XOR do primeiro bloco da mensagem com IV
  cipher = Cipher(algorithms.AES(key), modes.CBC(IV), backend=default_backend())#encriptar os 16 primeiros bytes da nova mensagem
  encryptor = cipher.encryptor()
  t = encryptor.update(sms)
  
  
  sms1 = bytes([_a ^ _b for _a, _b in zip(t, msg[-16:])])##XOR do resultado anterior com os último 16 bytes da mensagem
  encryptor1 = cipher.encryptor()#encriptar os últimos 16 bytes da nova mensagem
  tag1 = encryptor1.update(sms1)#tag final
  


  
  if tag == tag1:#verifica se a tag que recebeu é igual à que foi computada anteriormente
    return True
  else:
    return False

  


# Receives a pair consisting of a message, and a valid tag.
# Outputs a forged pair (message, tag), where message must be different from the
# received message (msg).
# ---> Note that the key CANNOT be used here! <---
def produce_forgery(msg, tag):

  # Implement a forgery, that is, produce a new pair (m, t) that fools the
  # verifier.
  IV=b'}Me\xc7\x13\xfdq\xc9\xc7zU+\xd5;l\xe7'#IV usado na primeira situação
  IV1 = b'Y\xe7\x12@\xbd]\x181\x94d?\x84\xf0\x83C '#IV na nova situação

  sms = bytes([_a ^ _b for _a, _b in zip(msg[:16], IV)]) #primeiro bloco da mensagem, que corresponde aos primeiros 16 bytes

  r = bytes([_a ^ _b for _a, _b in zip(sms, IV1)])#os novos 16 bytes da mensagem. Correspondem ao XOR de um novo IV(IV1) com os primeiros 16 bytes da mensagem inicial

  new_msg = r + msg[-16:]#nova mensagem. Os primeiros 16 bytes são diferentes e os últimos 16 são iguais à da mensagem inicial

  
  
  
  
  new_tag = tag #nova tag corresponde à tag anterior


  return (new_msg, new_tag)

def check_forgery(key, new_msg, new_tag, original_msg):
  if new_msg == original_msg:
    print("Having the \"forged\" message equal to the original " +
        "one is not allowed...")
    return False

  if verify(key, new_msg, new_tag) == True:
    print("MAC successfully forged!")
    return True
  else:
    print("MAC forgery attempt failed!")
    return False

def _validate_key_and_msg(key, msg):
  if type(key) is not bytes:
    print("Key must be array of bytes!")
    return False
  elif len(key) != AES_KEY_LENGTH:
    print("Key must be have %d bytes!" % AES_KEY_LENGTH)
    return False
  if type(msg) is not bytes:
    print("Msg must be array of bytes!")
    return False
  elif len(msg) != 2*AES_BLOCK_LENGTH:
    print("Msg must be have %d bytes!" % (2*AES_BLOCK_LENGTH))
    return False
  return True

def main():
  key = b'\xe3\xe0\x1e\x19X\xa6\xf8\x8bq\xd9>C\xc8\x13_\xb5\xcc\x93\xa9E\xc2\xf1\xcf\x13\xd2\x85:\x88S\x9af\xb9'
  msg = b'\x02\xda_\xe4\xc4\xcc\x93s\xef\x19\xb0\x02=eM\x83\xf9\x95<e\xa3a\xf1}\xe3\xbd\xa6\xef\xcar#e'

  tag = cbcmac(key, msg)
  

  (mprime,tprime) = produce_forgery(msg, tag)
  
  # GOAL: produce a (message, tag) that fools the verifier.
  check_forgery(key, mprime, tprime, msg)

if __name__ == '__main__':
  main()
