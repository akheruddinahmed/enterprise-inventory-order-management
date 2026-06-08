package managementSystem.exceptionHandler;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandling {

//	---------------- RUNTIME EXCEPTION ----------------

	@ExceptionHandler(RuntimeException.class)

	public String handleRuntimeException(RuntimeException exception,

			Model model) {

		model.addAttribute("msg", exception.getMessage());

		return "error/error";
	}

//	---------------- NULL POINTER EXCEPTION ----------------

	@ExceptionHandler(NullPointerException.class)

	public String handleNullPointerException(NullPointerException exception,

			Model model) {

		model.addAttribute("msg", "Something went wrong");

		return "error/error";
	}

//	---------------- GENERAL EXCEPTION ----------------

	@ExceptionHandler(Exception.class)

	public String handleException(Exception exception,

			Model model) {

		model.addAttribute("msg", exception.getMessage());

		return "error/error";
	}

}