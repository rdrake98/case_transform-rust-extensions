# frozen_string_literal: true
require 'test_helper'

describe CaseTransform do
  describe 'Transforms' do
    describe 'camel' do
      it 'transforms to camel case (PascalCase)' do
        obj = Object.new
        scenarios = [
          {
            value: { :"some-key" => 'value' },
            expected: { SomeKey: 'value' }
          },
          {
            value: { someKey: 'value' },
            expected: { SomeKey: 'value' }
          },
          {
            value: { some_key: 'value' },
            expected: { SomeKey: 'value' }
          },
          {
            value: { 'some-key' => 'value' },
            expected: { 'SomeKey' => 'value' }
          },
          {
            value: { 'someKey' => 'value' },
            expected: { 'SomeKey' => 'value' }
          },
          {
            value: { 'some_key' => 'value' },
            expected: { 'SomeKey' => 'value' }
          },
          {
            value: :"some-value",
            expected: :SomeValue
          },
          {
            value: :some_value,
            expected: :SomeValue
          },
          {
            value: :someValue,
            expected: :SomeValue
          },
          {
            value: 'some-value',
            expected: 'SomeValue'
          },
          {
            value: 'someValue',
            expected: 'SomeValue'
          },
          {
            value: 'some_value',
            expected: 'SomeValue'
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
              { SomeValue: 'value' }
            ]
          }
        ]
        scenarios.each do |s|
          result = CaseTransform.camel(s[:value])
          assert_equal s[:expected], result
        end
        assert_nil(CaseTransform.camel(nil))
      end
    end
  end
end
