#!/usr/bin/env bats

load '../mainScript.sh'

@test "say_hello prints the correct message" {
  run say_hello "Bobby"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Bobby!" ]
  echo "Métrica: Cobertura funcional – caso base"
}

@test "say_hello handles empty input" {
  run say_hello ""
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, !" ]
  echo "Métrica: Prueba de borde – entrada vacía"
}

@test "say_hello handles names with spaces" {
  run say_hello "Mary Jane"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, Mary Jane!" ]
  echo "Métrica: Robustez – entrada con espacios"
}

@test "say_hello handles special characters" {
  run say_hello "@dm1n!"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, @dm1n!!" ]
  echo "Métrica: Robustez – caracteres especiales"
}

@test "say_hello handles numeric input" {
  run say_hello "1234"
  [ "$status" -eq 0 ]
  [ "$output" = "Hello, 1234!" ]
  echo "Métrica: Cobertura – entrada numérica"
}

@test "say_hello execution time is under 100ms" {
  start=$(date +%s%3N)
  run say_hello "SpeedTest"
  end=$(date +%s%3N)
  elapsed=$((end - start))
  [ "$status" -eq 0 ]
  [ "$elapsed" -lt 100 ]
  echo "Métrica: Rendimiento – tiempo de ejecución ${elapsed}ms"
}
