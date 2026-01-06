---
layout: lesson
title: "Aula 5.4: Arquitetura Avançada"
slug: arquitetura
module: module-5
lesson_id: lesson-5-4
duration: "90 minutos"
level: "Expert"
prerequisites: ["lesson-5-3"]
exercises: []
permalink: /modules/praticas-avancadas-projeto-final/lessons/arquitetura/
---

## Introdução

Bem-vindo à aula mais estratégica do curso! Arquitetura de software não é apenas sobre organização de pastas - é sobre tomar decisões que impactarão a manutenibilidade, escalabilidade e testabilidade da sua aplicação pelos próximos anos. Nesta aula, você vai dominar os princípios e padrões que separam código amador de código profissional enterprise.

### O Contexto da Arquitetura no Desenvolvimento Moderno

A arquitetura de software evoluiu significativamente nas últimas décadas. O que começou com simples separação MVC (Model-View-Controller) evoluiu para arquiteturas mais sofisticadas como Clean Architecture, Hexagonal Architecture e Domain-Driven Design. Angular, por sua natureza enterprise, é o framework perfeito para aplicar esses conceitos avançados.

**Por que Arquitetura é Crítica?**
- **Manutenibilidade**: 80% do custo de software é manutenção
- **Escalabilidade**: Equipes grandes precisam de estrutura clara
- **Testabilidade**: Código bem arquitetado é fácil de testar
- **Onboarding**: Novos desenvolvedores entendem o código rapidamente
- **Evolução**: Mudanças de requisitos são implementadas com menor risco

### O que você vai aprender

Esta aula é dividida em seções progressivas que constroem seu conhecimento arquitetural:

#### 1. Clean Architecture no Angular
- Camadas de abstração e suas responsabilidades
- Regra de dependência e inversão de controle
- Implementação prática em projetos Angular
- Separação entre Domain, Application e Infrastructure

#### 2. Princípios SOLID Aplicados
- Single Responsibility Principle em Services e Components
- Open/Closed Principle com Strategy Pattern
- Liskov Substitution em hierarquias de componentes
- Interface Segregation em contratos de serviços
- Dependency Inversion com Angular DI

#### 3. Design Patterns para Angular
- Factory Pattern para criação dinâmica
- Strategy Pattern para algoritmos intercambiáveis
- Facade Pattern para simplificação de APIs
- Repository Pattern para abstração de dados
- Observer Pattern com RxJS

#### 4. Organização de Código
- Feature Modules e lazy loading
- Core e Shared Modules
- Barrel Exports para APIs limpas
- Estrutura de pastas escalável

### Por que isso é importante

**Para sua carreira**:
- Arquitetos de software são os profissionais mais bem pagos
- Conhecimento arquitetural é requisito para posições senior
- Capacidade de tomar decisões técnicas estratégicas
- Liderança técnica em equipes de desenvolvimento

**Para seus projetos**:
- Redução de bugs em produção
- Facilidade de implementar novas features
- Menor tempo de onboarding de novos membros
- Código que sobrevive a mudanças de requisitos

**Para seu aprendizado**:
- Princípios aplicáveis a qualquer linguagem ou framework
- Base para arquiteturas de microserviços
- Fundamento para Domain-Driven Design
- Preparação para certificações avançadas

### Evolução Histórica da Arquitetura de Software

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    EVOLUÇÃO DA ARQUITETURA DE SOFTWARE                   │
└─────────────────────────────────────────────────────────────────────────┘

1970s-1980s: Monolithic                    
├─ Código misturado                        
├─ Sem separação clara                     
└─ Difícil manutenção                      

1990s: MVC (Model-View-Controller)         
├─ Separação de responsabilidades          
├─ Model: dados e regras de negócio        
├─ View: apresentação                      
└─ Controller: lógica de fluxo             

2000s: Layered Architecture                
├─ Presentation Layer                      
├─ Business Logic Layer                    
├─ Data Access Layer                       
└─ Dependências top-down                   

2010s: Clean Architecture / Hexagonal      
├─ Domain no centro                        
├─ Dependências apontam para dentro        
├─ Ports and Adapters                      
└─ Testabilidade máxima                    

