export const FIRST_STATIC_YEAR = 1900;
export const LAST_STATIC_YEAR = 2100;

export function defaultYear(today = new Date()) {
  return today.getFullYear() + (today.getMonth() === 11 ? 1 : 0);
}

export function calendarRows(year) {
  const months = Array.from({ length: 12 }, (_, month) => {
    const date = new Date(0);
    date.setUTCFullYear(year, month, 1);
    const firstDay = (date.getUTCDay() + 6) % 7;
    date.setUTCMonth(month + 1, 0);
    return { firstDay, days: date.getUTCDate() };
  });

  const rowCount = Math.max(...months.map(({ firstDay, days }) => firstDay + days));
  return Array.from({ length: rowCount }, (_, row) =>
    months.map(({ firstDay, days }) => {
      const day = row - firstDay + 1;
      return day >= 1 && day <= days ? day : '';
    }),
  );
}

export function yearUrl(base, year, query) {
  const params = new URLSearchParams(query);
  params.delete('year');
  const path = base.endsWith('/') ? base : base + '/';

  // shortcut: only 1900–2100 have short URLs. Extend the range if more years need their own pages.
  if (year < FIRST_STATIC_YEAR || year > LAST_STATIC_YEAR) {
    params.set('year', year);
  }

  const search = params.size ? '?' + params : '';
  return params.has('year') ? path + search : path + year + '/' + search;
}
