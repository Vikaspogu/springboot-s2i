## Springboot S2I example

add `edit` access to jenkins `serviceaccount` for `vpogu-springboot` project

```bash
oc policy add-role-to-user edit system:serviceaccount:jenkins:jenkins -n vpogu-springboot
```
