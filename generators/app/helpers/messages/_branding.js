const chalk = require('chalk')

const branding = (version, author, website, repoURL) => {
    return `${chalk.styles.magenta.open}

                                                      dddddddd                                             
                                                      d::::::dhhhhhhh                                      
                                                      d::::::dh:::::h                                      
                                                      d::::::dh:::::h                                      
                                                      d:::::d h:::::h                                      
                                              ddddddddd:::::d  h::::h hhhhh                                
                                            dd::::::::::::::d  h::::hh:::::hhh                             
                                           d::::::::::::::::d  h::::::::::::::hh                           
                                          d:::::::ddddd:::::d  h:::::::hhh::::::h                          
                                          d::::::d    d:::::d  h::::::h   h::::::h                         
                                          d:::::d     d:::::d  h:::::h     h:::::h                         
                                          d:::::d     d:::::d  h:::::h     h:::::h                         
                                          d:::::d     d:::::d  h:::::h     h:::::h                         
                                          d::::::ddddd::::::dd h:::::h     h:::::h                         
                                           d:::::::::::::::::d h:::::h     h:::::h                         
                                            d:::::::::ddd::::d h:::::h     h:::::h                         
                                             ddddddddd   ddddd hhhhhhh     hhhhhhh                           
                                                                                                        
            ${chalk.styles.magenta.close}
            ${chalk.styles.yellow.open}                                                               
                                        • • • dhBoilerplate made with love & help • • •      
                                                                                                   
            ${chalk.styles.yellow.close}
            ${chalk.styles.cyan.open}
                            ---------------------------------------------------------------------          
                                                                                                         
                            Version  :   ${version}
                            Author   :   ${author}                                                   
                            Website  :   ${website}                                         
                            Github   :   ${repoURL}          
                                                                                                         
                            ---------------------------------------------------------------------          
                                                                                                         
                                                                                                         
                                                                                                         
                                                                                                         
                                                                                                         
            ${chalk.styles.cyan.close}
           `
}

module.exports = branding
