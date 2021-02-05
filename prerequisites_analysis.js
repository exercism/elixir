// TODO: delete me, this is a throw-away script
const fs = require('fs')
const config = JSON.parse(fs.readFileSync('config.json'));
const conceptSlugs = config.concepts.map(x => x.slug)

function uniq(value, index, self) {
  return self.indexOf(value) === index;
}

const conceptsThatArePracticed = config.exercises.practice.reduce((acc, x) => [...x.practices, ...acc], []).filter(uniq)
const conceptsThatArePrereq = config.exercises.practice.reduce((acc, x) => [...x.prerequisites, ...acc], []).filter(uniq)

const conceptsThatAreNotPracticed = conceptSlugs.filter(x => !conceptsThatArePracticed.includes(x))
const conceptsThatAreNotPrereq = conceptSlugs.filter(x => !conceptsThatArePrereq.includes(x))

console.log('Concepts that are not practiced by any exercise:')
console.log(conceptsThatAreNotPracticed)

console.log('\n\nConcepts that are not required by any exercise:')
console.log(conceptsThatAreNotPrereq)

console.log('\n\n============================================')

console.log('\n\nConcepts and their practice exercises:')

conceptSlugs.forEach(concept => {
  console.log('~*~*~*~ ' + concept + ' ~*~*~*~')
  console.log('\nPracticed by:')
  console.log(config.exercises.practice.filter(x => x.practices.includes(concept)).map(x => x.slug))
  console.log('\nRequired by by:')
  console.log(config.exercises.practice.filter(x => x.prerequisites.includes(concept)).map(x => x.slug))
})
