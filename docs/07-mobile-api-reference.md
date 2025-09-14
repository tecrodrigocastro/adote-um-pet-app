# API Reference para Desenvolvimento Mobile

Este documento contém a referência completa de todos os endpoints da API "Adote um Pet" para desenvolvimento do aplicativo mobile em Flutter.

**Base URL:** `http://localhost:8001/api`
**WebSocket URL:** `ws://localhost:8080`

## 📱 Headers Padrão

Para todas as requisições autenticadas:
```json
{
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer {access_token}"
}
```

---

## 🔐 Autenticação

### 1. Registro de Usuário Individual

**POST** `/auth/register`

**Payload:**
```json
{
    "name": "João Silva",
    "email": "joao@exemplo.com",
    "password": "password123",
    "phone": "(11) 99999-9999",
    "photo_url": "https://via.placeholder.com/150",
    "address": {
        "street": "Rua Principal, 456",
        "neighborhood": "Centro",
        "number_house": 456,
        "complement": "Apt 101",
        "zip_code": "01234-567",
        "city": "São Paulo",
        "state": "SP"
    }
}
```

**Campos obrigatórios:** name, email, password
**Campos opcionais:** phone, photo_url, address

**Response (201):**
```json
{
    "success": true,
    "message": "Usuário cadastrado com sucesso!",
    "data": {
        "id": 1,
        "name": "João Silva",
        "email": "joao@exemplo.com",
        "user_type": "individual",
        "phone": "(11) 99999-9999",
        "photo_url": "https://via.placeholder.com/150",
        "email_verified_at": null,
        "created_at": "2025-09-14T14:30:00.000000Z",
        "updated_at": "2025-09-14T14:30:00.000000Z",
        "addresses": [
            {
                "id": 1,
                "user_id": 1,
                "street": "Rua Principal, 456",
                "neighborhood": "Centro",
                "number_house": 456,
                "complement": "Apt 101",
                "zip_code": "01234-567",
                "city": "São Paulo",
                "state": "SP",
                "created_at": "2025-09-14T14:30:00.000000Z",
                "updated_at": "2025-09-14T14:30:00.000000Z"
            }
        ],
        "access_token": "1|abcd1234efgh5678ijkl9012mnop3456"
    }
}
```

### 2. Registro de Organização (ONG)

**POST** `/auth/register`

**Payload:**
```json
{
    "email": "contato@ongamigos.org",
    "password": "password123",
    "user_type": "organization",
    "organization_name": "ONG Amigos dos Animais",
    "cnpj": "12345678000195",
    "responsible_name": "Maria Santos",
    "phone": "(11) 98888-8888",
    "mission_statement": "Resgatamos e cuidamos de animais abandonados, promovendo adoções responsáveis e conscientização sobre o bem-estar animal.",
    "website": "https://ongamigos.org",
    "social_media": {
        "facebook": "https://facebook.com/ongamigos",
        "instagram": "https://instagram.com/ongamigos",
        "twitter": "https://twitter.com/ongamigos"
    },
    "address": {
        "street": "Rua das Flores, 123",
        "neighborhood": "Centro",
        "number_house": 123,
        "complement": "Sala 101",
        "zip_code": "01234-567",
        "city": "São Paulo",
        "state": "SP"
    }
}
```

**Campos obrigatórios:** email, password, user_type, organization_name
**Campos opcionais:** cnpj, responsible_name, phone, mission_statement, website, social_media, address

**Response (201):**
```json
{
    "success": true,
    "message": "Organização cadastrada com sucesso! Aguardando verificação.",
    "data": {
        "id": 2,
        "email": "contato@ongamigos.org",
        "user_type": "organization",
        "organization_name": "ONG Amigos dos Animais",
        "name": "ONG Amigos dos Animais",
        "cnpj": "12345678000195",
        "responsible_name": "Maria Santos",
        "phone": "(11) 98888-8888",
        "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
        "website": "https://ongamigos.org",
        "social_media": {
            "facebook": "https://facebook.com/ongamigos",
            "instagram": "https://instagram.com/ongamigos",
            "twitter": "https://twitter.com/ongamigos"
        },
        "verified": false,
        "verified_at": null,
        "photo_url": null,
        "created_at": "2025-09-14T14:35:00.000000Z",
        "updated_at": "2025-09-14T14:35:00.000000Z",
        "addresses": [
            {
                "id": 1,
                "user_id": 2,
                "street": "Rua das Flores, 123",
                "neighborhood": "Centro",
                "number_house": 123,
                "complement": "Sala 101",
                "zip_code": "01234-567",
                "city": "São Paulo",
                "state": "SP",
                "created_at": "2025-09-14T14:35:00.000000Z",
                "updated_at": "2025-09-14T14:35:00.000000Z"
            }
        ]
    }
}
```

### 3. Login (Unificado para Usuários e ONGs)

