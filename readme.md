# FOSS Brain Games
trying to implement Brain Games 

## Goals
- free
- open source
- customizable

## Game Ideas
- [Memory Games](https://play.google.com/store/apps/details?id=com.memory.brain.training.games&hl=en-US) from Maple Media


## Development
- colors from [ColorHunt](https://colorhunt.co/palettes/)
- icons form [SvgRepo](https://www.svgrepo.com/)

## Deployment
for deployment in **Github Page** you have to manually apply this changes:
- enter `mint build`
- rename `__mint__` to `assets`
- change all the occurance of `/__mint__` to `/repo_name/assets`

### in my case:
```sh
mv ./__mint__/ ./assets/
find ./ -type f -exec sed -i 's/__mint__/foss-spa-brain-games\/assets/g' {} +
```