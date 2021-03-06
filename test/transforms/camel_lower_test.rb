# frozen_string_literal: true
require 'test_helper'

describe CaseTransform do
  describe 'Transforms' do
    describe 'camel_lower' do
      it 'transforms to lowerCamelCase' do
        obj = Object.new
        scenarios = [
          {
            value: { :"some-key" => 'value' },
            expected: { someKey: 'value' }
          },
          {
            value: { SomeKey: 'value' },
            expected: { someKey: 'value' }
          },
          {
            value: { some_key: 'value' },
            expected: { someKey: 'value' }
          },
          {
            value: { 'some-key' => 'value' },
            expected: { 'someKey' => 'value' }
          },
          {
            value: { 'SomeKey' => 'value' },
            expected: { 'someKey' => 'value' }
          },
          {
            value: { 'some_key' => 'value' },
            expected: { 'someKey' => 'value' }
          },
          {
            value: :"some-value",
            expected: :someValue
          },
          {
            value: :SomeValue,
            expected: :someValue
          },
          {
            value: :some_value,
            expected: :someValue
          },
          {
            value: 'some-value',
            expected: 'someValue'
          },
          {
            value: 'SomeValue',
            expected: 'someValue'
          },
          {
            value: 'some_value',
            expected: 'someValue'
          },
          {
            value: obj,
            expected: obj
          },
          {
            value: [
              { some_value: 'value' }
            ],
            expected: [
              { someValue: 'value' }
            ]
          }
        ]
        scenarios.each do |s|
          result = CaseTransform.camel_lower(s[:value])
          assert_equal s[:expected], result
        end
        assert_nil(CaseTransform.camel_lower(nil))
      end
    end
  end
end