2020s: Micro-frontends + Domain-Driven     
├─ Bounded Contexts                        
├─ Event-Driven Architecture               
├─ CQRS (Command Query Responsibility Segregation)
└─ Serverless e Edge Computing             
```

---

## Conceitos Teóricos

### Clean Architecture

**Definição**: Clean Architecture é um padrão arquitetural criado por Robert C. Martin (Uncle Bob) que organiza código em camadas concêntricas, onde as dependências sempre apontam para dentro - das camadas externas para as internas. O objetivo é criar sistemas independentes de frameworks, UI, banco de dados e qualquer agência externa.

**Explicação Detalhada**:

Clean Architecture resolve um problema fundamental: como criar software que seja fácil de mudar? A resposta está na organização das dependências. Quando seu código de negócio depende de detalhes de infraestrutura (banco de dados, APIs externas, frameworks), mudanças nesses detalhes forçam mudanças no negócio. Clean Architecture inverte isso.

**Os Círculos da Clean Architecture**:

1. **Entities (Domain)**: Regras de negócio enterprise, independentes de aplicação
2. **Use Cases (Application)**: Regras de negócio específicas da aplicação
3. **Interface Adapters (Presentation)**: Conversão de dados entre camadas
4. **Frameworks & Drivers (Infrastructure)**: Detalhes técnicos externos

**A Regra de Dependência**: Dependências de código fonte só podem apontar para dentro. Nada em um círculo interno pode saber absolutamente nada sobre algo em um círculo externo.

**Analogia Detalhada**:

Imagine Clean Architecture como uma cebola ou um castelo medieval:

- **O Núcleo (Domain/Entities)** é o rei no centro do castelo. O rei não conhece os guardas nas muralhas, não sabe como funciona a ponte levadiça, não conhece os comerciantes na cidade. Ele só conhece as leis do reino (regras de negócio).

- **A Corte (Application/Use Cases)** são os conselheiros que implementam as decisões do rei. Eles conhecem o rei (domain), mas não sabem detalhes sobre as muralhas ou a cidade externa.

- **As Muralhas (Presentation/Adapters)** são os guardas que traduzem entre o mundo externo e a corte. Eles recebem visitantes (requests) e os apresentam adequadamente à corte.

- **A Cidade Externa (Infrastructure)** são os comerciantes, viajantes, outros reinos. Eles podem mudar completamente sem afetar o funcionamento interno do castelo.

**Visualização Detalhada**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         CLEAN ARCHITECTURE                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌───────────────────────────────────────────────────────────────────┐  │
│  │                    INFRASTRUCTURE (External)                       │  │
│  │  ┌─────────────────────────────────────────────────────────────┐  │  │
│  │  │                    PRESENTATION (Adapters)                   │  │  │
│  │  │  ┌───────────────────────────────────────────────────────┐  │  │  │
│  │  │  │                  APPLICATION (Use Cases)               │  │  │  │
│  │  │  │  ┌─────────────────────────────────────────────────┐  │  │  │  │
│  │  │  │  │                    DOMAIN                        │  │  │  │  │
│  │  │  │  │                                                  │  │  │  │  │
│  │  │  │  │              ┌──────────────────┐               │  │  │  │  │
│  │  │  │  │              │    ENTITIES      │               │  │  │  │  │
│  │  │  │  │              │  Business Rules  │               │  │  │  │  │
│  │  │  │  │              │   Value Objects  │               │  │  │  │  │
│  │  │  │  │              └──────────────────┘               │  │  │  │  │
│  │  │  │  │                                                  │  │  │  │  │
│  │  │  │  │  - Interfaces (Ports)                           │  │  │  │  │
│  │  │  │  │  - Domain Services                              │  │  │  │  │
│  │  │  │  │  - Aggregates                                   │  │  │  │  │
│  │  │  │  └─────────────────────────────────────────────────┘  │  │  │  │
│  │  │  │                                                        │  │  │  │
│  │  │  │  - Use Case Interactors                               │  │  │  │
│  │  │  │  - Input/Output DTOs                                  │  │  │  │
│  │  │  │  - Application Services                               │  │  │  │
│  │  │  └───────────────────────────────────────────────────────┘  │  │  │
│  │  │                                                              │  │  │
│  │  │  - Controllers / Components                                 │  │  │
│  │  │  - Presenters / ViewModels                                  │  │  │
│  │  │  - Gateways / Mappers                                       │  │  │
│  │  └─────────────────────────────────────────────────────────────┘  │  │
│  │                                                                    │  │
│  │  - Angular Framework                                              │  │
│  │  - HTTP Client / APIs                                             │  │
│  │  - Database / Storage                                             │  │
│  │  - External Services                                              │  │
│  └───────────────────────────────────────────────────────────────────┘  │
│                                                                         │
│                    ◄────────── DEPENDENCY RULE ──────────►              │
│                    (Dependencies point INWARD only)                     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Fluxo de Dados na Clean Architecture**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      DATA FLOW IN CLEAN ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  User Action                                                            │
│      │                                                                  │
│      ▼                                                                  │
│  ┌──────────────────┐                                                  │
│  │   Component      │  ← Presentation Layer                            │
│  │   (Controller)   │                                                  │
│  └────────┬─────────┘                                                  │
│           │                                                             │
│           │ Input DTO                                                   │
│           ▼                                                             │
│  ┌──────────────────┐                                                  │
│  │   Use Case       │  ← Application Layer                             │
│  │   (Interactor)   │                                                  │
│  └────────┬─────────┘                                                  │
│           │                                                             │
│           │ Domain Entity                                               │
│           ▼                                                             │
│  ┌──────────────────┐                                                  │
│  │   Repository     │  ← Domain Layer (Interface)                      │
│  │   (Interface)    │                                                  │
│  └────────┬─────────┘                                                  │
│           │                                                             │
│           │ Implementation                                              │
│           ▼                                                             │
│  ┌──────────────────┐                                                  │
│  │   Repository     │  ← Infrastructure Layer                          │
│  │   (HTTP Impl)    │                                                  │
│  └────────┬─────────┘                                                  │
│           │                                                             │
│           │ HTTP Request                                                │
│           ▼                                                             │
│  ┌──────────────────┐                                                  │
│  │   External API   │  ← External World                                │
│  └──────────────────┘                                                  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Exemplo Prático Completo - Estrutura de Pastas**:

```
src/app/features/tasks/
├── domain/
│   ├── entities/
│   │   ├── task.entity.ts
│   │   └── task-status.enum.ts
│   ├── interfaces/
│   │   └── task.repository.interface.ts
│   └── value-objects/
│       └── task-priority.vo.ts
│
├── application/
│   ├── use-cases/
│   │   ├── create-task.use-case.ts
│   │   ├── get-tasks.use-case.ts
│   │   ├── update-task.use-case.ts
│   │   └── delete-task.use-case.ts
│   ├── dtos/
│   │   ├── create-task.dto.ts
│   │   └── task-response.dto.ts
│   └── services/
│       └── task-application.service.ts
│
├── infrastructure/
│   ├── repositories/
│   │   └── task-http.repository.ts
│   ├── mappers/
│   │   └── task.mapper.ts
│   └── api/
│       └── task-api.model.ts
│
└── presentation/
    ├── components/
    │   ├── task-list/
    │   ├── task-form/
    │   └── task-card/
    ├── pages/
    │   └── tasks-page/
    └── tasks.routes.ts
```

**Código - Domain Layer**:

```typescript
export enum TaskStatus {
  PENDING = 'PENDING',
  IN_PROGRESS = 'IN_PROGRESS',
  COMPLETED = 'COMPLETED',
  CANCELLED = 'CANCELLED'
}

export class TaskPriority {
  private constructor(private readonly value: number) {}

  static create(value: number): TaskPriority {
    if (value < 1 || value > 5) {
      throw new Error('Priority must be between 1 and 5');
    }
    return new TaskPriority(value);
  }

  getValue(): number {
    return this.value;
  }

  isHighPriority(): boolean {
    return this.value >= 4;
  }
}

export class Task {
  constructor(
    public readonly id: string,
    public readonly title: string,
    public readonly description: string,
    public readonly status: TaskStatus,
    public readonly priority: TaskPriority,
    public readonly createdAt: Date,
    public readonly updatedAt: Date
  ) {}

  static create(params: {
    id: string;
    title: string;
    description: string;
    priority: number;
  }): Task {
    return new Task(
      params.id,
      params.title,
      params.description,
      TaskStatus.PENDING,
      TaskPriority.create(params.priority),
      new Date(),
      new Date()
    );
  }

  complete(): Task {
    return new Task(
      this.id,
      this.title,
      this.description,
      TaskStatus.COMPLETED,
      this.priority,
      this.createdAt,
      new Date()
    );
  }

  isOverdue(deadline: Date): boolean {
    return this.status !== TaskStatus.COMPLETED && new Date() > deadline;
  }
}

export interface TaskRepository {
  findAll(): Observable<Task[]>;
  findById(id: string): Observable<Task | null>;
  save(task: Task): Observable<Task>;
  update(task: Task): Observable<Task>;
  delete(id: string): Observable<void>;
}
```

**Código - Application Layer**:

```typescript
export interface CreateTaskInput {
  title: string;
  description: string;
  priority: number;
}

export interface TaskOutput {
  id: string;
  title: string;
  description: string;
  status: string;
  priority: number;
  createdAt: string;
}

@Injectable()
export class CreateTaskUseCase {
  constructor(
    @Inject('TaskRepository') 
    private readonly taskRepository: TaskRepository
  ) {}

  execute(input: CreateTaskInput): Observable<TaskOutput> {
    const task = Task.create({
      id: crypto.randomUUID(),
      title: input.title,
      description: input.description,
      priority: input.priority
    });

    return this.taskRepository.save(task).pipe(
      map(savedTask => this.toOutput(savedTask))
    );
  }

  private toOutput(task: Task): TaskOutput {
    return {
      id: task.id,
      title: task.title,
      description: task.description,
      status: task.status,
      priority: task.priority.getValue(),
      createdAt: task.createdAt.toISOString()
    };
  }
}

@Injectable()
export class GetTasksUseCase {
  constructor(
    @Inject('TaskRepository') 
    private readonly taskRepository: TaskRepository
  ) {}

  execute(): Observable<TaskOutput[]> {
    return this.taskRepository.findAll().pipe(
      map(tasks => tasks.map(task => ({
        id: task.id,
        title: task.title,
        description: task.description,
        status: task.status,
        priority: task.priority.getValue(),
        createdAt: task.createdAt.toISOString()
      })))
    );
  }
}
```

**Código - Infrastructure Layer**:

```typescript
interface TaskApiModel {
  id: string;
  title: string;
  description: string;
  status: string;
  priority: number;
  created_at: string;
  updated_at: string;
}

@Injectable()
export class TaskHttpRepository implements TaskRepository {
  private readonly apiUrl = '/api/tasks';

  constructor(private readonly http: HttpClient) {}

  findAll(): Observable<Task[]> {
    return this.http.get<TaskApiModel[]>(this.apiUrl).pipe(
      map(apiModels => apiModels.map(model => this.toDomain(model)))
    );
  }

  findById(id: string): Observable<Task | null> {
    return this.http.get<TaskApiModel>(`${this.apiUrl}/${id}`).pipe(
      map(model => this.toDomain(model)),
      catchError(() => of(null))
    );
  }

