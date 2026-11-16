import assert from 'node:assert/strict';
import test from 'node:test';
import { calendarRows, defaultYear, yearUrl } from '../src/calendar.js';

test('month columns start on the correct weekday and include leap day', () => {
  const rows = calendarRows(2024);
  assert.equal(rows.length, 37);
  assert.equal(rows[0][0], 1); // Monday, January 1
  assert.equal(rows[2][1], '');
  assert.equal(rows[3][1], 1); // Thursday, February 1
  assert.equal(rows[31][1], 29);
  assert.equal(rows[32][1], '');
  assert.equal(calendarRows(2100).filter((row) => row[1] !== '').length, 28);
});

test('the default calendar rolls over on December 1', () => {
  assert.equal(defaultYear(new Date(2026, 10, 30)), 2026);
  assert.equal(defaultYear(new Date(2026, 11, 1)), 2027);
});

test('year links respect the Pages base path and keep the short labels setting', () => {
  assert.equal(yearUrl('/yearlendar', 2027, 'short_days=true'), '/yearlendar/2027/?short_days=true');
  assert.equal(yearUrl('/yearlendar/', 1899, 'short_days=true'), '/yearlendar/?short_days=true&year=1899');
  assert.equal(yearUrl('/', 1900, 'year=1899'), '/1900/');
});