**POST** `/auth/login`

**Payload:**
```json
{
    "email": "joao@exemplo.com",
    "password": "password123"
}
```

**Response para Usuário Individual (200):**
```json
{
    "success": true,
    "message": "Login realizado com sucesso!",
    "data": {
        "user": {
            "id": 1,
            "name": "João Silva",
            "email": "joao@exemplo.com",
            "user_type": "individual",
            "phone": "(11) 99999-9999",
            "photo_url": "https://via.placeholder.com/150",
            "email_verified_at": null,
            "created_at": "2025-09-14T14:30:00.000000Z",
            "updated_at": "2025-09-14T14:30:00.000000Z"
        },
        "access_token": "2|xyz9876abc5432def1098ghi7654jkl"
    }
}
```

**Response para Organização (200):**
```json
{
    "success": true,
    "message": "Login realizado com sucesso!",
    "data": {
        "user": {
            "id": 2,
            "name": "ONG Amigos dos Animais",
            "email": "contato@ongamigos.org",
            "user_type": "organization",
            "organization_name": "ONG Amigos dos Animais",
            "cnpj": "12345678000195",
            "responsible_name": "Maria Santos",
            "phone": "(11) 98888-8888",
            "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
            "website": "https://ongamigos.org",
            "social_media": {
                "facebook": "https://facebook.com/ongamigos",
                "instagram": "https://instagram.com/ongamigos",
                "twitter": "https://twitter.com/ongamigos"
            },
            "verified": false,
            "verified_at": null,
            "photo_url": null,
            "email_verified_at": null,
            "created_at": "2025-09-14T14:35:00.000000Z",
            "updated_at": "2025-09-14T14:35:00.000000Z"
        },
        "access_token": "3|abc1234def5678ghi9012jkl3456mno"
    }
}
```

**Nota:** O login é o mesmo endpoint para ambos os tipos de usuário. Os campos retornados variam conforme o `user_type`:
- **Individual:**  photo_url (opcionais)
- **Organization:** organization_name, cnpj, responsible_name, mission_statement, website, social_media, verified, verified_at (opcionais)

### 4. Dados do Usuário Autenticado

**GET** `/auth/me` *(Auth Required)*

**Response para Usuário Individual (200):**
```json
{
    "success": true,
    "message": "Dados do usuário recuperados com sucesso!",
    "data": {
        "id": 1,
        "name": "João Silva",
        "email": "joao@exemplo.com",
        "user_type": "individual",
        "phone": "(11) 99999-9999",
        "photo_url": "https://via.placeholder.com/150",
        "email_verified_at": null,
        "created_at": "2025-09-14T14:30:00.000000Z",
        "updated_at": "2025-09-14T14:30:00.000000Z",
        "addresses": [
            {
                "id": 1,
                "street": "Rua Principal, 456",
                "neighborhood": "Centro",
                "number_house": 456,
                "complement": "Apt 101",
                "zip_code": "01234-567",
                "city": "São Paulo",
                "state": "SP"
            }
        ]
    }
}
```

**Response para Organização (200):**
```json
{
    "success": true,
    "message": "Dados do usuário recuperados com sucesso!",
    "data": {
        "id": 2,
        "name": "ONG Amigos dos Animais",
        "email": "contato@ongamigos.org",
        "user_type": "organization",
        "organization_name": "ONG Amigos dos Animais",
        "cnpj": "12345678000195",
        "responsible_name": "Maria Santos",
        "phone": "(11) 98888-8888",
        "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
        "website": "https://ongamigos.org",
        "social_media": {
            "facebook": "https://facebook.com/ongamigos",
            "instagram": "https://instagram.com/ongamigos",
            "twitter": "https://twitter.com/ongamigos"
        },
        "verified": false,
        "verified_at": null,
        "photo_url": null,
        "email_verified_at": null,
        "created_at": "2025-09-14T14:35:00.000000Z",
        "updated_at": "2025-09-14T14:35:00.000000Z",
        "addresses": [
            {
                "id": 1,
                "street": "Rua das Flores, 123",
                "neighborhood": "Centro",
                "number_house": 123,
                "complement": "Sala 101",
                "zip_code": "01234-567",
                "city": "São Paulo",
                "state": "SP"
            }
        ]
    }
}
```

**Nota:** Os campos retornados variam conforme o `user_type` do usuário autenticado.

### 5. Logout