  save(task: Task): Observable<Task> {
    const apiModel = this.toApiModel(task);
    return this.http.post<TaskApiModel>(this.apiUrl, apiModel).pipe(
      map(response => this.toDomain(response))
    );
  }

  update(task: Task): Observable<Task> {
    const apiModel = this.toApiModel(task);
    return this.http.put<TaskApiModel>(`${this.apiUrl}/${task.id}`, apiModel).pipe(
      map(response => this.toDomain(response))
    );
  }

  delete(id: string): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  private toDomain(model: TaskApiModel): Task {
    return new Task(
      model.id,
      model.title,
      model.description,
      model.status as TaskStatus,
      TaskPriority.create(model.priority),
      new Date(model.created_at),
      new Date(model.updated_at)
    );
  }

  private toApiModel(task: Task): Partial<TaskApiModel> {
    return {
      id: task.id,
      title: task.title,
      description: task.description,
      status: task.status,
      priority: task.priority.getValue()
    };
  }
}
```

**Código - Presentation Layer**:

```typescript
@Component({
  selector: 'app-tasks-page',
  standalone: true,
  imports: [CommonModule, TaskListComponent, TaskFormComponent],
  template: `
    <div class="tasks-container">
      <app-task-form (taskCreated)="onTaskCreated($event)" />
      
      @if (loading()) {
        <div class="loading">Carregando...</div>
      } @else {
        <app-task-list [tasks]="tasks()" />
      }
    </div>
  `
})
export class TasksPageComponent implements OnInit {
  private readonly getTasksUseCase = inject(GetTasksUseCase);
  private readonly createTaskUseCase = inject(CreateTaskUseCase);

  tasks = signal<TaskOutput[]>([]);
  loading = signal(true);

  ngOnInit(): void {
    this.loadTasks();
  }

  private loadTasks(): void {
    this.getTasksUseCase.execute().subscribe({
      next: tasks => {
        this.tasks.set(tasks);
        this.loading.set(false);
      },
      error: () => this.loading.set(false)
    });
  }

  onTaskCreated(input: CreateTaskInput): void {
    this.createTaskUseCase.execute(input).subscribe({
      next: task => this.tasks.update(tasks => [...tasks, task])
    });
  }
}
```

---

### SOLID Principles

**Definição**: SOLID é um acrônimo para cinco princípios de design orientado a objetos que, quando aplicados corretamente, tornam o código mais compreensível, flexível e manutenível. Foram popularizados por Robert C. Martin e são fundamentais para arquitetura de software de qualidade.

**Explicação Detalhada**:

Os princípios SOLID não são regras rígidas, mas guidelines que ajudam a tomar decisões de design. Cada princípio aborda um aspecto específico de como organizar código para minimizar acoplamento e maximizar coesão.

**Analogia Geral**:

Pense nos princípios SOLID como regras de um bom restaurante:

- **S (Single Responsibility)**: Cada funcionário tem uma função específica (cozinheiro cozinha, garçom serve)
- **O (Open/Closed)**: O cardápio pode ser expandido sem mudar os pratos existentes
- **L (Liskov Substitution)**: Qualquer cozinheiro pode preparar qualquer prato do cardápio
- **I (Interface Segregation)**: O garçom não precisa saber cozinhar, só precisa conhecer o cardápio
- **D (Dependency Inversion)**: O restaurante depende de "fornecedores" abstratos, não de fazendas específicas

**Visualização dos Princípios**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         SOLID PRINCIPLES                                 │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  S ─ Single Responsibility Principle                                    │
│  │   "Uma classe deve ter apenas um motivo para mudar"                 │
│  │                                                                      │
│  │   ┌─────────────┐          ┌─────────────┐  ┌─────────────┐        │
│  │   │ UserService │    →     │ UserAuth    │  │ UserProfile │        │
│  │   │ - auth()    │          │ - login()   │  │ - update()  │        │
│  │   │ - profile() │          │ - logout()  │  │ - get()     │        │
│  │   │ - notify()  │          └─────────────┘  └─────────────┘        │
│  │   └─────────────┘                                                   │
│  │        ❌ BAD                     ✅ GOOD                           │
│  │                                                                      │
│  ├──────────────────────────────────────────────────────────────────────│
│  │                                                                      │
│  O ─ Open/Closed Principle                                              │
│  │   "Aberto para extensão, fechado para modificação"                  │
│  │                                                                      │
│  │   ┌─────────────────────┐                                           │
│  │   │ PaymentProcessor    │ ← Abstract                                │
│  │   │ + process()         │                                           │
│  │   └──────────┬──────────┘                                           │
│  │              │                                                       │
│  │   ┌──────────┼──────────┬──────────────────┐                        │
│  │   │          │          │                  │                        │
│  │   ▼          ▼          ▼                  ▼                        │
│  │ CreditCard  PayPal    Pix       NewPayment (extend, don't modify)  │
│  │                                                                      │
│  ├──────────────────────────────────────────────────────────────────────│
│  │                                                                      │
│  L ─ Liskov Substitution Principle                                      │
│  │   "Subtipos devem ser substituíveis por seus tipos base"            │
│  │                                                                      │
│  │   ┌─────────────┐                                                   │
│  │   │    Bird     │                                                   │
│  │   │ + fly()     │  ← Se Penguin extends Bird, mas não voa...       │
│  │   └──────┬──────┘     então viola LSP!                              │
│  │          │                                                          │
│  │   ┌──────┴──────┐                                                   │
│  │   │   Penguin   │  ❌ throw Error('Cannot fly')                    │
│  │   └─────────────┘                                                   │
│  │                                                                      │
│  ├──────────────────────────────────────────────────────────────────────│
│  │                                                                      │
│  I ─ Interface Segregation Principle                                    │
│  │   "Muitas interfaces específicas são melhores que uma geral"        │
│  │                                                                      │
│  │   ┌─────────────────┐          ┌──────────┐  ┌──────────┐          │
│  │   │ IWorker         │    →     │ IWorkable│  │ IEatable │          │
│  │   │ + work()        │          │ + work() │  │ + eat()  │          │
│  │   │ + eat()         │          └──────────┘  └──────────┘          │
│  │   │ + sleep()       │          ┌──────────┐                        │
│  │   └─────────────────┘          │ISleepable│                        │
│  │        ❌ FAT                   │ + sleep()│                        │
│  │                                └──────────┘                        │
│  │                                  ✅ SEGREGATED                      │
│  │                                                                      │
│  ├──────────────────────────────────────────────────────────────────────│
│  │                                                                      │
│  D ─ Dependency Inversion Principle                                     │
│  │   "Dependa de abstrações, não de implementações"                    │
│  │                                                                      │
│  │   ❌ High-level → Low-level                                         │
│  │   ┌────────────┐      ┌────────────────┐                           │
│  │   │ UserService│ ──→  │ MySQLDatabase  │                           │
│  │   └────────────┘      └────────────────┘                           │
│  │                                                                      │
│  │   ✅ High-level → Abstraction ← Low-level                          │
│  │   ┌────────────┐      ┌────────────────┐      ┌───────────────┐    │
│  │   │ UserService│ ──→  │ IUserRepository│ ←──  │ MySQLUserRepo │    │
│  │   └────────────┘      └────────────────┘      └───────────────┘    │
│  │                                                                      │
└─────────────────────────────────────────────────────────────────────────┘
```

**Exemplos Práticos de Cada Princípio**:

**S - Single Responsibility Principle**:

