require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrayAssignment < Neo::Koan
  def test_non_parallel_assignment
    names = ["John", "Smith"]
    assert_equal __(["John", "Smith"]), names
  end

  def test_parallel_assignments
    first_name, last_name = ["John", "Smith"]
    assert_equal __("John"), first_name
    assert_equal __("Smith"), last_name
  end

  def test_parallel_assignments_with_extra_values
    first_name, last_name = ["John", "Smith", "III"]
    assert_equal __("John"), first_name
    assert_equal __("Smith"), last_name
  end

  def test_parallel_assignments_with_splat_operator
    first_name, *last_name = ["John", "Smith", "III"]
    assert_equal __("John"), first_name
    assert_equal __(["Smith","III"]), last_name
  end

  def test_parallel_assignments_with_too_few_values
    first_name, last_name = ["Cher"]
    assert_equal __("Cher"), first_name
    assert_equal __(nil), last_name
  end

  def test_parallel_assignments_with_subarrays
    first_name, last_name = [["Willie", "Rae"], "Johnson"]
    assert_equal __(["Willie", "Rae"]), first_name
    assert_equal __("Johnson"), last_name
  end

  def test_parallel_assignment_with_one_variable
    first_name, = ["John", "Smith"]
    assert_equal __("John"), first_name
  end

  def test_swapping_with_parallel_assignment
    first_name = "Roy"
    last_name = "Rob"
    first_name, last_name = last_name, first_name
    assert_equal __('Rob'), first_name
    assert_equal __('Roy'), last_name
  end
end
