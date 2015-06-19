from DAS_core import login_required
from django.utils.decorators import method_decorator
from braces import views
class PermissionsRequiredMixin(object):
    
    required_permissions = ()

    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        if not request.user.has_perms(self.required_permissions):
            messages.error(
                request,
                'You do not have the permission required to perform the '
                'requested operation.')
            return redirect(settings.LOGIN_URL)
        return super(PermissionsRequiredMixin, self).dispatch(
            request, *args, **kwargs)