```typescript
@Injectable({ providedIn: 'root' })
export class UserAuthService {
  constructor(private http: HttpClient) {}

  login(credentials: LoginCredentials): Observable<AuthToken> {
    return this.http.post<AuthToken>('/api/auth/login', credentials);
  }

  logout(): Observable<void> {
    return this.http.post<void>('/api/auth/logout', {});
  }

  refreshToken(): Observable<AuthToken> {
    return this.http.post<AuthToken>('/api/auth/refresh', {});
  }
}

@Injectable({ providedIn: 'root' })
export class UserProfileService {
  constructor(private http: HttpClient) {}

  getProfile(): Observable<UserProfile> {
    return this.http.get<UserProfile>('/api/users/me');
  }

  updateProfile(data: UpdateProfileDto): Observable<UserProfile> {
    return this.http.put<UserProfile>('/api/users/me', data);
  }
}

@Injectable({ providedIn: 'root' })
export class UserNotificationService {
  constructor(private http: HttpClient) {}

  getNotifications(): Observable<Notification[]> {
    return this.http.get<Notification[]>('/api/notifications');
  }

  markAsRead(id: string): Observable<void> {
    return this.http.patch<void>(`/api/notifications/${id}/read`, {});
  }
}
```

**O - Open/Closed Principle**:

```typescript
export abstract class PaymentProcessor {
  abstract process(amount: number): Observable<PaymentResult>;
  abstract validate(data: PaymentData): boolean;
}

@Injectable()
export class CreditCardProcessor extends PaymentProcessor {
  constructor(private http: HttpClient) {
    super();
  }

  process(amount: number): Observable<PaymentResult> {
    return this.http.post<PaymentResult>('/api/payments/credit', { amount });
  }

  validate(data: PaymentData): boolean {
    return data.cardNumber?.length === 16;
  }
}

@Injectable()
export class PixProcessor extends PaymentProcessor {
  constructor(private http: HttpClient) {
    super();
  }

  process(amount: number): Observable<PaymentResult> {
    return this.http.post<PaymentResult>('/api/payments/pix', { amount });
  }

  validate(data: PaymentData): boolean {
    return !!data.pixKey;
  }
}

@Injectable({ providedIn: 'root' })
export class PaymentService {
  private processors = new Map<string, PaymentProcessor>();

  registerProcessor(type: string, processor: PaymentProcessor): void {
    this.processors.set(type, processor);
  }

  processPayment(type: string, amount: number): Observable<PaymentResult> {
    const processor = this.processors.get(type);
    if (!processor) {
      throw new Error(`Unknown payment type: ${type}`);
    }
    return processor.process(amount);
  }
}
```

**L - Liskov Substitution Principle**:

```typescript
export abstract class DataExporter {
  abstract export(data: any[]): Observable<ExportResult>;
  
  protected validateData(data: any[]): boolean {
    return Array.isArray(data) && data.length > 0;
  }
}

@Injectable()
export class CsvExporter extends DataExporter {
  export(data: any[]): Observable<ExportResult> {
    if (!this.validateData(data)) {
      return throwError(() => new Error('Invalid data'));
    }
    
    const csv = this.convertToCsv(data);
    return of({ format: 'csv', content: csv, size: csv.length });
  }

  private convertToCsv(data: any[]): string {
    const headers = Object.keys(data[0]).join(',');
    const rows = data.map(item => Object.values(item).join(','));
    return [headers, ...rows].join('\n');
  }
}

@Injectable()
export class JsonExporter extends DataExporter {
  export(data: any[]): Observable<ExportResult> {
    if (!this.validateData(data)) {
      return throwError(() => new Error('Invalid data'));
    }
    
    const json = JSON.stringify(data, null, 2);
    return of({ format: 'json', content: json, size: json.length });
  }
}

@Injectable()
export class ExcelExporter extends DataExporter {
  export(data: any[]): Observable<ExportResult> {
    if (!this.validateData(data)) {
      return throwError(() => new Error('Invalid data'));
    }
    
    return of({ format: 'xlsx', content: 'binary', size: data.length * 100 });
  }
}
```

**I - Interface Segregation Principle**:

```typescript
export interface Readable {
  read(id: string): Observable<any>;
  readAll(): Observable<any[]>;
}

export interface Writable {
  create(data: any): Observable<any>;
  update(id: string, data: any): Observable<any>;
}

export interface Deletable {
  delete(id: string): Observable<void>;
}

export interface Searchable {
  search(query: string): Observable<any[]>;
  filter(criteria: FilterCriteria): Observable<any[]>;
}

export interface FullRepository extends Readable, Writable, Deletable {}

@Injectable()
export class TaskRepository implements FullRepository {
  constructor(private http: HttpClient) {}

  read(id: string): Observable<Task> {
    return this.http.get<Task>(`/api/tasks/${id}`);
  }

  readAll(): Observable<Task[]> {
    return this.http.get<Task[]>('/api/tasks');
  }

  create(data: CreateTaskDto): Observable<Task> {
    return this.http.post<Task>('/api/tasks', data);
  }

  update(id: string, data: UpdateTaskDto): Observable<Task> {
    return this.http.put<Task>(`/api/tasks/${id}`, data);
  }

  delete(id: string): Observable<void> {
    return this.http.delete<void>(`/api/tasks/${id}`);
  }
}

@Injectable()
export class AuditLogRepository implements Readable {
  constructor(private http: HttpClient) {}

  read(id: string): Observable<AuditLog> {
    return this.http.get<AuditLog>(`/api/audit/${id}`);
  }

  readAll(): Observable<AuditLog[]> {
    return this.http.get<AuditLog[]>('/api/audit');
  }
}
```

**D - Dependency Inversion Principle**:

```typescript
export const TASK_REPOSITORY = new InjectionToken<TaskRepository>('TaskRepository');
export const LOGGER = new InjectionToken<Logger>('Logger');

export interface TaskRepository {
  findAll(): Observable<Task[]>;
  findById(id: string): Observable<Task | null>;
  save(task: Task): Observable<Task>;
}

export interface Logger {
  log(message: string): void;
  error(message: string, error?: Error): void;
  warn(message: string): void;
}

@Injectable()
export class TaskService {
  constructor(
    @Inject(TASK_REPOSITORY) private repository: TaskRepository,
    @Inject(LOGGER) private logger: Logger
  ) {}

  getTasks(): Observable<Task[]> {
    this.logger.log('Fetching all tasks');
    return this.repository.findAll().pipe(
      tap(tasks => this.logger.log(`Found ${tasks.length} tasks`)),
      catchError(error => {
        this.logger.error('Failed to fetch tasks', error);
        return throwError(() => error);
      })
    );
  }
}

export const taskProviders: Provider[] = [
  { provide: TASK_REPOSITORY, useClass: TaskHttpRepository },
  { provide: LOGGER, useClass: ConsoleLogger }
];
```

---

### Design Patterns

**Definição**: Design Patterns são soluções reutilizáveis para problemas comuns de design de software. Não são código pronto, mas templates que descrevem como resolver um problema de forma que possa ser usado em diferentes situações.

**Explicação Detalhada**:

Design Patterns foram catalogados pelo "Gang of Four" (GoF) em 1994 e divididos em três categorias:
- **Creational**: Padrões de criação de objetos
- **Structural**: Padrões de composição de objetos
- **Behavioral**: Padrões de comunicação entre objetos

**Analogia Geral**:

Design Patterns são como receitas de culinária:
- Você não precisa reinventar como fazer um bolo toda vez
- A receita (pattern) descreve ingredientes (componentes) e passos (interações)
- Você pode adaptar a receita para suas necessidades
- Diferentes receitas resolvem diferentes problemas (sobremesa, prato principal)

