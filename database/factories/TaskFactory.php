<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Task>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $users = User::all();
        return [
            'name' => $this->faker->sentence(3),
            'description' => $this->faker->sentence(10),
            'priority' => $this->faker->randomElement(['Low', 'Normal', 'High']),
            'user_id' => $users->random()->id,
        ];
    }
}