**POST** `/auth/logout` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Logout realizado com sucesso!",
    "data": []
}
```

---

## 🏢 Organizações

### 1. Listar Organizações (Público)

**GET** `/organizations?search=amigos&city=São Paulo&per_page=10`

**Query Parameters:**
- `search` (opcional): Buscar por nome ou missão
- `city` (opcional): Filtrar por cidade
- `state` (opcional): Filtrar por estado
- `per_page` (opcional): Itens por página (padrão: 20, máx: 100)

**Response (200):**
```json
{
    "success": true,
    "message": "Organizações listadas com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 2,
                "organization_name": "ONG Amigos dos Animais",
                "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
                "website": "https://ongamigos.org",
                "social_media": {
                    "facebook": "https://facebook.com/ongamigos",
                    "instagram": "https://instagram.com/ongamigos",
                    "twitter": "https://twitter.com/ongamigos"
                },
                "verified": true,
                "verified_at": "2025-09-14T15:00:00.000000Z",
                "created_at": "2025-09-14T14:35:00.000000Z",
                "addresses": [
                    {
                        "id": 1,
                        "city": "São Paulo",
                        "state": "SP",
                        "neighborhood": "Centro"
                    }
                ]
            }
        ],
        "per_page": 10,
        "total": 1,
        "current_page": 1,
        "last_page": 1,
        "has_more_pages": false
    }
}
```

### 2. Detalhes da Organização

**GET** `/organizations/{id}`

**Response (200):**
```json
{
    "success": true,
    "message": "Organização recuperada com sucesso!",
    "data": {
        "id": 2,
        "organization_name": "ONG Amigos dos Animais",
        "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
        "website": "https://ongamigos.org",
        "social_media": {
            "facebook": "https://facebook.com/ongamigos",
            "instagram": "https://instagram.com/ongamigos",
            "twitter": "https://twitter.com/ongamigos"
        },
        "verified": true,
        "verified_at": "2025-09-14T15:00:00.000000Z",
        "addresses": [
            {
                "id": 1,
                "user_id": 2,
                "street": "Rua das Flores, 123",
                "neighborhood": "Centro",
                "number_house": 123,
                "complement": "Sala 101",
                "zip_code": "01234-567",
                "city": "São Paulo",
                "state": "SP"
            }
        ],
        "pets_count": 12,
        "recent_pets": [
            {
                "id": 1,
                "name": "Buddy",
                "type": "dog",
                "size": "medium",
                "status": "unadopted",
                "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"]
            }
        ],
        "created_at": "2025-09-14T14:35:00.000000Z"
    }
}
```

### 3. Estatísticas da Organização (Dashboard)

**GET** `/organizations/{id}/statistics` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Estatísticas recuperadas com sucesso!",
    "data": {
        "total_pets": 45,
        "available_pets": 32,
        "adopted_pets": 13,
        "pending_adoptions": 8,
        "approved_adoptions": 13,
        "volunteers_count": 12,
        "active_chats": 15
    }
}
```

### 4. Pets da Organização

**GET** `/organizations/{id}/pets?status=unadopted&type=dog&per_page=20`

**Query Parameters:**
- `status` (opcional): unadopted, adopted, pending
- `type` (opcional): dog, cat, rabbit, bird, other
- `gender` (opcional): male, female, unknown
- `size` (opcional): small, medium, large, unknown
- `per_page` (opcional): Itens por página

**Response (200):**
```json
{
    "success": true,
    "message": "Pets da organização listados com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "name": "Buddy",
                "type": "dog",
                "gender": "male",
                "size": "medium",
                "birth_date": "2022-06-15",
                "breed": "Labrador Mix",
                "color": "Dourado",
                "description": "Buddy é um cão muito carinhoso e brincalhão...",
                "status": "unadopted",
                "photos": [
                    "https://via.placeholder.com/400x300?text=Buddy+1",
                    "https://via.placeholder.com/400x300?text=Buddy+2"
                ],
                "created_at": "2025-09-14T15:30:00.000000Z",
                "updated_at": "2025-09-14T15:30:00.000000Z"
            }
        ],
        "per_page": 20,
        "total": 12,
        "current_page": 1,
        "last_page": 1,
        "has_more_pages": false
    }
}
```

---

## 🐾 Gestão de Pets

### 1. Listar Pets

**GET** `/pets?type=dog&gender=male&size=medium&per_page=20` *(Auth Required)*

**Query Parameters:**
- `type` (opcional): dog, cat, rabbit, bird, other
- `gender` (opcional): male, female, unknown
- `size` (opcional): small, medium, large, unknown
- `status` (opcional): unadopted, adopted, pending
- `organization_id` (opcional): ID da organização
- `per_page` (opcional): Itens por página (máx 100)

**Response (200):**
```json
{
    "success": true,
    "message": "Pets listados com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "user_id": 2,
                "name": "Buddy",
                "type": "dog",
                "gender": "male",
                "size": "medium",
                "birth_date": "2022-06-15",
                "breed": "Labrador Mix",
                "color": "Dourado",
                "description": "Buddy é um cão muito carinhoso e brincalhão...",
                "status": "unadopted",
                "photos": [
                    "https://via.placeholder.com/400x300?text=Buddy+1",
                    "https://via.placeholder.com/400x300?text=Buddy+2"
                ],
                "created_at": "2025-09-14T15:30:00.000000Z",
                "updated_at": "2025-09-14T15:30:00.000000Z",
                "user": {
                    "id": 2,
                    "name": "ONG Amigos dos Animais"
                }
            }
        ],
        "per_page": 20,
        "total": 15,
        "current_page": 1,
        "last_page": 1,
        "has_more_pages": false
    }
}
```