**Visualização dos Patterns**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     DESIGN PATTERNS IN ANGULAR                           │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                    CREATIONAL PATTERNS                           │   │
│  ├─────────────────────────────────────────────────────────────────┤   │
│  │                                                                   │   │
│  │  Factory Pattern                                                  │   │
│  │  ┌──────────────┐                                                │   │
│  │  │   Factory    │──────┬───────────────┬───────────────┐        │   │
│  │  │  create()    │      │               │               │        │   │
│  │  └──────────────┘      ▼               ▼               ▼        │   │
│  │                   ┌─────────┐    ┌─────────┐    ┌─────────┐     │   │
│  │                   │ProductA │    │ProductB │    │ProductC │     │   │
│  │                   └─────────┘    └─────────┘    └─────────┘     │   │
│  │                                                                   │   │
│  │  Singleton Pattern (Angular Services with providedIn: 'root')   │   │
│  │  ┌──────────────────────────────────────────────────────────┐   │   │
│  │  │  @Injectable({ providedIn: 'root' })                     │   │   │
│  │  │  export class SingletonService { }                       │   │   │
│  │  └──────────────────────────────────────────────────────────┘   │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                    STRUCTURAL PATTERNS                           │   │
│  ├─────────────────────────────────────────────────────────────────┤   │
│  │                                                                   │   │
│  │  Facade Pattern                                                  │   │
│  │  ┌──────────────┐                                                │   │
│  │  │   Facade     │                                                │   │
│  │  │  (simple API)│                                                │   │
│  │  └──────┬───────┘                                                │   │
│  │         │                                                        │   │
│  │  ┌──────┴──────────────────────────────┐                        │   │
│  │  │              │              │        │                        │   │
│  │  ▼              ▼              ▼        ▼                        │   │
│  │ ServiceA    ServiceB    ServiceC    ServiceD                    │   │
│  │ (complex)   (complex)   (complex)   (complex)                   │   │
│  │                                                                   │   │
│  │  Adapter Pattern                                                 │   │
│  │  ┌─────────┐    ┌─────────┐    ┌─────────────┐                 │   │
│  │  │ Client  │───▶│ Adapter │───▶│ Legacy API  │                 │   │
│  │  └─────────┘    └─────────┘    └─────────────┘                 │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                    BEHAVIORAL PATTERNS                           │   │
│  ├─────────────────────────────────────────────────────────────────┤   │
│  │                                                                   │   │
│  │  Strategy Pattern                                                │   │
│  │  ┌──────────────┐                                                │   │
│  │  │   Context    │                                                │   │
│  │  │ setStrategy()│                                                │   │
│  │  └──────┬───────┘                                                │   │
│  │         │                                                        │   │
│  │  ┌──────┴──────────────────────────────┐                        │   │
│  │  │              │              │        │                        │   │
│  │  ▼              ▼              ▼        ▼                        │   │
│  │ StrategyA   StrategyB   StrategyC   StrategyD                   │   │
│  │                                                                   │   │
│  │  Observer Pattern (RxJS Subjects)                               │   │
│  │  ┌──────────────┐    ┌──────────────────────────────────┐       │   │
│  │  │   Subject    │───▶│ Observer1, Observer2, Observer3  │       │   │
│  │  │   next()     │    └──────────────────────────────────┘       │   │
│  │  └──────────────┘                                                │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Factory Pattern - Exemplo Completo**:

```typescript
export interface Notification {
  send(message: string, recipient: string): Observable<void>;
}

@Injectable()
export class EmailNotification implements Notification {
  constructor(private http: HttpClient) {}

  send(message: string, recipient: string): Observable<void> {
    return this.http.post<void>('/api/notifications/email', {
      to: recipient,
      body: message
    });
  }
}

@Injectable()
export class SmsNotification implements Notification {
  constructor(private http: HttpClient) {}

  send(message: string, recipient: string): Observable<void> {
    return this.http.post<void>('/api/notifications/sms', {
      phone: recipient,
      message: message
    });
  }
}

@Injectable()
export class PushNotification implements Notification {
  constructor(private http: HttpClient) {}

  send(message: string, recipient: string): Observable<void> {
    return this.http.post<void>('/api/notifications/push', {
      userId: recipient,
      notification: { title: 'Notification', body: message }
    });
  }
}

@Injectable({ providedIn: 'root' })
export class NotificationFactory {
  constructor(
    private email: EmailNotification,
    private sms: SmsNotification,
    private push: PushNotification
  ) {}

  create(type: 'email' | 'sms' | 'push'): Notification {
    switch (type) {
      case 'email':
        return this.email;
      case 'sms':
        return this.sms;
      case 'push':
        return this.push;
      default:
        throw new Error(`Unknown notification type: ${type}`);
    }
  }
}
```

**Strategy Pattern - Exemplo Completo**:

```typescript
export interface SortStrategy<T> {
  sort(items: T[]): T[];
}

@Injectable()
export class AlphabeticalSort implements SortStrategy<any> {
  sort(items: any[]): any[] {
    return [...items].sort((a, b) => 
      a.name.localeCompare(b.name)
    );
  }
}

@Injectable()
export class DateSort implements SortStrategy<any> {
  sort(items: any[]): any[] {
    return [...items].sort((a, b) => 
      new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime()
    );
  }
}

@Injectable()
export class PrioritySort implements SortStrategy<any> {
  sort(items: any[]): any[] {
    return [...items].sort((a, b) => b.priority - a.priority);
  }
}

@Injectable({ providedIn: 'root' })
export class SortService {
  private strategies = new Map<string, SortStrategy<any>>();

  constructor(
    alphabetical: AlphabeticalSort,
    date: DateSort,
    priority: PrioritySort
  ) {
    this.strategies.set('alphabetical', alphabetical);
    this.strategies.set('date', date);
    this.strategies.set('priority', priority);
  }

  sort<T>(items: T[], strategyName: string): T[] {
    const strategy = this.strategies.get(strategyName);
    if (!strategy) {
      throw new Error(`Unknown sort strategy: ${strategyName}`);
    }
    return strategy.sort(items);
  }
}
```

**Facade Pattern - Exemplo Completo**:

```typescript
@Injectable({ providedIn: 'root' })
export class UserFacade {
  private userSubject = new BehaviorSubject<User | null>(null);
  private loadingSubject = new BehaviorSubject<boolean>(false);
  private errorSubject = new BehaviorSubject<string | null>(null);

  user$ = this.userSubject.asObservable();
  loading$ = this.loadingSubject.asObservable();
  error$ = this.errorSubject.asObservable();

  constructor(
    private authService: AuthService,
    private profileService: ProfileService,
    private notificationService: NotificationService,
    private analyticsService: AnalyticsService
  ) {}

  login(credentials: LoginCredentials): void {
    this.loadingSubject.next(true);
    this.errorSubject.next(null);

    this.authService.login(credentials).pipe(
      switchMap(token => {
        this.analyticsService.trackEvent('user_login');
        return this.profileService.getProfile();
      }),
      tap(user => {
        this.userSubject.next(user);
        this.notificationService.showSuccess('Login realizado com sucesso!');
      }),
      catchError(error => {
        this.errorSubject.next(error.message);
        this.analyticsService.trackError('login_failed', error);
        return EMPTY;
      }),
      finalize(() => this.loadingSubject.next(false))
    ).subscribe();
  }

  logout(): void {
    this.authService.logout().subscribe({
      next: () => {
        this.userSubject.next(null);
        this.analyticsService.trackEvent('user_logout');
        this.notificationService.showInfo('Logout realizado');
      }
    });
  }

  updateProfile(data: UpdateProfileDto): void {
    this.loadingSubject.next(true);

    this.profileService.updateProfile(data).pipe(
      tap(user => {
        this.userSubject.next(user);
        this.notificationService.showSuccess('Perfil atualizado!');
      }),
      finalize(() => this.loadingSubject.next(false))
    ).subscribe();
  }
}
```

**Repository Pattern - Exemplo Completo**:

