
import sys

letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def carregaDicionario():
    dic = open('dicionario.txt')
    Words = {}
    for word in dic.read().split('\n'):
        Words[word] = None
    dic.close()
    return Words



def getEnglishCount(message):
    english_words = carregaDicionario()
    message = message.upper()
    message = removeNonLetters(message)
    possibleWords = message.split() # divide em palavras

    if possibleWords == []:
        return -1

    matches = 0
    for word in possibleWords:
        if word in english_words:
            matches += 1
    return float(matches) / len(possibleWords)


def removeNonLetters(message): # remove pontuação
    caracteres_admissiveis = letters + letters.lower() + ' \t\n'
    lettersOnly = []
    for symbol in message:
        if symbol in caracteres_admissiveis:
            lettersOnly.append(symbol)
    return ''.join(lettersOnly)


def isEnglish(message, wordPercentage=20, letterPercentage=85):
    # By default, 20% of the words must exist in the dictionary file, and
    # 85% of all the characters in the message must be letters or spaces

    wordsMatch = getEnglishCount(message) * 100 >= wordPercentage
    numLetters = len(removeNonLetters(message))
    messageLettersPercentage = float(numLetters) / len(message) * 100
    lettersMatch = messageLettersPercentage >= letterPercentage
    return wordsMatch and lettersMatch

def gcd(a, b):
    # Return the Greatest Common Divisor of a and b using Euclid's Algorithm
    while a != 0:
        a, b = b % a, a
    return b


def findModInverse(a, m):
    # Return the modular inverse of a % m, which is
    # the number x such that a*x % m = 1

    if gcd(a, m) != 1:
        return None # No mod inverse exists if a & m aren't relatively prime.

    # Calculate using the Extended Euclidean Algorithm:
    u1, u2, u3 = 1, 0, a
    v1, v2, v3 = 0, 1, m
    while v3 != 0:
        q = u3 // v3 # Note that // is the integer division operator
        v1, v2, v3, u1, u2, u3 = (u1 - q * v1), (u2 - q * v2), (u3 - q * v3), v1, v2, v3
    return u1 % m


def getKeyParts(key):
    keyA = key // 26
    keyB = key % 26
    return (keyA, keyB)


def checkKeys(keyA, keyB):
    if keyA < 0 or keyB < 0 or keyB > 26 - 1:
        sys.exit('Key A must be greater than 0 and Key B must be between 0 and %s.' % (26 - 1))
    if gcd(keyA, 26) != 1:
        sys.exit('Key A (%s) and the symbol set size (%s) are not relatively prime. Choose a different key.' % (keyA, 26))




def decryptMessage(key, message):
    keyA, keyB = getKeyParts(key)
    checkKeys(keyA, keyB)
    plaintext = ''
    modInverseOfKeyA = findModInverse(keyA, 26)

    for symbol in message:
        if symbol in letters:
            # Decrypt the symbol:
            symbolIndex = letters.find(symbol)
            plaintext += letters[(symbolIndex - keyB) * modInverseOfKeyA % 26]
        else:
            plaintext += symbol
    return plaintext.lower()




def main():
    
    with open("cripto2.txt") as f:
        myMessage = f.read()
    
    hackAffine(myMessage)
    
    


def hackAffine(message):
   
    # Brute-force by looping through every possible key
    for key in range(26 ** 2):
        keyA = getKeyParts(key)[0]
        if gcd(keyA, 26) != 1:
            continue

        decryptedText = decryptMessage(key, message)
        print('Tried Key %s... (%s)' % (key, decryptedText[:40]))

        if isEnglish(decryptedText):
            # Check with the user if the decrypted key has been found.
            print()
            print('Decrypted message: ' + decryptedText)
            print()
            break
    
    return None



if __name__ == '__main__':
    main()