### 2. Cadastrar Pet

**POST** `/pets` *(Auth Required)*

**Payload:**
```json
{
    "name": "Buddy",
    "type": "dog",
    "gender": "male",
    "size": "medium",
    "birth_date": "2022-06-15",
    "breed": "Labrador Mix",
    "color": "Dourado",
    "description": "Buddy é um cão muito carinhoso e brincalhão, ideal para famílias com crianças. Ele adora passear no parque e brincar com outros cães.",
    "photos": [
        "https://via.placeholder.com/400x300?text=Buddy+1",
        "https://via.placeholder.com/400x300?text=Buddy+2",
        "https://via.placeholder.com/400x300?text=Buddy+3"
    ],
    "organization_id": null
}
```

**Campos obrigatórios:** name, type, gender, size, description, photos
**Campos opcionais:** birth_date, breed, color, organization_id

**Response (201):**
```json
{
    "success": true,
    "message": "Pet cadastrado com sucesso!",
    "data": {
        "id": 3,
        "user_id": 1,
        "name": "Buddy",
        "type": "dog",
        "gender": "male",
        "size": "medium",
        "birth_date": "2022-06-15",
        "breed": "Labrador Mix",
        "color": "Dourado",
        "description": "Buddy é um cão muito carinhoso e brincalhão...",
        "status": "unadopted",
        "photos": [
            "https://via.placeholder.com/400x300?text=Buddy+1",
            "https://via.placeholder.com/400x300?text=Buddy+2",
            "https://via.placeholder.com/400x300?text=Buddy+3"
        ],
        "created_at": "2025-09-14T16:00:00.000000Z",
        "updated_at": "2025-09-14T16:00:00.000000Z",
        "user": {
            "id": 1,
            "name": "João Silva"
        }
    }
}
```

### 3. Detalhes do Pet

**GET** `/pets/{id}` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Pet recuperado com sucesso!",
    "data": {
        "id": 1,
        "user_id": 2,
        "name": "Buddy",
        "type": "dog",
        "gender": "male",
        "size": "medium",
        "birth_date": "2022-06-15",
        "breed": "Labrador Mix",
        "color": "Dourado",
        "description": "Buddy é um cão muito carinhoso e brincalhão...",
        "status": "unadopted",
        "photos": [
            "https://via.placeholder.com/400x300?text=Buddy+1",
            "https://via.placeholder.com/400x300?text=Buddy+2",
            "https://via.placeholder.com/400x300?text=Buddy+3"
        ],
        "created_at": "2025-09-14T15:30:00.000000Z",
        "updated_at": "2025-09-14T15:30:00.000000Z",
        "user": {
            "id": 2,
            "name": "ONG Amigos dos Animais",
            "organization_name": "ONG Amigos dos Animais",
            "verified": true
        }
    }
}
```

### 4. Atualizar Pet

**PUT** `/pets/{id}` *(Auth Required)*

**Payload:**
```json
{
    "name": "Buddy Atualizado",
    "description": "Buddy é um cão extremamente carinhoso, brincalhão e sociável. Ideal para famílias com crianças e outros pets. Já foi vacinado e castrado.",
    "breed": "Labrador Retriever Mix",
    "color": "Dourado com manchas brancas"
}
```

**Response (200):**
```json
{
    "success": true,
    "message": "Pet atualizado com sucesso!",
    "data": {
        "id": 1,
        "name": "Buddy Atualizado",
        "description": "Buddy é um cão extremamente carinhoso, brincalhão e sociável...",
        "breed": "Labrador Retriever Mix",
        "color": "Dourado com manchas brancas",
        "updated_at": "2025-09-14T16:30:00.000000Z"
    }
}
```

### 5. Atualizar Fotos do Pet

**POST** `/pets/{id}/photos` *(Auth Required)*

**Payload:**
```json
{
    "photos": [
        "https://via.placeholder.com/400x300?text=Buddy+New+1",
        "https://via.placeholder.com/400x300?text=Buddy+New+2",
        "https://via.placeholder.com/400x300?text=Buddy+New+3"
    ]
}
```

**Response (200):**
```json
{
    "success": true,
    "message": "Fotos atualizadas com sucesso!",
    "data": {
        "id": 1,
        "name": "Buddy",
        "photos": [
            "https://via.placeholder.com/400x300?text=Buddy+New+1",
            "https://via.placeholder.com/400x300?text=Buddy+New+2",
            "https://via.placeholder.com/400x300?text=Buddy+New+3"
        ],
        "updated_at": "2025-09-14T16:35:00.000000Z"
    }
}
```

### 6. Excluir Pet

**DELETE** `/pets/{id}` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Pet deletado com sucesso!",
    "data": []
}
```

