<?php

namespace Tests\Feature;

use App\Models\Task;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TaskTest extends TestCase
{
    use RefreshDatabase;

    public function test_public_user_cannot_access_tasks(): void
    {
        $response = $this->getJson('/api/tasks');
        $response->assertStatus(401);

        $response = $this->postJson('/api/tasks');
        $response->assertStatus(401);

        $user = User::factory()->create();
        $task = Task::factory()->create();


        $response = $this->getJson('/api/tasks/' . $task->id);
        $response->assertStatus(401);

        $response = $this->deleteJson('/api/tasks/' . $task->id);
        $response->assertStatus(401);

        $response = $this->putJson('/api/tasks/' . $task->id);
        $response->assertStatus(401);
    }

    public function test_create_task_validation(): void
    {
        $user = User::factory()->create();
        $response = $this
        ->actingAs($user)
        ->postJson('/api/tasks',);

        $response->assertStatus(422);
    }

    public function test_public_user_can_save_tasks(): void
    {

        $data = [
            'name' => 'Task 1',
            'description' => 'Task 1 description',
            'priority' => 'High',
        ];

        $user = User::factory()->create();

        $response = $this
        ->actingAs($user)
        ->postJson('/api/tasks', $data);

        $response->assertStatus(201);
        $response->assertJsonStructure(['data' =>  ['id', 'name', 'description', 'priority', 'user_id']]);
        $response->assertJsonFragment( ['name' => 'Task 1']);
        $response->assertJsonFragment( ['user_id' => $user->id]);
    }

    public function test_authorized_cannot_access_unowned_task(): void

    {

        $user = User::factory()->create();
        $user2 = User::factory()->create();

        $task = Task::factory()->create(['user_id' => $user2->id]);

        $response = $this
        ->actingAs($user)
        ->getJson('/api/tasks/' . $task->id);

        $response->assertStatus(403);

    }

}

