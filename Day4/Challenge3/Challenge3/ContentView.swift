//
//  ContentView.swift
//  Challenge3
//
//  Created by Vinícius Couto on 28/05/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ContentViewModel = .init()
    
    var body: some View {
        MainView(recipes: viewModel.recipes)
            .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
            .onAppear{ viewModel.fetchRecipes() }
    }
}

class ContentViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    private let service: RecipeService = RecipeService()
    
    func fetchRecipes() {
        service.fetchRecipes(then: handleFetchService)
    }
    
    private func handleFetchService(result: Result<[Recipe], Error>) {
        switch result {
        case .success(let conferences):
            self.recipes = conferences
        default:
            self.recipes = []
        }
        
        self.objectWillChange.send()
    }
    
}

class RecipeService {
    
    func fetchRecipes(then handle: (Result<[Recipe], Error>) -> Void ) {
        
        // No API to consume so we just declare the data instead
        let data = [
            Recipe(name: "Capuccino",
                   author: "Tudo Gostoso",
                   portions: 15,
                   rating: 3,
                   difficulty: 3,
                   preparationTime: 15,
                   ingredients: [
                    "400 g de leite em pó integral",
                    "230 g de açúcar",
                    "50 g de café solúvel",
                    "5 colheres (sopa( de chocolate em pó",
                    "1 colher (sopa( bicarbonato de sódio",
                    "1 colher (chá) de canela em pó",
                   ],
                   preparationSteps: [
                    "Misture no liquidificador o leite em pó e o café solúvel. Coloque a mistura em um recipiente com tampa e acrescente os outros ingredientes.",
                    "Agite vigorosamente o recipiente até que a mistura esteja homogênea. Reserve.",
                    "Acrescente 3 colheres (sopa) cheias de capuccino à 190 ml de água e misture bem até ficar cremoso. A dica é adicionar chantilli e cobertura de chocolate por cima",
                   ],
                   imageName: "capuccino"),
            Recipe(name: "Guacamole",
                   author: "Rita Lobo",
                   portions: 4,
                   rating: 4,
                   difficulty: 1,
                   preparationTime: 10,
                   ingredients: [
                    "4 avocados maduros",
                    "1 tomate maduro",
                    "caldo de 1 limão",
                    "2 colheres (sopa) de azeite",
                    "coentro picado a gosto",
                    "sal e pimenta-do-reino moída na hora a gosto",
                   ],
                   preparationSteps: [
                    "Lave e seque os avocados, o tomate e o coentro. Com a faca, corte o avocado ao meio, no sentido do comprimento, e descarte o caroço. Descasque, corte cada metade em cubos e transfira para uma tigela.",
                    "Regue o avocado com o caldo de limão e amasse com um garfo até formar um purê rústico.",
                    "Corte o tomate ao meio, descarte as sementes, e corte as metades em cubos pequenos. Pique grosseiramente as folhas de coentro. Junte ao avocado amassado, tempere com o azeite, sal e pimenta a gosto. Misture bem e sirva imediatamente.",
                   ],
                   imageName: "guacamole"),
            Recipe(name: "Pizza",
                   author: "Panelinha",
                   portions: 4,
                   rating: 5,
                   difficulty: 2,
                   preparationTime: 120,
                   ingredients: [
                    "6 xícaras (chá) de farinha de trigo (cerca de 840 g)",
                    "2 colheres (sopa) de fermento biológico seco (20 g)",
                    "2 colheres (chá) de açúcar",
                    "2 colheres (chá) de sal",
                    "2 ½ xícaras (chá) de água morna",
                    "¼ de xícara (chá) de azeite",
                    "farinha de trigo para polvilhar a bancada",
                    "azeite para untar a tigela",
                   ],
                   preparationSteps: [
                    "Numa tigela, misture o fermento e o açúcar. Regue com a água morna e, com uma colher, misture bem para dissolver. Deixe em temperatura ambiente até espumar – cerca de 5 minutos.",
                    "Enquanto isso, na tigela da batedeira, misture a farinha com o sal e abra um buraco no centro. Separe uma tigela ou outro recipiente grande e unte com 2 colheres (sopa) de azeite – ela tem que ter espaço suficiente para a massa crescer bastante.",
                    "Assim que espumar, despeje a mistura de fermento no centro da tigela com farinha. Adicione ¼ de xícara (chá) de azeite e misture, com uma espátula, apenas para incorporar.",
                    "Para sovar a massa: encaixe a tigela na batedeira com o gancho; comece a bater em velocidade baixa por 5 minutos; aumente a velocidade, aos poucos, para alta e deixe bater por mais 15 minutos até formar uma massa lisa – ela vai descolar da lateral da tigela e formar uma bola no gancho da batedeira.",
                    "Com as pontas dos dedos (ou uma espátula), desgrude a massa da tigela da batedeira e transfira para o recipiente untado com azeite. Cubra com filme e deixe descansar por 1 hora, até crescer e dobrar de volume.",
                    "Quando faltar 30 minutos para completar o tempo de crescimento da massa, preaqueça o forno a 250 ºC (temperatura alta). Se for utilizar uma assadeira de pedra sabão, coloque-a dentro do forno ainda frio para aquecer desde o início – caso contrário, ela pode rachar com o choque térmico.",
                    "Polvilhe uma bancada lisa com farinha de trigo; transfira a massa de pizza para a bancada e, com uma espátula (ou faca) divida em 4 porções. Separe uma porção da massa para abrir e cubra o restante com um pano de prato para não ressecar.",
                    "Com o rolo de macarrão, abra a massa formando um círculo de cerca de 30 cm de diâmetro – lembre-se de sempre polvilhar a bancada com farinha para a massa não grudar. Antes de levar ao forno para assar, escolha uma receita!",
                   ],
                   imageName: "pizza"),
        ]
        
        if data is [Recipe] {
            handle(.success(data))
        }
        else {
            handle(.failure(MyError.InvalidData))
        }
        
    }
}

enum MyError: Error {
    case InvalidData
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
