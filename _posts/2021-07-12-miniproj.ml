---
layout: single
title: "미니프로젝트 개발문서 모델"
toc: true
toc_sticky: true
toc_label: "개발문서 모델"
categories: 개발문서
last_modified_at: 2021-07-12 T08:06:00-05:00
---

### ■ 개발 소프트웨어 이름 :  Blendy

#### ⊙ 요구사항
[문제 상황]  
내신 영어시험 서술형에서 항상 감점된다. 우리학교는 서술형 채점 기준이 몹시 까다로워 관사나 세세한 단어 하나까지 다르게 적어서는 안되기 떄문. 따라서 영어 단어 배열 연습을 통해 문장 통암기를 용이하게 하고자 한다.

[작업 조건]  
- 동일 폴더 내 "sentences.txt" 에 미리 교과서 지문 등을 입력해 놓음
- 


#### ⊙ 설계
1. 클래스를 사용해 문장 하나를 객체 하나에 대응시킨다.
2. 문장 전체를 리스트로 볼러온다 (readlines() 사용) 
3. 각 문장의 원본, 리스트로 쪼개진 단어들, 섞인 리스트, 섞인 문장을 인스턴스 변수로 선언
4. 사용자가 프로그램을 시작하면 바로 테스트를 시작함
5. 각 문항을 한번씩 풀고나면 마지막에 정답, 오답 개수 표시
6. 실행할 때마다 문장은 다르게 섞여야 함


#### ⊙ 구현
~~~python

import random as rdm

class Unscramble:
    def __init__(self,sentence):
        self.org = sentence.replace("\n","")
        self.orglist = self.org.split(" ")
        self.scrmlist = self.org.split(" ")
        rdm.shuffle(self.scrmlist)
        self.scrm = " / ".join(self.scrmlist)



correct = 0
incorrect = 0

def doTest(a):
    global correct
    global incorrect
    print("Unscramble it.")
    print(a.scrm)
    print("____________________________.\n")
    if a.org == input("Answer: "):
        print("Correct.\n")
        correct += 1
    else:
        print("Incorrect. The answer is:",a.org,"\n")
        incorrect += 1

input('''


$$\       $$\                           $$\           
$$ |      $$ |                          $$ |          
$$$$$$$\  $$ | $$$$$$\  $$$$$$$\   $$$$$$$ |$$\   $$\ 
$$  __$$\ $$ |$$  __$$\ $$  __$$\ $$  __$$ |$$ |  $$ |
$$ |  $$ |$$ |$$$$$$$$ |$$ |  $$ |$$ /  $$ |$$ |  $$ |
$$ |  $$ |$$ |$$   ____|$$ |  $$ |$$ |  $$ |$$ |  $$ |
$$$$$$$  |$$ |\$$$$$$$\ $$ |  $$ |\$$$$$$$ |\$$$$$$$ |
\_______/ \__| \_______|\__|  \__| \_______| \____$$ |
                                            $$\   $$ |
                                            \$$$$$$  |
                                             \______/ 

                                            
                                            

- 당신의 영어 시험 고민을 덜어드립니다.

sentences.txt에 문장을 차례대로 적은 후 
Enter 키를 눌러 시작해 주세요.

''')

sentences = []
s = open('sentences.txt', mode='rt', encoding='utf-8')
s = s.readlines()
n=1


for x in s:
    a = Unscramble(x)
    sentences.append(a)
    print(f"{n}. {x}",end="")
    n += 1


print("\n Test Start \n")



for y in sentences:

    doTest(y)

print("Correct:",correct)
print("Incorrect:",incorrect)
~~~

#### ⊙ 테스트
원본 데이터: sentences.txt  

Hello, I am Euntaek.
Great to see you!
I am 18 years old.
It is dangerous to eat them.


|실행 결과|  



$$\       $$\                           $$\           
$$ |      $$ |                          $$ |          
$$$$$$$\  $$ | $$$$$$\  $$$$$$$\   $$$$$$$ |$$\   $$\ 
$$  __$$\ $$ |$$  __$$\ $$  __$$\ $$  __$$ |$$ |  $$ |
$$ |  $$ |$$ |$$$$$$$$ |$$ |  $$ |$$ /  $$ |$$ |  $$ |
$$ |  $$ |$$ |$$   ____|$$ |  $$ |$$ |  $$ |$$ |  $$ |
$$$$$$$  |$$ |\$$$$$$$\ $$ |  $$ |\$$$$$$$ |\$$$$$$$ |
\_______/ \__| \_______|\__|  \__| \_______| \____$$ |
                                            $$\   $$ |
                                            \$$$$$$  |
                                             \______/ 

                                            
                                            

- 당신의 영어 시험 고민을 덜어드립니다.

sentences.txt에 문장을 차례대로 적은 후 
Enter 키를 눌러 시작해 주세요.


1. Hello, I am Euntaek.
2. Great to see you!
3. I am 18 years old.
4. It is dangerous to eat them.
 Test Start 

Unscramble it.
Hello, / I / Euntaek. / am
____________________________.

Answer: Hello, I am Euntaek.            
Correct.

Unscramble it.
Great / to / you! / see
____________________________.

Answer: Great to see you!
Correct.

Unscramble it.
old. / 18 / am / years / I
____________________________.

Answer: I old 18 years am.
Incorrect. The answer is: I am 18 years old. 

Unscramble it.
is / eat / to / dangerous / It / them.
____________________________.

Answer: It is dangerous to eat them.
Correct.

Correct: 3
Incorrect: 1

#### ⊙ 프로젝트 후 소감
어렵고 복잡한 코드를 만들지는 못했지만, 생활속 불편함을 실제로 해결할 수 있는 프로그램을 만든 것 같아서 기쁘다. 2학기에는 더 유용하고 고난도의 코드를 말어보고 싶다.