---

## 💕 Sistema de Adoções

### 1. Solicitar Adoção

**POST** `/adoptions/pets/{pet_id}` *(Auth Required)*

**Payload:**
```json
{
    "message": "Olá! Tenho muito interesse em adotar o Buddy. Tenho experiência com cães e uma casa com quintal grande. Posso oferecer muito amor e cuidado. Quando posso conhecê-lo pessoalmente?"
}
```

**Response (201):**
```json
{
    "success": true,
    "message": "Solicitação de adoção enviada com sucesso!",
    "data": {
        "id": 1,
        "adopter_id": 1,
        "pet_id": 1,
        "owner_id": 2,
        "status": "pending",
        "message": "Olá! Tenho muito interesse em adotar o Buddy...",
        "adoption_date": null,
        "created_at": "2025-09-14T17:00:00.000000Z",
        "updated_at": "2025-09-14T17:00:00.000000Z",
        "pet": {
            "id": 1,
            "name": "Buddy",
            "type": "dog",
            "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"]
        },
        "adopter": {
            "id": 1,
            "name": "João Silva",
            "email": "joao@exemplo.com",
            "phone": "(11) 99999-9999"
        },
        "owner": {
            "id": 2,
            "name": "ONG Amigos dos Animais"
        }
    }
}
```

### 2. Minhas Solicitações de Adoção

**GET** `/adoptions/my/requests` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Suas solicitações recuperadas com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "adopter_id": 1,
                "pet_id": 1,
                "owner_id": 2,
                "status": "pending",
                "message": "Olá! Tenho muito interesse em adotar o Buddy...",
                "adoption_date": null,
                "created_at": "2025-09-14T17:00:00.000000Z",
                "pet": {
                    "id": 1,
                    "name": "Buddy",
                    "type": "dog",
                    "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"],
                    "status": "unadopted"
                },
                "owner": {
                    "id": 2,
                    "name": "ONG Amigos dos Animais",
                    "organization_name": "ONG Amigos dos Animais",
                    "photo_url": null
                }
            }
        ],
        "per_page": 20,
        "total": 1
    }
}
```

### 3. Solicitações Recebidas (para ONGs)

**GET** `/adoptions/received/requests` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Solicitações recebidas recuperadas com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "adopter_id": 1,
                "pet_id": 1,
                "owner_id": 2,
                "status": "pending",
                "message": "Olá! Tenho muito interesse em adotar o Buddy...",
                "adoption_date": null,
                "created_at": "2025-09-14T17:00:00.000000Z",
                "pet": {
                    "id": 1,
                    "name": "Buddy",
                    "type": "dog",
                    "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"]
                },
                "adopter": {
                    "id": 1,
                    "name": "João Silva",
                    "email": "joao@exemplo.com",
                    "phone": "(11) 99999-9999"
                }
            }
        ],
        "per_page": 20,
        "total": 3
    }
}
```

### 4. Aprovar Adoção

**PATCH** `/adoptions/{id}/approve` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Adoção aprovada com sucesso!",
    "data": {
        "id": 1,
        "adopter_id": 1,
        "pet_id": 1,
        "owner_id": 2,
        "status": "approved",
        "adoption_date": "2025-09-14T17:30:00.000000Z",
        "updated_at": "2025-09-14T17:30:00.000000Z",
        "pet": {
            "id": 1,
            "name": "Buddy",
            "status": "adopted"
        },
        "adopter": {
            "id": 1,
            "name": "João Silva",
            "email": "joao@exemplo.com"
        },
        "owner": {
            "id": 2,
            "name": "ONG Amigos dos Animais"
        }
    }
}
```

### 5. Rejeitar Adoção

**PATCH** `/adoptions/{id}/reject` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Adoção rejeitada",
    "data": {
        "id": 1,
        "status": "rejected",
        "updated_at": "2025-09-14T17:35:00.000000Z"
    }
}
```

### 6. Detalhes da Adoção