```typescript
export interface Repository<T, ID> {
  findAll(): Observable<T[]>;
  findById(id: ID): Observable<T | null>;
  findByIds(ids: ID[]): Observable<T[]>;
  save(entity: T): Observable<T>;
  saveAll(entities: T[]): Observable<T[]>;
  update(id: ID, entity: Partial<T>): Observable<T>;
  delete(id: ID): Observable<void>;
  deleteAll(ids: ID[]): Observable<void>;
  exists(id: ID): Observable<boolean>;
  count(): Observable<number>;
}

export abstract class BaseHttpRepository<T extends { id: string }> 
  implements Repository<T, string> {
  
  constructor(
    protected http: HttpClient,
    protected baseUrl: string
  ) {}

  findAll(): Observable<T[]> {
    return this.http.get<T[]>(this.baseUrl);
  }

  findById(id: string): Observable<T | null> {
    return this.http.get<T>(`${this.baseUrl}/${id}`).pipe(
      catchError(() => of(null))
    );
  }

  findByIds(ids: string[]): Observable<T[]> {
    return this.http.get<T[]>(this.baseUrl, {
      params: { ids: ids.join(',') }
    });
  }

  save(entity: T): Observable<T> {
    return this.http.post<T>(this.baseUrl, entity);
  }

  saveAll(entities: T[]): Observable<T[]> {
    return this.http.post<T[]>(`${this.baseUrl}/batch`, entities);
  }

  update(id: string, entity: Partial<T>): Observable<T> {
    return this.http.patch<T>(`${this.baseUrl}/${id}`, entity);
  }

  delete(id: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${id}`);
  }

  deleteAll(ids: string[]): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/batch`, {
      body: { ids }
    });
  }

  exists(id: string): Observable<boolean> {
    return this.http.head(`${this.baseUrl}/${id}`, { observe: 'response' }).pipe(
      map(response => response.status === 200),
      catchError(() => of(false))
    );
  }

  count(): Observable<number> {
    return this.http.get<{ count: number }>(`${this.baseUrl}/count`).pipe(
      map(response => response.count)
    );
  }
}

@Injectable({ providedIn: 'root' })
export class TaskRepository extends BaseHttpRepository<Task> {
  constructor(http: HttpClient) {
    super(http, '/api/tasks');
  }

  findByStatus(status: TaskStatus): Observable<Task[]> {
    return this.http.get<Task[]>(this.baseUrl, {
      params: { status }
    });
  }

  findOverdue(): Observable<Task[]> {
    return this.http.get<Task[]>(`${this.baseUrl}/overdue`);
  }
}
```

---

### Feature Modules

**Definição**: Feature Modules são módulos Angular que encapsulam uma funcionalidade específica da aplicação, incluindo seus componentes, serviços, rotas e outros artefatos relacionados. Eles promovem organização, reutilização e lazy loading.

**Explicação Detalhada**:

Feature Modules são a forma recomendada de organizar aplicações Angular de médio e grande porte. Cada feature module representa uma área funcional da aplicação (usuários, produtos, pedidos, etc.) e contém tudo necessário para essa funcionalidade operar.

**Analogia**:

Feature Modules são como apartamentos em um prédio:
- Cada apartamento (feature module) é independente e auto-suficiente
- Tem sua própria cozinha, banheiro, quartos (componentes, serviços)
- Compartilha infraestrutura comum do prédio (shared module)
- Pode ser "visitado" apenas quando necessário (lazy loading)
- Tem sua própria entrada (routes)

**Visualização**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      FEATURE MODULES ARCHITECTURE                        │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                         AppModule                                │   │
│  │                                                                   │   │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐             │   │
│  │  │ CoreModule  │  │SharedModule │  │ AppRouting  │             │   │
│  │  │ (singleton) │  │ (reusable)  │  │  Module     │             │   │
│  │  └─────────────┘  └─────────────┘  └──────┬──────┘             │   │
│  │                                            │                     │   │
│  └────────────────────────────────────────────┼─────────────────────┘   │
│                                               │                         │
│           ┌───────────────────────────────────┼───────────────────┐     │
│           │                                   │                   │     │
│           ▼                                   ▼                   ▼     │
│  ┌─────────────────┐             ┌─────────────────┐   ┌─────────────┐ │
│  │  UsersModule    │             │ ProductsModule  │   │OrdersModule │ │
│  │  (lazy loaded)  │             │  (lazy loaded)  │   │(lazy loaded)│ │
│  │                 │             │                 │   │             │ │
│  │ ┌─────────────┐ │             │ ┌─────────────┐ │   │┌───────────┐│ │
│  │ │ Components  │ │             │ │ Components  │ │   ││Components ││ │
│  │ │ - UserList  │ │             │ │ - ProductList│ │   ││- OrderList││ │
│  │ │ - UserDetail│ │             │ │ - ProductCard│ │   ││- OrderForm││ │
│  │ │ - UserForm  │ │             │ │ - ProductForm│ │   │└───────────┘│ │
│  │ └─────────────┘ │             │ └─────────────┘ │   │             │ │
│  │                 │             │                 │   │┌───────────┐│ │
│  │ ┌─────────────┐ │             │ ┌─────────────┐ │   ││ Services  ││ │
│  │ │  Services   │ │             │ │  Services   │ │   ││- OrderSvc ││ │
│  │ │ - UserSvc   │ │             │ │ - ProductSvc│ │   │└───────────┘│ │
│  │ └─────────────┘ │             │ └─────────────┘ │   │             │ │
│  │                 │             │                 │   │┌───────────┐│ │
│  │ ┌─────────────┐ │             │ ┌─────────────┐ │   ││  Routes   ││ │
│  │ │   Routes    │ │             │ │   Routes    │ │   │└───────────┘│ │
│  │ └─────────────┘ │             │ └─────────────┘ │   └─────────────┘ │
│  └─────────────────┘             └─────────────────┘                   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Estrutura Completa de Feature Module**:

```
src/app/features/users/
├── components/
│   ├── user-list/
│   │   ├── user-list.component.ts
│   │   ├── user-list.component.html
│   │   ├── user-list.component.scss
│   │   └── user-list.component.spec.ts
│   ├── user-detail/
│   ├── user-form/
│   └── user-card/
├── pages/
│   ├── users-page/
│   └── user-profile-page/
├── services/
│   ├── user.service.ts
│   └── user-facade.service.ts
├── models/
│   ├── user.model.ts
│   └── user-dto.model.ts
├── guards/
│   └── user-exists.guard.ts
├── resolvers/
│   └── user.resolver.ts
├── users.routes.ts
└── index.ts
```

**Exemplo de Feature Module com Standalone Components**:

```typescript
export const usersRoutes: Routes = [
  {
    path: '',
    component: UsersPageComponent,
    children: [
      {
        path: '',
        component: UserListComponent
      },
      {
        path: 'new',
        component: UserFormComponent
      },
      {
        path: ':id',
        component: UserDetailComponent,
        resolve: {
          user: UserResolver
        }
      },
      {
        path: ':id/edit',
        component: UserFormComponent,
        resolve: {
          user: UserResolver
        }
      }
    ]
  }
];

export default usersRoutes;
```

---

### Core e Shared Modules

**Definição**: Core Module contém serviços singleton e funcionalidades que devem existir em uma única instância na aplicação. Shared Module contém componentes, diretivas e pipes reutilizáveis que podem ser importados por múltiplos feature modules.

**Explicação Detalhada**:

A distinção entre Core e Shared é fundamental para uma arquitetura Angular saudável:

- **Core Module**: Importado APENAS uma vez no AppModule. Contém serviços que mantêm estado global, interceptors, guards globais.

- **Shared Module**: Importado por qualquer feature module que precise de seus componentes. Não contém serviços (ou apenas serviços stateless).

