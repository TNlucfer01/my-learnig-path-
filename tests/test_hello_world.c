#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>

void test_hello_world(void) {
    CU_ASSERT_STRING_EQUAL("Hello, World!", "Hello, World!");
}

int main() {
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("Hello World Suite", 0, 0);
    CU_add_test(suite, "test_hello_world", test_hello_world);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return 0;
}