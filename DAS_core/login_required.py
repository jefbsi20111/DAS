from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
class LoginRequiredMixin(object):
    """
    View mixin which requires that the user is authenticated.
    """
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(
              self, request, *args, **kwargs)