**GET** `/adoptions/{id}` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Adoção recuperada com sucesso!",
    "data": {
        "id": 1,
        "adopter_id": 1,
        "pet_id": 1,
        "owner_id": 2,
        "status": "approved",
        "message": "Olá! Tenho muito interesse em adotar o Buddy...",
        "adoption_date": "2025-09-14T17:30:00.000000Z",
        "created_at": "2025-09-14T17:00:00.000000Z",
        "updated_at": "2025-09-14T17:30:00.000000Z",
        "pet": {
            "id": 1,
            "name": "Buddy",
            "type": "dog",
            "breed": "Labrador Mix",
            "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"]
        },
        "adopter": {
            "id": 1,
            "name": "João Silva",
            "email": "joao@exemplo.com",
            "phone": "(11) 99999-9999"
        },
        "owner": {
            "id": 2,
            "name": "ONG Amigos dos Animais",
            "organization_name": "ONG Amigos dos Animais"
        }
    }
}
```

---

## 💬 Sistema de Chat

### 1. Listar Chats

**GET** `/chats` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Chats recuperados com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "adopter_id": 1,
                "owner_id": 2,
                "pet_id": 1,
                "created_at": "2025-09-14T17:00:00.000000Z",
                "updated_at": "2025-09-14T18:00:00.000000Z",
                "pet": {
                    "id": 1,
                    "name": "Buddy",
                    "type": "dog",
                    "photos": ["https://via.placeholder.com/400x300?text=Buddy+1"],
                    "status": "unadopted"
                },
                "adopter": {
                    "id": 1,
                    "name": "João Silva",
                    "email": "joao@exemplo.com",
                    "photo_url": null
                },
                "owner": {
                    "id": 2,
                    "name": "ONG Amigos dos Animais",
                    "organization_name": "ONG Amigos dos Animais",
                    "photo_url": null
                },
                "latest_message": {
                    "id": 3,
                    "content": "Perfeito! Estaremos esperando você no sábado às 14h.",
                    "created_at": "2025-09-14T18:00:00.000000Z",
                    "user": {
                        "id": 2,
                        "name": "ONG Amigos dos Animais"
                    }
                },
                "unread_count": 0
            }
        ],
        "per_page": 20,
        "total": 5
    }
}
```

### 2. Criar Chat

**POST** `/chats` *(Auth Required)*

**Payload:**
```json
{
    "pet_id": 1,
    "owner_id": 2
}
```

**Response (201):**
```json
{
    "success": true,
    "message": "Chat criado com sucesso!",
    "data": {
        "id": 2,
        "adopter_id": 1,
        "owner_id": 2,
        "pet_id": 1,
        "created_at": "2025-09-14T18:30:00.000000Z",
        "updated_at": "2025-09-14T18:30:00.000000Z",
        "pet": {
            "id": 1,
            "name": "Buddy",
            "type": "dog"
        },
        "adopter": {
            "id": 1,
            "name": "João Silva"
        },
        "owner": {
            "id": 2,
            "name": "ONG Amigos dos Animais"
        }
    }
}
```

### 3. Detalhes do Chat com Mensagens

**GET** `/chats/{id}` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Chat recuperado com sucesso!",
    "data": {
        "chat": {
            "id": 1,
            "adopter_id": 1,
            "owner_id": 2,
            "pet_id": 1,
            "pet": {
                "id": 1,
                "name": "Buddy",
                "type": "dog"
            },
            "adopter": {
                "id": 1,
                "name": "João Silva"
            },
            "owner": {
                "id": 2,
                "name": "ONG Amigos dos Animais"
            }
        },
        "messages": {
            "current_page": 1,
            "data": [
                {
                    "id": 1,
                    "chat_id": 1,
                    "user_id": 1,
                    "content": "Olá! Tenho muito interesse em adotar o Buddy. Quando posso conhecê-lo?",
                    "read_at": "2025-09-14T17:45:00.000000Z",
                    "created_at": "2025-09-14T17:30:00.000000Z",
                    "user": {
                        "id": 1,
                        "name": "João Silva",
                        "photo_url": null
                    }
                },
                {
                    "id": 2,
                    "chat_id": 1,
                    "user_id": 2,
                    "content": "Olá João! Que bom saber do seu interesse no Buddy. Você pode vir conhecê-lo no sábado pela manhã. Que horário seria melhor para você?",
                    "read_at": "2025-09-14T17:55:00.000000Z",
                    "created_at": "2025-09-14T17:50:00.000000Z",
                    "user": {
                        "id": 2,
                        "name": "ONG Amigos dos Animais",
                        "photo_url": null
                    }
                }
            ],
            "per_page": 20,
            "total": 2
        }
    }
}
```

### 4. Enviar Mensagem

**POST** `/messages` *(Auth Required)*

**Payload:**
```json
{
    "chat_id": 1,
    "content": "Perfeito! Estaremos esperando você no sábado às 14h. Nosso endereço é Rua das Flores, 123 - Centro."
}
```

**Response (201):**
```json
{
    "success": true,
    "message": "Message created successfully",
    "data": {
        "message": {
            "id": 3,
            "chat_id": 1,
            "user_id": 2,
            "content": "Perfeito! Estaremos esperando você no sábado às 14h. Nosso endereço é Rua das Flores, 123 - Centro.",
            "read_at": null,
            "created_at": "2025-09-14T18:00:00.000000Z",
            "updated_at": "2025-09-14T18:00:00.000000Z",
            "user": {
                "id": 2,
                "name": "ONG Amigos dos Animais",
                "photo_url": null
            }
        },
        "is_me": true
    }
}
```

### 5. Marcar Chat como Lido

**PUT** `/chats/{id}/mark-read` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Mensagens marcadas como lidas",
    "data": null
}
```

