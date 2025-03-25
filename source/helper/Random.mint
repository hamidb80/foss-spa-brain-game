module Random {


    fun shuffleIndex(len: Number) {
        `
        [...Array(#{len}).keys()]
        .map(value => ({ value, sort: Math.random() }))
        .sort((a, b) => a.sort - b.sort)
        .map(({ value }) => value)
        ` as Array(Number)
    }
}