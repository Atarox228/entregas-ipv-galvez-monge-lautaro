# entregas-ipv-galvez-monge-lautaro


# Anotaciones de clases

## UI
Una interfez esta diseñada para mostrar informacion revelante para el jugador, estan los distintos casos y esquinas: Sin interfaz, interfaz no informativa (WoW), interfaz informativa, interfaz en base a conocimiento adquirido, sin nada pero con tutoriales agregados

## Tipos de interfaces
   1. En el espacio del juego (que el jugador pueda interacctuar directamente) <br>
   2. En la historia del juego
  - Non-Diegetic(): Menu de rueda, Marcador de vida,[1.No ; 2.No] 
  - Spatial(espacial): El cristal de los Sims, Barras de vida sobre enemigos, camino marcado por flechas  [1.Si ; 2.No]
  - Meta(Menu reconocibles por los personajes): recuadro de conversacion con NPC, Scrolear Texto,  [1.No ; 2.Si]
  - Diegetic(Personaje reconoce su existencia y lo usa/interacctua): Mapa de Minecraft, Gadjets,  [1.Si ; 2.Si]

## UX

   1. Tipos de Accesibilidad + Inclusion
   - Exclusion 
   - Segregracion (Tener algo para cada tipo). Libros para ciegos(puranmente braile) y otros
   - Integracion (Caminos para gente ciega, semaforos con ruidos) Metodos para integrar a la minoria en el grupo de la mayoria
   - Inclusion (Todos juntos)

   2. A incluir
   - Vision
   - Escucha
   - Motriz
   - Cognitivo

# Sonido

## tipos de uso
   - crear atmosfera 
   - define el espacio
   - punto de atencion
   - contextual / narrativo

## Nodos utiles

   # AudioStreamPlayer
   1. Propiedades
      - D
      - 
   2. Formatos
      - .wav (muy pesado)
      - OGG file (como el mp3) peso minimo, audios de whatsapp
      - Manual Generation 
      - RandomPitch
      - Microphone
   3. Funciones
      - Tiene un mixer que permite mezclar buses, permite que puedas enlazar buses entre si y agregar efecto a cada bus
      - filtros para cada bus, tiene una gran lista
      - Conexiones entre buses y dependencia de buses con otros buses
      - hacer que los sonidos se conecten a señales para conectarlos con las acciones del jugador o en las mismas funciones de player