---

## 📍 Gestão de Endereços

### 1. Listar Endereços

**GET** `/addresses` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Endereços listados com sucesso!",
    "data": [
        {
            "id": 1,
            "user_id": 1,
            "street": "Rua Principal, 456",
            "neighborhood": "Centro",
            "number_house": 456,
            "complement": "Apt 101",
            "zip_code": "01234-567",
            "city": "São Paulo",
            "state": "SP",
            "created_at": "2025-09-14T14:30:00.000000Z",
            "updated_at": "2025-09-14T14:30:00.000000Z"
        }
    ]
}
```

### 2. Criar Endereço

**POST** `/addresses` *(Auth Required)*

**Payload:**
```json
{
    "street": "Rua das Palmeiras, 456",
    "neighborhood": "Vila Olímpia",
    "number_house": 456,
    "complement": "Bloco B, Apt 201",
    "zip_code": "04547-001",
    "city": "São Paulo",
    "state": "SP"
}
```

**Response (201):**
```json
{
    "success": true,
    "message": "Endereço criado com sucesso!",
    "data": {
        "id": 2,
        "user_id": 1,
        "street": "Rua das Palmeiras, 456",
        "neighborhood": "Vila Olímpia",
        "number_house": 456,
        "complement": "Bloco B, Apt 201",
        "zip_code": "04547-001",
        "city": "São Paulo",
        "state": "SP",
        "created_at": "2025-09-14T19:00:00.000000Z",
        "updated_at": "2025-09-14T19:00:00.000000Z"
    }
}
```

### 3. Atualizar Endereço

**PUT** `/addresses/{id}` *(Auth Required)*

**Payload:**
```json
{
    "street": "Rua das Palmeiras, 456",
    "neighborhood": "Vila Olímpia",
    "number_house": 456,
    "complement": "Bloco B, Apt 202 - Atualizado",
    "zip_code": "04547-001",
    "city": "São Paulo",
    "state": "SP"
}
```

**Response (200):**
```json
{
    "success": true,
    "message": "Endereço atualizado com sucesso!",
    "data": {
        "id": 2,
        "user_id": 1,
        "street": "Rua das Palmeiras, 456",
        "neighborhood": "Vila Olímpia",
        "number_house": 456,
        "complement": "Bloco B, Apt 202 - Atualizado",
        "zip_code": "04547-001",
        "city": "São Paulo",
        "state": "SP",
        "updated_at": "2025-09-14T19:30:00.000000Z"
    }
}
```

---

## 👥 Sistema de Voluntários (para ONGs)

### 1. Listar Voluntários

**GET** `/organizations/{id}/volunteers?role=admin&active=true&per_page=20` *(Auth Required)*

**Query Parameters:**
- `role` (opcional): admin, manager, volunteer
- `active` (opcional): true, false
- `per_page` (opcional): Itens por página

**Response (200):**
```json
{
    "success": true,
    "message": "Voluntários listados com sucesso!",
    "data": {
        "current_page": 1,
        "data": [
            {
                "id": 1,
                "organization_id": 2,
                "volunteer_id": 3,
                "role": "admin",
                "permissions": [
                    "manage_volunteers",
                    "approve_adoptions",
                    "create_pets",
                    "edit_pets",
                    "delete_pets",
                    "view_reports",
                    "configure_organization"
                ],
                "active": true,
                "joined_at": "2025-09-14T20:00:00.000000Z",
                "volunteer": {
                    "id": 3,
                    "name": "Carlos Silva",
                    "email": "carlos@exemplo.com",
                    "phone": "(11) 99999-9999"
                }
            }
        ],
        "per_page": 20,
        "total": 5
    }
}
```

### 2. Convidar Voluntário

**POST** `/organizations/{id}/volunteers/invite` *(Auth Required)*

**Payload:**
```json
{
    "volunteer_id": 3,
    "role": "manager",
    "permissions": [
        "create_pets",
        "edit_pets",
        "approve_adoptions",
        "view_reports"
    ]
}
```

**Response (201):**
```json
{
    "success": true,
    "message": "Voluntário adicionado com sucesso!",
    "data": {
        "id": 2,
        "organization_id": 2,
        "volunteer_id": 3,
        "role": "manager",
        "permissions": [
            "create_pets",
            "edit_pets",
            "approve_adoptions",
            "view_reports"
        ],
        "active": true,
        "joined_at": "2025-09-14T20:30:00.000000Z",
        "created_at": "2025-09-14T20:30:00.000000Z",
        "updated_at": "2025-09-14T20:30:00.000000Z",
        "volunteer": {
            "id": 3,
            "name": "Carlos Silva",
            "email": "carlos@exemplo.com"
        }
    }
}
```

### 3. Minhas Organizações

**GET** `/volunteers/my-organizations` *(Auth Required)*

**Response (200):**
```json
{
    "success": true,
    "message": "Suas organizações recuperadas com sucesso!",
    "data": [
        {
            "id": 1,
            "organization_id": 2,
            "volunteer_id": 3,
            "role": "manager",
            "permissions": [
                "create_pets",
                "edit_pets",
                "approve_adoptions",
                "view_reports"
            ],
            "active": true,
            "joined_at": "2025-09-14T20:30:00.000000Z",
            "organization": {
                "id": 2,
                "organization_name": "ONG Amigos dos Animais",
                "mission_statement": "Resgatamos e cuidamos de animais abandonados...",
                "verified": true,
                "photo_url": null
            }
        }
    ]
}
```

---

## 🌐 WebSocket (Chat em Tempo Real)

### Configuração de Conexão

**URL WebSocket:** `ws://localhost:8080`