**Visualização**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     CORE vs SHARED MODULES                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                        CORE MODULE                               │   │
│  │                   (Import ONCE in AppModule)                     │   │
│  ├─────────────────────────────────────────────────────────────────┤   │
│  │                                                                   │   │
│  │  Services (Singleton)         │  Guards                          │   │
│  │  ├─ AuthService               │  ├─ AuthGuard                    │   │
│  │  ├─ UserStateService          │  ├─ RoleGuard                    │   │
│  │  ├─ ConfigService             │  └─ FeatureGuard                 │   │
│  │  └─ LoggerService             │                                  │   │
│  │                               │  Interceptors                    │   │
│  │  Initializers                 │  ├─ AuthInterceptor              │   │
│  │  ├─ APP_INITIALIZER           │  ├─ ErrorInterceptor             │   │
│  │  └─ Config loaders            │  └─ LoadingInterceptor           │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                       SHARED MODULE                              │   │
│  │                (Import in ANY Feature Module)                    │   │
│  ├─────────────────────────────────────────────────────────────────┤   │
│  │                                                                   │   │
│  │  Components                   │  Directives                      │   │
│  │  ├─ ButtonComponent           │  ├─ HighlightDirective           │   │
│  │  ├─ CardComponent             │  ├─ TooltipDirective             │   │
│  │  ├─ ModalComponent            │  ├─ ClickOutsideDirective        │   │
│  │  ├─ LoadingComponent          │  └─ AutoFocusDirective           │   │
│  │  ├─ EmptyStateComponent       │                                  │   │
│  │  └─ PaginationComponent       │  Pipes                           │   │
│  │                               │  ├─ DateFormatPipe               │   │
│  │  Re-exports                   │  ├─ CurrencyBRPipe               │   │
│  │  ├─ CommonModule              │  ├─ TruncatePipe                 │   │
│  │  ├─ FormsModule               │  └─ SafeHtmlPipe                 │   │
│  │  └─ ReactiveFormsModule       │                                  │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Core Module com Guard de Importação**:

```typescript
export function provideCore(): EnvironmentProviders {
  return makeEnvironmentProviders([
    provideHttpClient(
      withInterceptors([
        authInterceptor,
        errorInterceptor,
        loadingInterceptor
      ])
    ),
    AuthService,
    UserStateService,
    ConfigService,
    LoggerService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      deps: [ConfigService],
      multi: true
    }
  ]);
}

function initializeApp(configService: ConfigService) {
  return () => configService.loadConfig();
}
```

**Shared Module com Standalone Components**:

```typescript
export const SHARED_COMPONENTS = [
  ButtonComponent,
  CardComponent,
  ModalComponent,
  LoadingComponent,
  EmptyStateComponent,
  PaginationComponent
] as const;

export const SHARED_DIRECTIVES = [
  HighlightDirective,
  TooltipDirective,
  ClickOutsideDirective,
  AutoFocusDirective
] as const;

export const SHARED_PIPES = [
  DateFormatPipe,
  CurrencyBRPipe,
  TruncatePipe,
  SafeHtmlPipe
] as const;

export const SHARED_IMPORTS = [
  CommonModule,
  FormsModule,
  ReactiveFormsModule,
  ...SHARED_COMPONENTS,
  ...SHARED_DIRECTIVES,
  ...SHARED_PIPES
] as const;
```

---

### Barrel Exports

**Definição**: Barrel exports são arquivos index.ts que re-exportam múltiplos módulos de um diretório, simplificando imports e criando uma API pública clara para um módulo ou feature.

**Explicação Detalhada**:

Barrels servem como "fachadas" para diretórios, permitindo que consumidores importem de um único ponto sem conhecer a estrutura interna. Isso facilita refatorações e cria contratos claros sobre o que é público.

**Analogia**:

Barrel exports são como a recepção de um hotel:
- Você não precisa conhecer a estrutura interna do hotel
- A recepção (barrel) te direciona para onde você precisa ir
- Se o hotel reorganizar seus andares, a recepção continua funcionando
- Você só acessa o que o hotel permite através da recepção

**Visualização**:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        BARREL EXPORTS                                    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  Sem Barrel (imports verbosos):                                        │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  import { ButtonComponent } from './shared/components/button';   │   │
│  │  import { CardComponent } from './shared/components/card';       │   │
│  │  import { ModalComponent } from './shared/components/modal';     │   │
│  │  import { DatePipe } from './shared/pipes/date';                 │   │
│  │  import { CurrencyPipe } from './shared/pipes/currency';         │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  Com Barrel (imports limpos):                                          │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │  import {                                                        │   │
│  │    ButtonComponent,                                              │   │
│  │    CardComponent,                                                │   │
│  │    ModalComponent,                                               │   │
│  │    DatePipe,                                                     │   │
│  │    CurrencyPipe                                                  │   │
│  │  } from '@shared';                                               │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
│  Estrutura de Barrels:                                                 │
│  ┌─────────────────────────────────────────────────────────────────┐   │
│  │                                                                   │   │
│  │  shared/                                                         │   │
│  │  ├── components/                                                 │   │
│  │  │   ├── button/                                                │   │
│  │  │   │   ├── button.component.ts                                │   │
│  │  │   │   └── index.ts  ← export * from './button.component'     │   │
│  │  │   ├── card/                                                  │   │
│  │  │   │   └── index.ts                                           │   │
│  │  │   └── index.ts  ← export * from './button'                   │   │
│  │  │                    export * from './card'                     │   │
│  │  ├── pipes/                                                      │   │
│  │  │   └── index.ts                                               │   │
│  │  └── index.ts  ← export * from './components'                   │   │
│  │                   export * from './pipes'                        │   │
│  │                                                                   │   │
│  └─────────────────────────────────────────────────────────────────┘   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

**Exemplo de Estrutura de Barrels**:

```typescript
export * from './button/button.component';
export * from './card/card.component';
export * from './modal/modal.component';
export * from './loading/loading.component';
export * from './empty-state/empty-state.component';
export * from './pagination/pagination.component';
```

```typescript
export * from './highlight.directive';
export * from './tooltip.directive';
export * from './click-outside.directive';
export * from './auto-focus.directive';
```

```typescript
export * from './date-format.pipe';
export * from './currency-br.pipe';
export * from './truncate.pipe';
export * from './safe-html.pipe';
```

```typescript
export * from './components';
export * from './directives';
export * from './pipes';
export * from './models';
export * from './utils';
```

**Configuração de Path Aliases no tsconfig.json**:

```json
{
  "compilerOptions": {
    "baseUrl": "src",
    "paths": {
      "@app/*": ["app/*"],
      "@core": ["app/core/index"],
      "@core/*": ["app/core/*"],
      "@shared": ["app/shared/index"],
      "@shared/*": ["app/shared/*"],
      "@features/*": ["app/features/*"],
      "@env": ["environments/environment"],
      "@models": ["app/shared/models/index"],
      "@utils": ["app/shared/utils/index"]
    }
  }
}
```

---

## Tabela Comparativa: Arquitetura Angular vs Outros Frameworks

| Aspecto | Angular | React | Vue | Svelte |
|---------|---------|-------|-----|--------|
| **Estrutura Padrão** | Opinativo (CLI define) | Flexível (você decide) | Semi-opinativo | Flexível |
| **Módulos** | NgModules + Standalone | Sem conceito nativo | Sem conceito nativo | Sem conceito nativo |
| **DI Nativo** | Sim (hierárquico) | Não (Context API) | Não (provide/inject) | Não |
| **State Management** | Services + RxJS | Redux/Zustand/Jotai | Pinia/Vuex | Stores nativos |
| **Lazy Loading** | Nativo (routes) | React.lazy | defineAsyncComponent | Nativo (SvelteKit) |
| **Code Splitting** | Automático (CLI) | Manual ou bundler | Manual ou bundler | Automático |
| **Testing** | Jasmine/Karma (oficial) | Jest + RTL | Vitest/Jest | Vitest |
| **Clean Architecture** | Excelente suporte | Requer configuração | Requer configuração | Requer configuração |
| **Enterprise Ready** | Sim (nativo) | Sim (com setup) | Sim (com setup) | Em evolução |

