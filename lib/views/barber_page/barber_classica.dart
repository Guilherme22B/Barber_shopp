import 'package:flutter/material.dart';
import 'package:myapp/views/book/book_page.dart';
import 'package:myapp/views/reserva/reserva_page.dart';
import '../../widgets/main_layout.dart';

class BarberClassicaPage extends StatelessWidget {
  const BarberClassicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: Column(
        children: [
          // Cabeçalho com imagem e ícones sobrepostos
          Stack(
            children: [
              // Imagem de fundo
              Image.network(
                "data:image/jpeg;base64,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",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.black.withOpacity(0.3),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Clássic Cortez',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 4.0),
                        Text('Rua Castro Alves, 331, São Paulo'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 4.0),
                        Text('5.0 (679 avaliações)'),
                      ],
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'SOBRE NÓS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Bem-vindo à Clássic Cortez, onde tradição encontra estilo. Nossa equipe de mestres barbeiros transforma cortes de cabelo e barbas em obras de arte. Em um ambiente acolhedor, promovemos confiança, estilo e uma comunidade unida.',
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'SERVIÇOS',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    const SizedBox(height: 10.0),
                    const ServiceCard(
                      barbershopName: 'Clássic Cortez',
                      imageUrl:
                          "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBw8SEBUQDxAQDxAVFRUVEA8PEA8PDxUVFRUWFhUVFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGBAQFy0dHR0tKystLS0rLS0rLS0tLSstLS0rLS0tLS0rLS0tKystLS0rLS0tLS0tLS0tNzcrLSstK//AABEIALcBEwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAABBAACAwUGB//EADwQAAIBAgMFBQUHAwMFAAAAAAABAgMRBCExBRJBUXEiMmGBsQYTkaHBFCNCYtHh8DNScjRz8SRDY6Ky/8QAGAEAAwEBAAAAAAAAAAAAAAAAAAECAwT/xAAkEQEBAAIBBAMAAgMAAAAAAAAAAQIRMQMhMkESUYEiQgQTcf/aAAwDAQACEQMRAD8A+OkCyCABSGKOGUlduxethoxi3dt5JZ5fy1xfJXwutlEgyLIrMpCpCEA2mG70eqPb0KsHBLeVzwsTWNea0kwTZt7OST0aKSpnlIY+quIxDbNRaj2XxYbUXbEjfEVnN3ZghKj6B7Mw+58hD2xh90uorsj2hjShuvpoU9oNsQrUlGOtx+kau3nENYTvPoKjWF776EtArrMvhSuI1L4QpK+JQtT1G8UKw1GDjjkJyQ+u6IT1EDGFiuRMUg4UmKAFYLMbegrDUbayAE5LMKJPUMQCn4kZz1fU1j3l1MqvefUXtU4NbMV3P/bkKjWzdZ/4MVFOarLiBYgSDQ0jRkaRwj4sagjRMy+VdE6c9q0oWSSF9oz0jyzf0+ozXxKgss2cuUm22829R4z2XUykmoKIlcCLUzVgDpgdM3sSwjL7jBZjNiKIAvZgzOgoqxjOIFsqAZ3Qe7Ay9yG3uiVKdlcAxG8N3/IUG8N3/IXsegxOpfCFcTqHC6lJbYrQVhqN4nQUhqAPx7ojU1H490QqajBjCkxRMKTFAC0NRx6CcNRzgIFJ6kiSYYgFPxLqZ1e8+po12l1M63efUV5VODWylnP/AG5Co7sSN5zX/jl6CYpzTy8YBAkK0l1EgSw2jba555WNaELt7s47v4ZNStLokm7876D9DZsZu9WW9BZuKW7F2/ub4eX6GUxrpy6mOnnMZSlGSTd04qUXaz3ZaXXAyRttDE+9rTqZWlLs2ulupKMf/VIxNHNUCpWACQwLrMCnJuyTb5JNv4IqzobDxG7NrnYm3SpNqQwOJa3lRqNJXdoO9udtReFc9BLHVqdWLSck1+G9/gZ7Q2VTqTjKk3SlL+rCSvFS/ujbnxQpkrLp/TkxxKA6qNcZsirTk4u0uUlezT4issNNcCts9Nd9B3kLOlLkwWfJgDQMR3TCNy263qAUjG+rt8WM05xUt7N+FrGLIpAbSct53tY0w6s9USnbkXdOyyzXwsMl8Q01lmKR1L3t4+BWOuQyPw7ohU1H4d0RqagG+FDiiuFLYoQKw1HVoJR1HFoAKT1DAlTUMBhT8S6meI70uprPvLqZYnvPqTeVTh0fZp/ez/2p+hzh3YMrVX/hP0ExY+VVn4T9QhCFs3cp1lGK3YWWi7T59Cu1MTNUXfLee6kr582/K/yNMNVp21ulyTv87HK2tjFVmty6hFWV+L4v0+A7qRE3aSiiwEEloKBMKKzYgolfJanpMDshRipuGfFybb+F7HDwcc95+X6nbp462ra5EZ1rhjtpVluvN+HJCeK2io5xkm1wVtL5jf2rnL4mUMRTbcaig1+ZJmbb/joYbakasEp2fJ8UMQw0JK6s0cV4XDX+7cqbvwk3B+UjvbJpxUZ3qQt3kpPdbySaXBvLmXiy6uO5vXdk8DDkc3bXu6MV2bzl3Vytq2ek92eO9rH/ANTbgqcV85P6mjnjmQfE2srC0GaRBYe6b4B90/3LqT4Nlt9iCQT4lpTyKxmCUsrAaSZlJ2eRZvgRoeyP4ed4+PETq6lsDO07c0/1+gK2pSWuFL4sphS+KAFY6jkdBOOo5DQAUqahgCpqSAAKuqM8T3mXqaopie8ybyqcHPZ+G9Wt+SXoJnR9lV/1KX5Z+hzicfKry8J+oEhDRk0xldNtQvu8W+Ph0FkiBuTacmhAGEW8opvorna9nMJL3snKEXNU5Tp78FVjGUbZuD7L11le1tG7IAQls2pFJ1F7tSScb5yknyX/AB8ytbCRv2JynHjKUFT8UklKV3bxyaZ0toTVablOXvHFtNuc6m9lCzd0lbVpLJXMJ1XJWby4Lgugsrq6OTZW3BZLgMRpvik8rO+jXg+DMIqzOhSzWRnlW+ELU8N24pXlFuzUtV1R67aGwKUsOl7uMVa+9FKLT53PPe5drpaZ5OzMcbUnJfeSlK398nL4JvIcy0WfTtu5SG0Nmzo5qcakOEoTi5LwnFO8fT0MKWKqLSTtyea6DVKtJ5U4SnbVQg5v5IvLZ9SpK1OlONSzvGUXC9uqSuVO/pF7e3otj7ep1bQqWpVOD0hLo+DOH7XUmsVK6t2Yvys1f4p/A5dOjUlP3cYS95e3u7WnvLO1nnfw1LYrFzqSi56xioeUW8vDVlstd2CLlZLigpiU0RGytywgNwXAT9v56DCL1zYzGHDh/P2MYvlxH6NNvTVtE1WMKwjaUeq+QK2p0cVh920uO8vhoc6tqVjdxOc1WmFNMVoZ4TU1xmhSScdRyGgnHUchoAKVdSRDV1BEAFfgZ4nvPyNK5nie98PQm8qhz2d/1EekvQUY17P/AOoh5+jF5rN9X6inlVZeE/VSEIWzbU8C/wAUkvBZs2hQprhvP82fyNCKJjcm0xaxnbklyWSLRxsab32t7suKS92s21n26c1w4JP8y0eMjKrZppil7quPbTeWK3pvLdcrt2tubyUU7cW7KN7t8/Fq1KlnnkJ7zXVaZX00GYPezdrWe92t1rLp5l2brOXUaKouoY1HwEa0lvPcW7Hgrvl45+JVSa4sXxP5unCvJ9ni9Ls7exNn09/7yKqS4b2cV0joeShNp7yeY7R2rUjLeQ5jpOWVvZ6uEHDEWWSfBaD0cK3U3lqmeJltmo5qXIcw/tNUi72di2Vxrse0ODhUe9L7ucf+8spK2l3xs/2OPtDExxdoyjRWLhffxFLfj9pWb3pR094uNkm9c8zDHbUliFZ3SWb8eRybNZrJp5NZNNC2uY9hkmnZ/wDK8CWHqFanOKhUWaVk07PldcpfJmGJwsoWz3oPuVFpfk+T8B6G2IUBoiYjWQUgWNIRFs9LYalnb+ZHawdGzTtp9Tn4Wk3w/n8sdqnFxpynx4X1uzPKtunirWpOrenS7dRWbjdK1s7XeVzz1dNSaas02mnqmtUd72dsqzd7c382/mcPGT3qkpf3SlL4tv6l9P6T1pxVsLqa4vQywupti9DRgSiNx0E0OQ0AFquoIhq6ggACuZ4nveSNa5niu95ImqnBjYX+oh1fozKsu1Lq/Vh2S/vodfoCv35dX6sU8lXxihCELZn94DqGTkVbMNOnbSUzOdSxnOoYtlTFGWYvUks/oAsi2Sm4ybrGN0m6Blt1h3WM7pN0CK2ZLDe4DcAMcPK0vDQvVha6L7hWtL4iqpe2i9hmji3bdlp0umuTXEWOxhtjw3VOvUlFvSnTScvNv9A3otbc7FQjZShfgpRebT8Oa4fDmSjg6smkqdRt6dlr5vI9nhNlQhFNQUeTfbqZ56vQYw9WEbqK33yjml1kTc2uPSvt5OWyK0Ye8kk4rKVndx6+HS4aFNfqe1pwlO+8oWllKKT08W9V8DzePwkKU0oNuLV0nqs2rX49SdtJhFKdr5LX+WN9r192nCC1crvy1LbPw/H4CXtPeO4+RPNayamzOy6acZy5qXw0PP1tT0Oy6i+z1HHhF/M8/X1Nen7c/wDkcxfC6m+L0F8NqMYnQ0c5FDtPQSQ7S0AFauoIFq2pWABK5ninmuiNa+hjieHRE3k5w02V/Wh1Dil95L/J+rK7N/rQ/wAkaY5WqzX5peop5Lvj+sSEIWzXcykqjKEIkVckIEhSUDHUAVqINJVrA+0GNXUqBt/tBZYgWLQg3kgDf7Sg/aEUeCnyJ9iqcgDRV0VqNS080UeDnyBhINz3V5vkgEObLwt3vyWSeSfrY7lKnvPffDT9TLDUclbV/JDiVsvgjDLLbpwx0bw9eU5brdoo3q1qdJLeu3pCEVeTfgkctTktDoKlftNpZZvV/ETWQKmLqStvL3aeiylbr/yUxmBlPdmkpWXaak7+Fo/H4mNfFt3jSV3naUtG/wBDi4LaeMnJwSSnHvRk2pO3lZDh36d2krZIy2xhPeRtxRvhq05xTqU/d1FdNXi0+Tun1BUna5PtrO8cXC4adKlNTtZqyzu9UcmvqdraVe9o+Pp/EcavqdHT4cHXv8tfSYfUYr6C9DUYraFsSQ5R0FBuhoAL19SsC9fUpAAtiNDHFfh6G9bQXr/h6E04ts12rU3+ePqMbW/r1P8AOXqKYV2nF/mXqM7Sf30+pM8l3w/S4QBNGalyECI0IAIEhaOpUMdQCtbUoXq6lBKQd2PG9VJiQ/sP+srgK9TXw6RjuLkhzaEoxW82kks23ZHNWI3sqav+Zp28kHCZLeF66iou6XgKYLBclm85HRp4N96Xafj9OAxSp2aaVvAzyyb9Pp6ZU6G7p5ghBN5nQxFBPNZK3wZzqk7aZcGtbNaoydExatZZC1SUu7vNPgXliIwV27Li+CR5jEbVqSm5R7Mfwx1sl9eJWOOyyzmPLoR+0U/e7slJQW+t9XVs7xurWyTt08TOHtFU4wg+jlH9Tm1MZUle71VnbK6zy+Zika/Ge2F6l3/GvRUvaSH46cov8rUl9AVNv0pZbtRLm1H52Z5+xVoXwg/35uzUqqcrxd4rJMTxCzMMPVlHT4PQs6retvI0nZjld3bShqMVdBejqMVNBkTY1QFWNUADLEamcDTEamcADSr3RatpHoMVNBet3Y+ZNOKUe8uq9Rra8d2tJdPRClPVdUP7fX38ukf/AJRP9l/1pNSIZkL2jS6YSlgoQWIRMlhhAx1KhTzABV1KBqPMqnwWb5LURiaYabUk46+Behgakno4rnJP0O7gtlxhwz4yeorVTG0acqlRJTyX9v6nWw2HUUZ0YRjwNnMzuTbHD6Wc8/AvGSs7isqljPEVlGLlJ2S1uZ27bzGSNquNST4I4dbaMbtuSWmWrbWXpY5WPxsqr5QvlH6sWSNMen9sMut37GcbjZVMtIrhz8WLEIayaYW296KLJlUQCWaDYifMta+gErEtJ2BuPk/gHddhhenPiv2N/tCas1Z/FCsYsunzGQsYoituRelWcdVdeGoBpiDGJrVknmncyiAaT0F6ndXmMT0Fp91dWLI4zWo7tj+p5R9BE62ISdTP+yJF5aTxrlWAdPdiQe0/FzyACMhJcq2O4LZ06mb7Eeb1fRBvQmNy4KJNuyV2dLC7I3s5T8or6s61HDU4Q3IrJ63zb6gpK3Qzuf03nR1ywhsahxTb8ZP0GqWGpw7sUuisXYCfk0nTjSm0XUjBlkxWqmDa5nOrZW4mVStYypZu7JXrTeGm8zgbax2/Lci+ytfF/sM7Y2hbsQefFrh+5xEjTDH3XP1up/WCQhDVzoGwAgALJAaLIALIQgEKbDvsqQAs5sFwBACHeKgGF00WTM7EAm8tBeXd8y8ZcCUYObUFq2FOFzo4p5xfOnESrU922rvfhZG9ea7Dem6tCLyuXtU3yGO8vEgaG1C1ODk7IJB3gpN10MJhIJ3fafjp5I6cKhCGN7uvGScLqYYshBNF2wbwSCAX5mVWvwRCAbJPixbG43cjl3npy6kIVjO7PqWzHs4t75vNviQhDdxIQBACyCiEACiWCQCAhCABIQgBCEIAQISDgAhCDIC1BS3ko955LO2uRCCM1t6hOnUVOb7UYLS1s+QpX7segSEqnFaQwFVpNJWeazRCEGT/2Q==",
                      serviceName: 'Corte de Cabelo',
                      serviceDescription:
                          'Estilo personalizado com as últimas tendências.',
                      price: 'R\$ 50,00',
                    ),
                    const ServiceCard(
                      barbershopName: 'Clássic Cortez',
                      imageUrl: 
                      "data:image/jpeg;base64,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",
                      serviceName: 'Barba',
                      serviceDescription:
                          'Modelagem completa para destacar sua masculinidade.',
                      price: 'R\$ 45,00',
                    ),

                    Divider(),

                    const SizedBox(height: 16.0),
                    const Text(
                      'CONTATO',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ContactCard(
                      phoneNumber: '(11) 98204-5108',
                    ),
                    ContactCard(
                      phoneNumber: '(11) 99503-2351',
                    ),
                    const SizedBox(height: 16.0),
                    const Center(
                      child: Text(
                        ' 2023 Copyright FSW Barber',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ); // Correção aplicada aqui
  }
}

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String serviceName;
  final String serviceDescription;
  final String price;
  final String barbershopName;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.serviceName,
    required this.serviceDescription,
    required this.price,
    required this.barbershopName
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(serviceDescription),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton( onPressed: () { 
                        Navigator.push( context, 
                         MaterialPageRoute( builder: (context) => BookPage(
                            barbershopName: barbershopName,
                            barbershopImageUrl: imageUrl,
                         ), 
                      ), 
                    ); 
                  }, 
                      child: const Text("Reservar"), 
                      ), 
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String phoneNumber;

  const ContactCard({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.phone),
        title: Text(phoneNumber),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10), 
            side:
                const BorderSide(color: Colors.white, width: 1), // Borda branca
            shape: RoundedRectangleBorder(
              // Faz o botão quadrado
              borderRadius:
                  BorderRadius.circular(10), // BorderRadius 0 para cantos retos
            ),
          ),
          child: const Text(
            'Copiar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// botoes superiores
class PulsingIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const PulsingIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  _PulsingIconButtonState createState() => _PulsingIconButtonState();
}

class _PulsingIconButtonState extends State<PulsingIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed && _isHovered) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.stop();
          _animationController.value = 1.0;
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: _isHovered ? 10 : 0,
                    spreadRadius: _isHovered ? 2 : 0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(widget.icon, color: Colors.white),
                onPressed: widget.onPressed,
              ),
            ),
          );
        },
      ),
    );
  }
}