**Configuração JavaScript:**
```javascript
const pusher = new Pusher('bloxwlokqhk79ytuis5q', {
    wsHost: 'localhost',
    wsPort: 8080,
    wssPort: 8080,
    forceTLS: false,
    encrypted: false,
    disableStats: true,
    enabledTransports: ['ws', 'wss'],
    cluster: 'mt1',
    auth: {
        headers: {
            'Authorization': `Bearer ${authToken}`
        }
    }
});
```

### Canais Privados

**Formato do Canal:** `private-chat.{chat_id}`

**Event:** `App\Events\MessageSent`

**Payload recebido via WebSocket:**
```json
{
    "message": {
        "id": 4,
        "chat_id": 1,
        "user_id": 1,
        "content": "Obrigado! Nos vemos no sábado então!",
        "read_at": null,
        "created_at": "2025-09-14T18:30:00.000000Z",
        "user": {
            "id": 1,
            "name": "João Silva",
            "photo_url": null
        }
    },
    "is_me": false
}
```

---

## 📱 Enums e Constantes

### Tipos de Pet
```json
["dog", "cat", "rabbit", "bird", "other"]
```

### Gêneros
```json
["male", "female", "unknown"]
```

### Tamanhos
```json
["small", "medium", "large", "unknown"]
```

### Status de Pet
```json
["unadopted", "pending", "adopted"]
```

### Status de Adoção
```json
["pending", "approved", "rejected"]
```

### Tipos de Usuário
```json
["individual", "organization"]
```

### Roles de Voluntários
```json
["admin", "manager", "volunteer"]
```

### Permissões Disponíveis
```json
[
    "manage_volunteers",
    "approve_adoptions", 
    "create_pets",
    "edit_pets",
    "delete_pets",
    "view_reports",
    "configure_organization"
]
```

---

## ❌ Tratamento de Erros

### Formato Padrão de Erro
```json
{
    "success": false,
    "message": "Mensagem de erro descritiva",
    "data": null,
    "errors": {
        "campo": ["Erro específico do campo"]
    }
}
```

### Códigos HTTP Comuns
- **200**: Sucesso
- **201**: Criado com sucesso
- **400**: Erro de validação
- **401**: Não autorizado
- **403**: Proibido
- **404**: Não encontrado
- **422**: Entidade não processável (validação)
- **500**: Erro interno do servidor

### Exemplos de Erros

**Erro de Validação (422):**
```json
{
    "success": false,
    "message": "Os dados fornecidos são inválidos.",
    "data": null,
    "errors": {
        "email": ["O campo email é obrigatório."],
        "password": ["O campo password deve ter pelo menos 8 caracteres."]
    }
}
```

**Não Autorizado (401):**
```json
{
    "success": false,
    "message": "Não autorizado.",
    "data": null
}
```

**Não Encontrado (404):**
```json
{
    "success": false,
    "message": "Pet não encontrado.",
    "data": null
}
```

---

## 🔧 Configurações Importantes

### Upload de Imagens
- **Formatos aceitos:** jpeg, png, jpg, webp
- **Tamanho máximo:** 5MB por imagem
- **Dimensões:** mín 300x300px, máx 2000x2000px
- **Quantidade:** 1-5 imagens por pet

### Paginação
- **Padrão:** 20 itens por página
- **Máximo:** 100 itens por página
- **Parâmetro:** `per_page`

### Rate Limiting
- **API geral:** 60 requests por minuto
- **Login:** 5 tentativas por minuto
- **Upload:** 10 uploads por minuto

### Ambiente
- **Desenvolvimento:** http://localhost:8001
- **WebSocket:** ws://localhost:8080
- **Documentação:** http://localhost:8001/api/documentation

---

**✅ Este documento contém TODOS os endpoints necessários para desenvolvimento mobile completo do app "Adote um Pet"**