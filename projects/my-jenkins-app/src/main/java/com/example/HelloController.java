@RestController
public class HelloController {

    private final BankService service;

    public HelloController(BankService service) {
        this.service = service;
                            }

        @GetMapping("/")
        public String hello() {
           return service.process();
     }
}
