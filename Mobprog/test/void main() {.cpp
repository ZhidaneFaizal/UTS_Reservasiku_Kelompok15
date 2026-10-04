void main() {

    runApp(const Myapp());
}

class Myapp extends statelesswidget {
    const Myapp({super.key});

    @override
    widget build(buildContext Context) {
        return materialApp(
            home : Scaffold(
                appBar: AppBar(title:const text('profile')),
                body: container(
                    margin: const Edgeinsets.all(20),
                    padding: const edgeinsets.all(100),
                    color:colors.brown.shade100,

                    child:const colum(
                    chiledren:[ 
                    text('My profile',
                    style:textstyle
                    (fontsize: 24, fontweight: fontweight.bold)
                    )
                    sizedbox(height: 20),
                    text('zhidan'),
                    sizedbox(height : 20),
                    text('zhidanfti')

                    sizedbox(height : 20),
                    row(
                        mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                        children:[
                            
                            expended(child:container(
                                padding: const edgeinsets.all(20),
                                color: colors.blue,
                         child:
                            
                            text('workout'),
                            ))
                            text('progress').
                        ]
                    
                    )
                ],
            )
                )
                body:const text('hello flutter'),
            
            )
        );
    }
}