---

## Exemplos Práticos Completos

### Exemplo 1: Estrutura Completa de Feature Module

**Contexto**: Criar estrutura completa de feature module seguindo Clean Architecture.

**Estrutura de Pastas**:

```
src/app/features/products/
├── domain/
│   ├── entities/
│   │   ├── product.entity.ts
│   │   └── category.entity.ts
│   ├── interfaces/
│   │   ├── product.repository.interface.ts
│   │   └── category.repository.interface.ts
│   └── value-objects/
│       ├── price.vo.ts
│       └── sku.vo.ts
├── application/
│   ├── use-cases/
│   │   ├── create-product.use-case.ts
│   │   ├── get-products.use-case.ts
│   │   ├── update-product.use-case.ts
│   │   └── delete-product.use-case.ts
│   ├── dtos/
│   │   ├── create-product.dto.ts
│   │   ├── update-product.dto.ts
│   │   └── product-response.dto.ts
│   └── facades/
│       └── product.facade.ts
├── infrastructure/
│   ├── repositories/
│   │   ├── product-http.repository.ts
│   │   └── category-http.repository.ts
│   ├── mappers/
│   │   ├── product.mapper.ts
│   │   └── category.mapper.ts
│   └── providers/
│       └── products.providers.ts
├── presentation/
│   ├── components/
│   │   ├── product-list/
│   │   ├── product-card/
│   │   ├── product-form/
│   │   └── product-filters/
│   ├── pages/
│   │   ├── products-page/
│   │   └── product-detail-page/
│   └── products.routes.ts
└── index.ts
```

---

## Padrões e Boas Práticas

### ✅ Boas Práticas

1. **Separe responsabilidades por camadas**
   - **Por quê**: Facilita manutenção e testes
   - **Exemplo**: Domain não conhece Presentation

2. **Use Barrel exports para APIs públicas**
   - **Por quê**: Simplifica imports e cria contratos claros
   - **Exemplo**: `export * from './components'`

3. **Organize código por features, não por tipo**
   - **Por quê**: Facilita lazy loading e navegação
   - **Exemplo**: `features/users/` ao invés de `components/user-*`

4. **Core Module apenas para singletons**
   - **Por quê**: Evita múltiplas instâncias de serviços globais
   - **Exemplo**: AuthService, ConfigService no Core

5. **Aplique SOLID em todos os serviços**
   - **Por quê**: Código mais testável e manutenível
   - **Exemplo**: Um serviço, uma responsabilidade

6. **Use interfaces para contratos**
   - **Por quê**: Facilita mocking e substituição
   - **Exemplo**: `TaskRepository` interface implementada por `TaskHttpRepository`

### ❌ Anti-padrões Comuns

1. **Não misture camadas**
   - **Problema**: Acoplamento alto dificulta mudanças
   - **Solução**: Mantenha camadas separadas com interfaces claras

2. **Não importe Shared em Core**
   - **Problema**: Dependência circular
   - **Solução**: Core não depende de Shared, apenas o contrário

3. **Não crie módulos gigantes**
   - **Problema**: Difícil manutenção e bundle grande
   - **Solução**: Divida em features menores

4. **Não exponha detalhes de implementação**
   - **Problema**: Consumidores dependem de internals
   - **Solução**: Use barrels para expor apenas API pública

5. **Não use serviços para tudo**
   - **Problema**: Services viram "God objects"
   - **Solução**: Use Use Cases para lógica de aplicação

---

## Exercícios Práticos

### Exercício 1: Clean Architecture (Avançado)

**Objetivo**: Implementar Clean Architecture completa

**Descrição**: 
Implemente estrutura seguindo Clean Architecture para feature de tarefas com Domain, Application, Infrastructure e Presentation layers.

**Arquivo**: `exercises/exercise-5-4-1-clean-architecture.md`

---

### Exercício 2: Feature Modules e Barrel Exports (Intermediário)

**Objetivo**: Organizar código com Feature Modules

**Descrição**:
Organize aplicação usando Feature Modules, Barrel Exports e path aliases.

**Arquivo**: `exercises/exercise-5-4-2-feature-modules.md`

---

### Exercício 3: Design Patterns (Avançado)

**Objetivo**: Implementar Design Patterns

**Descrição**:
Implemente Factory, Strategy, Facade e Repository patterns em aplicação Angular.

**Arquivo**: `exercises/exercise-5-4-3-design-patterns.md`

---

## Referências Externas

### Documentação Oficial

- **[Angular Architecture](https://angular.io/guide/architecture)**: Guia arquitetura Angular
- **[Angular Style Guide](https://angular.io/guide/styleguide)**: Padrões de código recomendados
- **[Angular Module Types](https://angular.io/guide/module-types)**: Tipos de módulos Angular

### Artigos e Tutoriais

- **[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)**: Artigo original de Uncle Bob
- **[SOLID Principles](https://en.wikipedia.org/wiki/SOLID)**: Wikipedia SOLID
- **[Design Patterns](https://refactoring.guru/design-patterns)**: Refactoring Guru

### Vídeos

- **[Angular Architecture Best Practices](https://www.youtube.com/watch?v=WsImoHDJMAQ)**: 5 keys to solid Angular architecture
- **[Clean Architecture in Angular](https://www.youtube.com/results?search_query=clean+architecture+angular)**: Tutoriais práticos

### Ferramentas

- **[Nx](https://nx.dev/)**: Monorepo tools para Angular
- **[Angular ESLint](https://github.com/angular-eslint/angular-eslint)**: Linting para Angular

---

## Resumo

### Principais Conceitos

- Clean Architecture organiza código em camadas com dependências apontando para dentro
- SOLID torna código manutenível através de cinco princípios fundamentais
- Design Patterns resolvem problemas comuns de forma reutilizável
- Feature Modules organizam código por funcionalidade, facilitando lazy loading
- Core e Shared Modules organizam código singleton e compartilhado
- Barrel Exports simplificam imports e criam APIs públicas claras

### Pontos-Chave para Lembrar

- Separe responsabilidades por camadas
- Use Barrel exports para APIs públicas
- Organize por features, não por tipo
- Core Module apenas para singletons
- Aplique SOLID em todos os serviços
- Use interfaces para contratos
- Design Patterns não são obrigatórios, mas úteis

### Próximos Passos

- Próxima aula: Projeto Final Completo
- Praticar arquitetura em projeto real
- Explorar padrões avançados como CQRS e Event Sourcing
- Estudar Domain-Driven Design para projetos complexos

---

## Checklist de Qualidade

Antes de considerar esta aula completa:

- [x] Introdução clara e envolvente com contexto histórico
- [x] Todos os conceitos têm definições e explicações detalhadas
- [x] Analogias presentes para conceitos abstratos
- [x] Diagramas ASCII para visualização de conceitos complexos
- [x] Exemplos práticos completos e funcionais
- [x] Tabela comparativa com outros frameworks
- [x] Boas práticas e anti-padrões documentados
- [x] Exercícios práticos ordenados por dificuldade
- [x] Referências externas validadas e organizadas
- [x] Resumo com pontos principais

---

**Aula Anterior**: [Aula 5.3: Segurança Avançada](./lesson-5-3-seguranca.md)  
**Próxima Aula**: [Aula 5.5: Projeto Final Completo](./lesson-5-5-projeto-final.md)  
**Voltar ao Módulo**: [Módulo 5: Práticas Avançadas e Projeto Final](../modules/module-5-praticas-avancadas-projeto-final.md)
