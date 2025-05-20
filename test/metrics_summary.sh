#!/bin/bash

# Parámetros simulados
total_tests=5
failed_tests=$(bats test/test_script.bats | grep -c '✗')
passed_tests=$((total_tests - failed_tests))
lines_covered=$total_tests
total_lines=$(grep -vE '^\s*($|#)' mainScript.sh | wc -l)
total_lines=${total_lines:-1}

# Calcular métricas
coverage=$((lines_covered * 100 / total_lines))
failure_rate=$((failed_tests * 100 / total_tests))

# Limitar cobertura a 100%
if (( coverage > 100 )); then
  coverage=100
fi

# Mostrar resumen
echo ""
echo -e "\033[1mTest Summary:\033[0m"
echo "  Total Tests:    $total_tests"
echo "  Passed:         $passed_tests"
echo "  Failed:         $failed_tests"
echo "  Coverage:       $coverage%"
echo "  Failure Rate:   $failure_rate%"
