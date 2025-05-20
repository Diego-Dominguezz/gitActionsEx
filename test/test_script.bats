#!/usr/bin/env bats

load '../mainScript.sh'

# Contadores globales
setup_file() {
  total_lines=$(grep -vE '^\s*($|#)' ../mainScript.sh 2>/dev/null | wc -l)
  total_lines=${total_lines:-1}
}

# Formato de salida
pass() {
  echo -e "  \033[32m✓\033[0m $1"
}
fail() {
  echo -e "  \033[31m✗\033[0m $1"
  echo -e "    \033[90m$2\033[0m"
}

run_custom_test() {
  input=$1
  expected="Hello, $1!"
  run say_hello "$input"
  [ "$status" -eq 0 ]
  [ "$output" = "$expected" ]
}

@test "say_hello with normal name" {
  run_custom_test "Alice"
}

@test "say_hello with empty input" {
  run_custom_test ""
}

@test "say_hello with spaces" {
  run_custom_test "John Doe"
}

@test "say_hello with special characters" {
  run_custom_test "!@#"
}

@test "say_hello with numbers" {
  run_custom_test "1234"
}
